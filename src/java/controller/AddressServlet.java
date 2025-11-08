// src/main/java/controller/AddressServlet.java
package controller;

import entity.Address;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/address-servlet")
public class AddressServlet extends HttpServlet {

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
                Address addr = new Address();
                addr.setAddressId((int)(System.currentTimeMillis() % 10000)); // ID tạm
                addr.setReceiverName(request.getParameter("receiverName"));
                addr.setPhone(request.getParameter("phone"));
                addr.setFullAddress(request.getParameter("fullAddress"));
                addr.setDefault("1".equals(request.getParameter("isDefault")));

                // Lưu vào session
                session.setAttribute("tempAddress", addr);
                session.setAttribute("selectedAddressId", addr.getAddressId());

                out.print("{\"success\":true,\"addressId\":" + addr.getAddressId() + "}");
            }
            else if ("select".equals(action)) {
                int addressId = Integer.parseInt(request.getParameter("addressId"));
                session.setAttribute("selectedAddressId", addressId);
                out.print("{\"success\":true}");
            }
            else {
                out.print("{\"success\":false,\"message\":\"Action không hợp lệ\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"success\":false,\"message\":\"Lỗi: " + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().print("AddressServlet is running! OK!");
    }
}