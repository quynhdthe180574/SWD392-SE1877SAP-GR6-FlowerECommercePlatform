package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import service.CartService;

public class RemoveFromCartServlet extends HttpServlet {
    private final CartService cartService = new CartService();

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
            if (cart == null || !cart.containsKey(productId)) {
                out.print("{\"success\":false,\"message\":\"Sản phẩm không có trong giỏ hàng\"}");
                return;
            }
            cart.remove(productId);
            session.setAttribute("cart", cart);
            int cartSize = cartService.getSessionCartSize(cart);
            out.print("{\"success\":true,\"cartSize\":" + cartSize + "}");
        } catch (Exception e) {
            out.print("{\"success\":false,\"message\":\"Lỗi hệ thống\"}");
        }
    }
}