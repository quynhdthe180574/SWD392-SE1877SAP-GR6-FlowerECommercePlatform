package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ProductDAO;

@WebServlet("/api/category-count")
public class CategoryCountAPI extends HttpServlet {
    private final ProductDAO dao = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String catId = req.getParameter("categoryId");
        int count = 0;
        if (catId != null && !catId.isEmpty()) {
            try {
                count = dao.getProductCountByCategory(Integer.parseInt(catId));
            } catch (Exception e) {
                count = 0;
            }
        }
        resp.setContentType("application/json");
        resp.getWriter().print("{\"count\":" + count + "}");
    }
}