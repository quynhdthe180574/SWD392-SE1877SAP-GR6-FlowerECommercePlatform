package service;

import dao.ProductDAO;
import entity.Product;
import java.util.List;

public class ProductService {
    private final ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public Product getProductById(int productId) {
        return productDAO.getProductById(productId);
    }
    public List<Product> search(String keyword){
        return productDAO.search(keyword);
    }
}