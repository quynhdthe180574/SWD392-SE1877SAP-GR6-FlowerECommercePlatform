package service;

import dao.ProductDAO;
import entity.Product;
import java.util.List;

public class ProductService {
    private final ProductDAO productDAO = new ProductDAO();

    // 1. LẤY TẤT CẢ SẢN PHẨM
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    // 2. LẤY 8 SẢN PHẨM NỔI BẬT
    public List<Product> getFeaturedProducts(int limit) {
        return productDAO.getFeaturedProducts(limit);
    }

    // 3. ĐẾM SẢN PHẨM THEO DANH MỤC
    public int getProductCountByCategory(int categoryId) {
        return productDAO.getProductCountByCategory(categoryId);
    }

    // 4. LẤY SẢN PHẨM THEO ID
    public Product getProductById(int productId) {
        return productDAO.getProductById(productId);
    }

    // 5. LẤY SẢN PHẨM THEO DANH MỤC (dùng trong product-list)
    public List<Product> getProductsByCategory(int categoryId) {
        return productDAO.getProductsByCategory(categoryId);
    }
}