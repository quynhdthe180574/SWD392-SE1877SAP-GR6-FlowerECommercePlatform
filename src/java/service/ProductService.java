/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.ProductDAO;
import java.util.List;
import entity.Product;

/**
 *
 * @author ADMIN
 */
public class ProductService {

    ProductDAO dao = new ProductDAO();

    public List<Product> getAll() {
        return dao.getAllProducts();
    }

    public List<Product> getPage(int page, int PAGE_SIZE) {
        return dao.getProductsWithPagging(page, PAGE_SIZE);
    }

    public List<Product> searchProduct(String keyword) {
        return dao.search(keyword);
    }

    public List<Product> getProductCategory(int category) {
        return dao.getProductByCategoryId(category);
    }
}
