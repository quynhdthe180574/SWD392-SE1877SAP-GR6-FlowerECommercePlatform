
package dao;
import entity.Order;
import entity.Payment;
import util.DBConnection;
import java.sql.*;
import java.text.SimpleDateFormat;
import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;
import java.util.ArrayList;
import java.util.List;
import entity.OrderItem;
import util.DBContext;
public class OrderDAO {

    private String formatPayDate(String vnpayDate) {
        try {
            SimpleDateFormat input = new SimpleDateFormat("yyyyMMddHHmmss");
            SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return output.format(input.parse(vnpayDate));
        } catch (Exception e) {
            System.err.println("Lỗi format ngày: " + e.getMessage());
            return vnpayDate; // fallback
        }
    }

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

    public boolean updateOrderStatus(Order order) {
        String sql = "UPDATE [Order] SET status = ? WHERE order_id = ?";
        try (Connection conn = new DBConnection().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, order.getStatus());
            ps.setInt(2, order.getOrderId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // OrderDAO
    public int insertOrder(Order order) {
        int orderId = -1;
        String sql = "INSERT INTO [Order] (user_id, address_id, payment_id, order_date, ship_fee, total_price, status) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBConnection().getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getUserId());
// address_id
            if (order.getAddressId() == 0) {
                ps.setNull(2, java.sql.Types.INTEGER);
            } else {
                ps.setInt(2, order.getAddressId());
            }
// payment_id
            if (order.getPaymentId() == 0) {
                ps.setNull(3, java.sql.Types.INTEGER);
            } else {
                ps.setInt(3, order.getPaymentId());
            }
            ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            ps.setBigDecimal(5, order.getShipFee());
            ps.setBigDecimal(6, order.getTotalPrice());
            ps.setString(7, order.getStatus());
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error inserting order: " + e.getMessage());
            e.printStackTrace();
        }
        return orderId;
    }

      public void updatePaymentId(int orderId, int paymentId) throws Exception {
        String sql = "UPDATE [Order] SET payment_id = ? WHERE order_id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, paymentId);
            ps.setInt(2, orderId);
            ps.executeUpdate();
        }
    }

    public List<OrderItem> getOrderItems(int user_id) {
        List<OrderItem> orderItems = new ArrayList<>();
        String sql = "select p.name , oi.quantity , oi.unit_price , o.status , s.shop_name , p.image_url, o.order_date from [Order] o join  OrderItem oi on o.order_id = oi.order_id join Product p on oi.product_id = p.product_id join Shop s on s.shop_id = p.shop_id where o.user_id = ?";
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String productName = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double unitPrice = rs.getDouble("unit_price");
                String status = rs.getString("status");
                String shopName = rs.getString("shop_name");
                String imageUrl = rs.getString("image_url");
                Date date = rs.getDate("order_date");
                OrderItem orderItem = new OrderItem(productName, quantity, unitPrice, status, shopName, imageUrl, date);
                orderItems.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }
}
