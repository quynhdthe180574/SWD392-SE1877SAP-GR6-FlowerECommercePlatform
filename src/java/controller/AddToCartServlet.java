package controller;

import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import service.CartService;


public class AddToCartServlet extends HttpServlet {
    private final CartService cartService = new CartService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        // Get or create cart in session
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            // Add to cart using service
            cart = cartService.addToSessionCart(cart, productId, quantity);
            if (cart == null) {
                Product product = cartService.getProductById(productId);
                int stock = product != null ? product.getStockQuantity() : 0;
                out.print("{\"success\":false,\"message\":\"Không đủ hàng! Còn: " + stock + "\"}");
                return;
            }

            // Update cart in session
            session.setAttribute("cart", cart);
            System.out.println("AddToCartServlet: Session ID - " + session.getId());
            System.out.println("AddToCartServlet: Cart updated - " + cart);

            // Calculate cart size
            int cartSize = cartService.getSessionCartSize(cart);

            // Create JSON response
            Product product = cartService.getProductById(productId);
            String json = String.format(
                "{\"success\":true,\"productName\":\"%s\",\"cartSize\":%d}",
                product.getName().replace("\"", "\\\""),
                cartSize
            );
            out.print(json);
        } catch (Exception e) {
            out.print("{\"success\":false,\"message\":\"Lỗi hệ thống: " + e.getMessage() + "\"}");
            e.printStackTrace();
        }
    }
}