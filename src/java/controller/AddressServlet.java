package controller;

import dao.AddressDAO;
import entity.Address;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/address-servlet")
public class AddressServlet extends HttpServlet {

    private final AddressDAO addressDAO = new AddressDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                String receiverName = request.getParameter("receiverName");
                String phone = request.getParameter("phone");
                String fullAddress = request.getParameter("fullAddress");
                boolean isDefault = "1".equals(request.getParameter("isDefault"));

                // Kiểm tra dữ liệu đầu vào
                if (receiverName == null || receiverName.trim().isEmpty() ||
                    phone == null || phone.trim().isEmpty() ||
                    fullAddress == null || fullAddress.trim().isEmpty()) {
                    out.print("{\"success\":false,\"message\":\"Vui lòng điền đầy đủ thông tin\"}");
                    return;
                }

                Address addr = new Address();
                addr.setReceiverName(receiverName.trim());
                addr.setPhone(phone.trim());
                addr.setFullAddress(fullAddress.trim());
                addr.setDefault(isDefault);

                Integer userId = (Integer) session.getAttribute("userId"); // Giả sử bạn lưu userId khi login

                if (userId == null) {
                    // CHƯA ĐĂNG NHẬP → Lưu tạm vào session
                    addr.setAddressId(-1); // Đánh dấu tạm
                    session.setAttribute("tempAddress", addr);
                    session.setAttribute("selectedAddressId", -1);
                    out.print("{\"success\":true,\"addressId\":-1}");
                } else {
                    // ĐÃ ĐĂNG NHẬP → Lưu vào CSDL
                    addr.setUserId(userId);
                    addressDAO.addAddress(addr); // Lưu + tự sinh addressId thật

                    // Xóa địa chỉ tạm nếu có
                    session.removeAttribute("tempAddress");
                    session.setAttribute("selectedAddressId", addr.getAddressId());

                    out.print("{\"success\":true,\"addressId\":" + addr.getAddressId() + "}");
                }
            }
            else if ("select".equals(action)) {
                String idParam = request.getParameter("addressId");
                if (idParam == null || idParam.isEmpty()) {
                    out.print("{\"success\":false,\"message\":\"Thiếu addressId\"}");
                    return;
                }
                int addressId = Integer.parseInt(idParam);
                session.setAttribute("selectedAddressId", addressId);
                out.print("{\"success\":true}");
            }
            else {
                out.print("{\"success\":false,\"message\":\"Action không hợp lệ\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\":false,\"message\":\"Lỗi: " + e.getMessage().replace("\"", "\\\"") + "\"}");
        } finally {
            out.flush();
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        response.getWriter().print("AddressServlet is running! OK!");
    }
}