/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author FPTSHOP
 */

import entity.User;
import service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserService service = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng tới login.jsp
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setFirst_name(request.getParameter("first_name"));
        user.setLast_name(request.getParameter("last_name"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));

        String result = service.register(user);

        if ("success".equals(result)) {
            response.sendRedirect("login.jsp?msg=success");
        } else {
            request.setAttribute("error", result);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
