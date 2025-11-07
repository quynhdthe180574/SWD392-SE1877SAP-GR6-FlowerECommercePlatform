
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entity.OrderItem;
import util.DBContext;

public class OrderDAO extends DBContext {

    public List<OrderItem> getOrderItems(int user_id) {
        List<OrderItem> orderItems = new ArrayList<>();
        String sql = "select p.name , oi.quantity , oi.unit_price , o.status , s.shop_name , p.image_url, o.order_date from [Order] o join  OrderItem oi on o.order_id = oi.order_id join Product p on oi.product_id = p.product_id join Shop s on s.shop_id = p.shop_id where o.user_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
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