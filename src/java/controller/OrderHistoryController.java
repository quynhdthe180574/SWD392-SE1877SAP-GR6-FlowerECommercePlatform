package controller;

import entity.OrderItem;
import entity.User;
import service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import entity.User;

@WebServlet("/history")
public class OrderHistoryController extends HttpServlet {

    private final OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUser_id();
        // Lấy toàn bộ order items của user
        List<OrderItem> orderItems = orderService.getOrderItems(userId);

        // Lấy param filter
        String status = request.getParameter("status");     // Pending / Processing / ...
        String dateFrom = request.getParameter("dateFrom"); // yyyy-MM-dd
        String dateTo = request.getParameter("dateTo");     // yyyy-MM-dd

        // Filter theo status (nếu có)
        if (status != null && !status.isEmpty()) {
            orderItems = orderItems.stream()
                    .filter(o -> status.equalsIgnoreCase(o.getStatus()))
                    .collect(Collectors.toList());
        }

        // Filter theo khoảng thời gian (nếu có)
        // Filter theo khoảng thời gian (nếu có)
        if ((dateFrom != null && !dateFrom.isEmpty()) || (dateTo != null && !dateTo.isEmpty())) {
            LocalDate fromDate = (dateFrom != null && !dateFrom.isEmpty())
                    ? LocalDate.parse(dateFrom)
                    : null;

            LocalDate toDate = (dateTo != null && !dateTo.isEmpty())
                    ? LocalDate.parse(dateTo)
                    : null;

            LocalDate finalFrom = fromDate;
            LocalDate finalTo = toDate;

            orderItems = orderItems.stream()
                    .filter(o -> {
                        if (o.getDateOrder() == null) {
                            return false;
                        }

                        java.util.Date d = o.getDateOrder();
                        LocalDate orderDate;

                        if (d instanceof java.sql.Date) {
                            // java.sql.Date hỗ trợ toLocalDate() trực tiếp
                            orderDate = ((java.sql.Date) d).toLocalDate();
                        } else {
                            // Trường hợp là java.util.Date bình thường
                            orderDate = d.toInstant()
                                    .atZone(ZoneId.systemDefault())
                                    .toLocalDate();
                        }

                        if (finalFrom != null && orderDate.isBefore(finalFrom)) {
                            return false;
                        }
                        if (finalTo != null && orderDate.isAfter(finalTo)) {
                            return false;
                        }

                        return true;
                    })
                    .collect(Collectors.toList());
        }

        // Sắp xếp mới nhất lên trước cho đẹp (optional nhưng nên có)
        orderItems = orderItems.stream()
        .sorted((o1, o2) -> {
            java.util.Date d1 = o1.getDateOrder();
            java.util.Date d2 = o2.getDateOrder();
            if (d1 == null && d2 == null) return 0;
            if (d1 == null) return 1;
            if (d2 == null) return -1;
            return d2.compareTo(d1); // mới nhất trước
        })
        .collect(Collectors.toList());


        request.setAttribute("orderItems", orderItems);
        request.getRequestDispatcher("orderhistory.jsp").forward(request, response);
    }
}