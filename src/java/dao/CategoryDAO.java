package dao;

import entity.Category;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT category_id, name FROM Category ORDER BY name";

        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Category c = new Category();
                c.setCategoryId(rs.getInt("category_id"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.err.println("[CategoryDAO] Lỗi truy vấn:");
            e.printStackTrace();
        }
        return list;
    }

    // TEST NHANH
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> cats = dao.getAllCategories();
        System.out.println("Tổng danh mục: " + cats.size());
        cats.forEach(c -> System.out.println(c.getCategoryId() + " | " + c.getName()));
    }
}