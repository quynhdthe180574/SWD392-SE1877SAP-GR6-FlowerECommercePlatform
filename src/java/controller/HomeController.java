/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import entity.Product;
import entity.Shop;
import service.CategoryService;
import service.ProductService;
import service.ShopService;


/**
 *
 * @author acer
 */





// Đảm bảo import đúng package entity và service
import entity.Category;
import entity.Product;
import entity.Shop;
import service.CategoryService;
import service.ProductService;
import service.ShopService;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeController", urlPatterns = {"/home", ""})
public class HomeController extends HttpServlet {

    // Khởi tạo các service cần thiết
    private ProductService productService = new ProductService();
    private ShopService shopService = new ShopService();
    private CategoryService categoryService = new CategoryService(); 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

//        try {
//            // 1. Lấy dữ liệu sản phẩm mới (thay cho "nổi bật")
//            List<Product> featuredList = productService.getFeaturedProducts();
//            
//            // 2. Lấy dữ liệu shop mới (thay cho "uy tín")
//            List<Shop> reputableList = shopService.getReputableShops();
//            
//            // 3. Lấy danh sách "dịp" (Category) để hiển thị trên thanh tìm kiếm
//            List<Category> categoryList = categoryService.getAllCategories(); 
//
//            // 4. Đặt dữ liệu vào request để gửi cho JSP
//            request.setAttribute("featuredList", featuredList);
//            request.setAttribute("reputableList", reputableList);
//            request.setAttribute("categoryList", categoryList);
//            
//            // 5. Chuyển tiếp đến trang home.jsp
//            request.getRequestDispatcher("home.jsp").forward(request, response);
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            // (Bạn có thể chuyển hướng đến một trang lỗi)
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
       List<Product> p = productService.getAllProducts();
       request.setAttribute("list", p);
       request.getRequestDispatcher("home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}