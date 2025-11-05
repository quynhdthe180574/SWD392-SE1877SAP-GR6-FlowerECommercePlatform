package dao;

import entity.Product;
import util.DBConnection;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    /**
     * Lấy tất cả sản phẩm chưa bị xóa (is_deleted = 0)
     */
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = """
            SELECT 
                p.product_id,
                p.name,
                p.description,
                p.price,
                p.stock_quantity,
                p.image_url,
                ISNULL(c.name, 'Không xác định') AS categoryName,
                ISNULL(s.shop_name, 'Không xác định') AS shopName
            FROM Product p
            LEFT JOIN Category c ON p.category_id = c.category_id
            LEFT JOIN Shop s ON p.shop_id = s.shop_id
            WHERE p.is_deleted = 0
            ORDER BY p.product_id
            """;

        Connection conn = null;
        try {
            conn = new DBConnection().getConnection();
            if (conn == null) {
                System.err.println("[ProductDAO] LỖI: Không lấy được kết nối DB!");
                return products;
            }

            System.out.println("[ProductDAO] Đang truy vấn danh sách hoa...");

            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                int count = 0;
                while (rs.next()) {
                    count++;
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setCategoryName(rs.getString("categoryName"));
                    p.setShopName(rs.getString("shopName"));
                    products.add(p);
                }

                System.out.println("[ProductDAO] TÌM THẤY " + count + " SẢN PHẨM HOA!");

            } catch (SQLException e) {
                System.err.println("[ProductDAO] Lỗi khi thực hiện truy vấn:");
                e.printStackTrace();
            }

        } catch (Exception e) {
            System.err.println("[ProductDAO] Lỗi kết nối hoặc xử lý:");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    if (!conn.isClosed()) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return products;
    }

    /**
     * Lấy sản phẩm theo ID
     */
    public Product getProductById(int id) {
        String sql = """
            SELECT 
                p.product_id,
                p.name,
                p.description,
                p.price,
                p.stock_quantity,
                p.image_url,
                ISNULL(c.name, 'N/A') AS categoryName,
                ISNULL(s.shop_name, 'N/A') AS shopName
            FROM Product p
            LEFT JOIN Category c ON p.category_id = c.category_id
            LEFT JOIN Shop s ON p.shop_id = s.shop_id
            WHERE p.product_id = ? AND p.is_deleted = 0
            """;

        Connection conn = null;
        try {
            conn = new DBConnection().getConnection();
            if (conn == null) {
                System.err.println("[ProductDAO] LỖI: Không kết nối DB khi tìm ID " + id);
                return null;
            }

            System.out.println("[ProductDAO] Tìm sản phẩm ID: " + id);

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Product p = new Product();
                        p.setProductId(rs.getInt("product_id"));
                        p.setName(rs.getString("name"));
                        p.setDescription(rs.getString("description"));
                        p.setPrice(rs.getBigDecimal("price"));
                        p.setStockQuantity(rs.getInt("stock_quantity"));
                        p.setImageUrl(rs.getString("image_url"));
                        p.setCategoryName(rs.getString("categoryName"));
                        p.setShopName(rs.getString("shopName"));

                        System.out.println("[ProductDAO] TÌM THẤY: " + p.getName());
                        return p;
                    } else {
                        System.out.println("[ProductDAO] KHÔNG TÌM THẤY sản phẩm ID: " + id);
                    }
                }
            }

        } catch (SQLException e) {
            System.err.println("[ProductDAO] Lỗi SQL khi tìm ID " + id + ":");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[ProductDAO] Lỗi không xác định:");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try { if (!conn.isClosed()) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
        return null;
    }

    /**
     * Test kết nối và truy vấn (dùng trong main để kiểm tra)
     */
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProducts();
        System.out.println("Tổng sản phẩm: " + list.size());
        for (Product p : list) {
            System.out.println(p.getProductId() + " | " + p.getName() + " | Giá: " + p.getPrice());
        }
    }
}