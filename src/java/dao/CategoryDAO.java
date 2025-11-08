/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author acer
 */


import entity.Category;
import util.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO extends DBContext {
    


    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
         // Sửa SQL
        try {
      String query = "SELECT category_id, name FROM Category";
            PreparedStatement ps = connection.prepareStatement(query);
                        ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Category c = new Category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
                // Đã XÓA set 'description'
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
      
        }
        return list;
    }
}
    
