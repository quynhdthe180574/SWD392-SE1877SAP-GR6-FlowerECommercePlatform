/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author acer
 */

import entity.Shop;
import util.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShopDAO extends DBContext {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Lấy 5 shop mới nhất (thay cho "uy tín")
    public List<Shop> getReputableShops() {
        List<Shop> list = new ArrayList<>();
        String query = "SELECT shop_id, shop_name, avatar " +
                       "FROM Shop " +
                       "ORDER BY shop_id DESC " + // Lấy shop mới nhất
                       "LIMIT 5";
        try {
            ps = connection.prepareStatement(query);
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Shop s = new Shop();
                s.setShop_id(rs.getInt("shop_id"));
                s.setShop_name(rs.getString("shop_name"));
                s.setAvatar(rs.getString("avatar"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return list;
    }
    
    private void closeResources() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}