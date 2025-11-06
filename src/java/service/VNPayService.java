/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.OrderDAO;
import dao.PaymentDAO;
import util.VNPayConfig;
import jakarta.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;
import entity.Order;
import java.math.BigDecimal;

/**
 *
 * @author ADMIN
 */
public class VNPayService {

    private final OrderDAO orderDAO;
    private final PaymentDAO paymentDAO;

    public VNPayService() {
        this.orderDAO = new OrderDAO();
        this.paymentDAO = new PaymentDAO();
    }

    public String createPaymentUrl(HttpServletRequest req) throws Exception {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";
        long amount = Math.round(Double.parseDouble(req.getParameter("amount")) * 100);
        String bankCode = req.getParameter("bank_Code");

        OrderDAO orderDAO = new OrderDAO();
        int usertId = 1;
        Order order = new Order();
        order.setUserId(usertId);
        order.setShipFee(BigDecimal.valueOf(30000));
        order.setTotalPrice(BigDecimal.valueOf(amount / 100));
        order.setStatus("Pending");
        int orderId = orderDAO.insertOrder(order);

        String vnp_TmnCode = VNPayConfig.vnp_TmnCode;
        String vnp_TxnRef = String.valueOf(orderId);
        String vnp_IpAddr = VNPayConfig.getIpAddress(req);

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_ReturnUrl", VNPayConfig.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        String locate = req.getParameter("language");
        vnp_Params.put("vnp_Locale", (locate != null && !locate.isEmpty()) ? locate : "vn");

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        // build query string & hash
        List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        for (Iterator<String> itr = fieldNames.iterator(); itr.hasNext();) {
            String fieldName = itr.next();
            String fieldValue = vnp_Params.get(fieldName);
            if (fieldValue != null && !fieldValue.isEmpty()) {
                hashData.append(fieldName).append('=')
                        .append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8))
                        .append('=')
                        .append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8));
                if (itr.hasNext()) {
                    hashData.append('&');
                    query.append('&');
                }
            }
        }
//        String queryURL = query.toString();
        String vnp_SecureHash = VNPayConfig.hmacSHA512(VNPayConfig.secretKey, hashData.toString());
        query.append("&vnp_SecureHash=").append(vnp_SecureHash);
        return VNPayConfig.vnp_PayUrl + "?" + query.toString();
    }

    public boolean handleVNPayReturn(HttpServletRequest request) throws Exception {
        try {
             // --- 1️⃣ Thu thập toàn bộ tham số VNPay gửi về ---
            Map<String, String> fields = new HashMap<>();

            Enumeration<String> params = request.getParameterNames();
            while (params.hasMoreElements()) {
                String paramName = params.nextElement();
                String fieldName = URLEncoder.encode(paramName, StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(paramName), StandardCharsets.US_ASCII.toString());
                if (fieldValue != null && fieldValue.length() > 0) {
                    fields.put(fieldName, fieldValue);
                }
            }

            // Lấy chữ ký từ VNPay
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");

            // Bỏ các trường không cần hash
            fields.remove("vnp_SecureHashType");
            fields.remove("vnp_SecureHash");

            // Tính chữ ký
            String signValue = VNPayConfig.hashAllFields(fields);
            if (!signValue.equals(vnp_SecureHash)) {
                System.out.println("Invalid VNPay signature");
                return false;
            }

            // lấy thông tin giao dịch
            String orderId = request.getParameter("vnp_TxnRef");
            String transactionStatus = request.getParameter("vnp_TransactionStatus");
            String amountParam = request.getParameter("vnp_Amount");
            BigDecimal totalPrice = BigDecimal.ZERO;
            
             long amount = Long.parseLong(amountParam) / 100; 
            boolean isSuccess = "00".equals(transactionStatus);
            if (isSuccess) {
                int orderIdInt = Integer.parseInt(orderId);
//                int userId = 1; // TODO: lấy từ session sau
                int paymentId = paymentDAO.insertPayment(1, orderIdInt, amount);
                orderDAO.updatePaymentId(orderIdInt, paymentId);
            }
            // Kiểm tra trạng thái giao dịch
            Order order = new Order();
            order.setOrderId(Integer.parseInt(orderId));
            order.setStatus(isSuccess ? "Completed" : "Failed");
            orderDAO.updateOrderStatus(order);

            return isSuccess;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }
}
