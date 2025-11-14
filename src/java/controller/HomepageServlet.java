package controller;

import entity.Category;        // THÊM DÒNG NÀY
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.CartService;
import service.CategoryService;
import service.ProductService;
import java.io.IOException;
import java.util.List;           // THÊM DÒNG NÀY
import java.util.Map;

@WebServlet("/homepage")
public class HomepageServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();
    private final CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Danh mục
        List<Category> categories = categoryService.getAllCategories();
        System.out.println("Homepage: Danh mục = " + categories.size()); // DEBUG
        request.setAttribute("categories", categories);
        

        // 2. 8 sản phẩm nổi bật
        List<Product> featuredProducts = productService.getFeaturedProducts(8);
        List<Product> p = productService.getAllProducts();
        request.setAttribute("list", p);
        System.out.println("Homepage: Sản phẩm nổi bật = " + featuredProducts.size()); // DEBUG
        request.setAttribute("featuredProducts", featuredProducts);

        // 3. Cart size
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        int cartSize = cartService.getSessionCartSize(cart);
        request.setAttribute("cartSize", cartSize);

        // 4. Forward
        request.getRequestDispatcher("/homepage.jsp").forward(request, response);
    }
}