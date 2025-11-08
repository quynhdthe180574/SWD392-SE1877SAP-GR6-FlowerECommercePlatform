/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

/**
 *
 * @author acer
 */


// Đảm bảo import đúng package entity của bạn
import entity.Category; 
import dao.CategoryDAO;
import java.util.List;

public class CategoryService {
    
    private CategoryDAO categoryDAO;

    public CategoryService() {
        this.categoryDAO = new CategoryDAO();
    }
    
    // Đây là hàm mà SearchController (lỗi 10) cần
    public List<Category> getAllCategories() {
        return categoryDAO.getAllCategories();
    }
}