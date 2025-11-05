package controller;

import dao.ProductDAO;
import entity.CartItem;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ViewCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        List<CartItem> cartItems = new ArrayList<>();
        double total = 0;
        int cartSize = 0;

        System.out.println("ViewCartServlet: Session ID - " + session.getId());
        System.out.println("ViewCartServlet: Cart from session - " + cart);

        if (cart != null && !cart.isEmpty()) {
            ProductDAO productDAO = new ProductDAO();
            for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();
                Product product = productDAO.getProductById(productId);
                System.out.println("ViewCartServlet: ProductID " + productId + " - Product: " + (product != null ? product.getName() : "null"));
                if (product != null) {
                    CartItem cartItem = new CartItem();
                    cartItem.setProductId(productId);
                    cartItem.setProductName(product.getName());
                    cartItem.setPrice(product.getPrice().doubleValue()); // Convert BigDecimal to double
                    cartItem.setQuantity(quantity);
                    cartItem.setImageUrl(product.getImageUrl());
                    cartItems.add(cartItem);
                    total += cartItem.getTotal();
                    cartSize += quantity;
                } else {
                    System.out.println("ViewCartServlet: Skipping ProductID " + productId + " because product is null");
                }
            }
        } else {
            System.out.println("ViewCartServlet: Cart is null or empty");
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("cartSize", cartSize);
        request.setAttribute("total", total);
        System.out.println("ViewCartServlet: CartItems size - " + cartItems.size() + ", Total - " + total + ", CartSize - " + cartSize);
        request.getRequestDispatcher("view-cart.jsp").forward(request, response);
    }
}