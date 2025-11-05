package controller;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            if (cart == null || !cart.containsKey(productId)) {
                out.print("{\"success\":false,\"message\":\"Sản phẩm không có trong giỏ hàng\"}");
                return;
            }

            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);
            if (product == null || product.getStockQuantity() < quantity) {
                int stock = product != null ? product.getStockQuantity() : 0;
                out.print("{\"success\":false,\"message\":\"Không đủ hàng! Còn: " + stock + "\"}");
                return;
            }

            if (quantity <= 0) {
                cart.remove(productId);
            } else {
                cart.put(productId, quantity);
            }

            session.setAttribute("cart", cart);
            int cartSize = cart.values().stream().mapToInt(Integer::intValue).sum();

            out.print("{\"success\":true,\"cartSize\":" + cartSize + "}");
        } catch (Exception e) {
            out.print("{\"success\":false,\"message\":\"Lỗi hệ thống\"}");
        }
    }
}