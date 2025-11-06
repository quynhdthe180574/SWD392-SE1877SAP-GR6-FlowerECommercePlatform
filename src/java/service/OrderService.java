package service;

import dao.OrderDAO;
import dao.OrderItemDAO;
import entity.Payment;
import java.sql.Timestamp;
import java.time.LocalDate;

public class OrderService {
    private final OrderDAO orderDAO;
    private final OrderItemDAO orderItemDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
        this.orderItemDAO = new OrderItemDAO();
    }

    public int createOrder(int userId, int addressId, double totalPrice, double shipFee) {
        return orderDAO.createOrder(userId, addressId, totalPrice, shipFee);
    }

    public boolean addOrderItem(int orderId, int productId, int quantity, double unitPrice) {
        return orderItemDAO.addOrderItem(orderId, productId, quantity, unitPrice);
    }
   
}