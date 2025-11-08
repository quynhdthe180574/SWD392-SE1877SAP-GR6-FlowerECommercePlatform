// src/main/java/controller/ViewCartServlet.java
package controller;

import dao.AddressDAO;
import entity.Address;
import entity.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import service.CartService;
import service.ProductService;

public class ViewCartServlet extends HttpServlet {
    private final CartService cartService = new CartService();
    private final ProductService productService = new ProductService();
    private final AddressDAO addressDAO = new AddressDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Có thể null

        // === GIỎ HÀNG ===
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        List<CartItem> cartItems = new ArrayList<>();
        double total = 0;

        if (cart != null && !cart.isEmpty()) {
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();
                entity.Product product = productService.getProductById(productId);

                if (product != null) {
                    CartItem cartItem = new CartItem();
                    cartItem.setProductId(productId);
                    cartItem.setProductName(product.getName());
                    cartItem.setPrice(product.getPrice().doubleValue());
                    cartItem.setQuantity(quantity);
                    cartItem.setImageUrl(product.getImageUrl());
                    cartItems.add(cartItem);
                    total += cartItem.getTotal();
                }
            }
        }

        // === LẤY ĐỊA CHỈ (chỉ nếu đã đăng nhập) ===
        List<Address> userAddresses = new ArrayList<>();
        if (userId != null) {
            userAddresses = addressDAO.getAddressesByUserId(userId);
        }

        // === SET DATA ===
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("total", total);
        request.setAttribute("userAddresses", userAddresses);

        request.getRequestDispatcher("/view-cart.jsp").forward(request, response);
    }
}