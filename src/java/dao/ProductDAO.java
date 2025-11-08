package dao;

import entity.Product;
import util.DBConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    // 1. LẤY TẤT CẢ SẢN PHẨM
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT product_id, name, price, image_url, description, stock_quantity
            FROM Product
            WHERE is_deleted = 0
            ORDER BY name
            """;

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setImageUrl(rs.getString("image_url"));
                p.setDescription(rs.getString("description"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. LẤY SẢN PHẨM THEO DANH MỤC
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT product_id, name, price, image_url, description, stock_quantity
            FROM Product
            WHERE category_id = ? AND is_deleted = 0
            ORDER BY name
            """;

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setDescription(rs.getString("description"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 3. LẤY 8 SẢN PHẨM NỔI BẬT
    public List<Product> getFeaturedProducts(int limit) {
        List<Product> list = new ArrayList<>();
        String sql = """
            SELECT TOP (?) product_id, name, price, image_url
            FROM Product
            WHERE is_deleted = 0
            ORDER BY NEWID()
            """;

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setImageUrl(rs.getString("image_url"));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 4. ĐẾM SẢN PHẨM THEO DANH MỤC
    public int getProductCountByCategory(int categoryId) {
        String sql = "SELECT COUNT(*) FROM Product WHERE category_id = ? AND is_deleted = 0";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 5. LẤY SẢN PHẨM THEO ID
    public Product getProductById(int productId) {
        String sql = """
            SELECT product_id, name, price, image_url, description, stock_quantity
            FROM Product
            WHERE product_id = ? AND is_deleted = 0
            """;

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setDescription(rs.getString("description"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}