/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import entity.Product;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends dal.DBContext {

    public List<Product> getAllProducts() {
        List<Product> p = new ArrayList<>();
        try {
            String sql = "select * from Product";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                p.add(product);
            }
        } catch (SQLException e) {
        }
        return p;
    }

    public List<Product> getProductByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where category_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getProductsWithPagging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Product order by product_id\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, page);
            stm.setInt(2, PAGE_SIZE);
            stm.setInt(3, PAGE_SIZE);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Product where name like ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalProducts() {
        try {
            String sql = "select count(product_id)  from Product ";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> getAllNewProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM Product ORDER BY product_id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public List<Product> getNewProductsByCateID(int c) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 2 * FROM Product where category_id = ? ORDER BY product_id desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, c);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAllProductsLast() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "SELECT TOP 4 * FROM Product ORDER BY product_id asc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                list.add(product);
            }
        } catch (SQLException e) {
        }
        return list;

    }

    public Product getProductById(int productId) {
        try {
            String sql = "select *  from Product where product_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setCategory_id(rs.getInt(2));
                product.setShop_id(rs.getInt(3));
                product.setName(rs.getString(4));
                product.setDescription(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setStock_quantity(rs.getInt(7));
                product.setImage_url(rs.getString(8));
                product.setIs_deleted(rs.getBoolean(9));
                return product;
        } catch (SQLException e) {
        }
        return null;
    }

}
