package controller;

import dao.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class ProductListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ProductListServlet: Session ID - " + request.getSession().getId());
        ProductDAO productDAO = new ProductDAO();
        List<Product> products = productDAO.getAllProducts();
        System.out.println("ProductListServlet: Số sản phẩm từ DAO - " + products.size());

        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        int cartSize = 0;
        if (cart != null) {
            cartSize = cart.values().stream().mapToInt(Integer::intValue).sum();
        }
        System.out.println("ProductListServlet: Cart size - " + cartSize);

        request.setAttribute("products", products);
        request.setAttribute("cartSize", cartSize);
        request.getRequestDispatcher("/product-list.jsp").forward(request, response);
    }
}