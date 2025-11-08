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
import entity.Shop; 
import dao.ShopDAO;
import java.util.List;

public class ShopService {
    
    private ShopDAO shopDAO;

    public ShopService() {
        this.shopDAO = new ShopDAO();
    }
    
    // Dùng cho HomeController
    public List<Shop> getReputableShops() {
        // Đã xóa logic về 'rating'
        return shopDAO.getReputableShops();
    }
}