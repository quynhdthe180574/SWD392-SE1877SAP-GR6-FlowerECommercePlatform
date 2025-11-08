// OrderDAO.java
package dao;

import util.DBConnection;
import java.sql.*;

public class OrderDAO {
    public int createOrder(int userId, int addressId, double totalPrice, double shipFee) {
        String sql = """
            INSERT INTO [Order] (user_id, address_id, order_date, ship_fee, total_price, status)
            VALUES (?, ?, GETDATE(), ?, ?, 'pending');
            SELECT SCOPE_IDENTITY();
            """;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, addressId);
            ps.setDouble(3, shipFee);
            ps.setDouble(4, totalPrice);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}