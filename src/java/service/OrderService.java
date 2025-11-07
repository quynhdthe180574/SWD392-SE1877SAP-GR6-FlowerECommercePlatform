package service;

import dao.OrderDAO;
public class OrderService {
    private OrderDAO orderDAO = new OrderDAO();

    public java.util.List<entity.OrderItem> getOrderItems(int userId) {
        return orderDAO.getOrderItems(userId);
    }
}
