/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import util.DBConnection;

/**
 *
 * @author ADMIN
 */
public class PaymentDAO {
    // Lưu payment

    private String formatPayDate(String vnpayDate) {
        try {
            SimpleDateFormat input = new SimpleDateFormat("yyyyMMddHHmmss");
            SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return output.format(input.parse(vnpayDate));
        } catch (Exception e) {
            return vnpayDate;
        }
    }

    public int insertPayment(Integer userId, int orderId, long amount) throws Exception {
        String sql = "INSERT INTO Payment(user_id, order_id, amount, payment_date, payment_method) "
                + "VALUES (?, ?, ?, ?, ?)";
        int paymentId = -1;
        try (Connection conn = new DBConnection().getConnection(); 
         PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) { 

            if (userId != null) {
                ps.setInt(1, userId);
            } else {
                ps.setNull(1, java.sql.Types.INTEGER);
            }

            ps.setInt(2, orderId);
            ps.setLong(3, amount);

            // Sử dụng thời gian hiện tại cho payment_date
            ps.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis()));

            ps.setString(5, "VNPay");

            ps.executeUpdate();
            // Lấy payment_id tự tăng
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    paymentId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new Exception("Error inserting payment: " + e.getMessage(), e);
        }
         return paymentId;
    }

}
