package controller;

import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import service.CartService;
import service.ProductService;

public class ProductListServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ProductListServlet: Session ID - " + request.getSession().getId());

        // Get products
        List<Product> products = productService.getAllProducts();
        System.out.println("ProductListServlet: Số sản phẩm từ Service - " + products.size());

        // Get cart size
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        int cartSize = cartService.getSessionCartSize(cart);
        System.out.println("ProductListServlet: Cart size - " + cartSize);

        // Set attributes and forward to JSP
        request.setAttribute("products", products);
        request.setAttribute("cartSize", cartSize);
        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}