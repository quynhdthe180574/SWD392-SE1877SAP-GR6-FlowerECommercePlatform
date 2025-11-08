/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author acer
 */

//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class DBContext {
//
//    // THAY ĐỔI CÁC THÔNG SỐ NÀY
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/ten_database_cua_ban";
//    private static final String USER = "sa";
//    private static final String PASS = ""; // Mật khẩu của bạn
//    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
//
//    public static Connection getConnection() throws SQLException {
//        try {
//            Class.forName(DRIVER);
//            return DriverManager.getConnection(DB_URL, USER, PASS);
//        } catch (ClassNotFoundException | SQLException e) {
//            System.err.println("Connection Failed!");
//            e.printStackTrace();
//            throw new SQLException("Cannot get connection: " + e.getMessage());
//        }
//    }
//}
    /* * LƯU Ý: Không chạy file DBConnection trực tiếp. 
     * Nó không có main method và không phải là Servlet.
     * Hãy chạy lại Project/Controller.
     */

/**
 *
 * @author FPT University - PRJ30X
 */



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection; // Biến kết nối cho các DAO con

    public DBContext() {
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            
            // --- SỬA THÔNG TIN CỦA BẠN VÀO CHUỖI NÀY ---
            String url = "jdbc:sqlserver://localhost\\DUONGPC:1433;databaseName=FlowerSystem;user=sa;password=123456;encrypt=true;trustServerCertificate=true;";
            // --- ---

            Class.forName(driver); // Nạp driver
            connection = DriverManager.getConnection(url); // Mở kết nối
            
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Kết nối SQL Server thất bại!");
            e.printStackTrace();
            connection = null;
        }
       
   
    }
}

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class DBConnection {
//    
//    // Đảm bảo tên CSDL là FlowerSystem
//    private static final String URL = "jdbc:sqlserver://DUONGPC\\DUONGPC:1433;databaseName=FlowerSystem;trustServerCertificate=true;"; 
//    
//    // THAY THẾ CHÍNH XÁC USER VÀ PASS CỦA BẠN (Ví dụ: sa / 123456)
//    private static final String USER = "sa"; 
//    private static final String PASS = "123456"; 
//
//    /**
//     * Phương thức tĩnh lấy Connection.
//     */
//    public static Connection getConnection() throws SQLException {
//        // Có thể cần tải driver nếu bạn dùng phiên bản JDBC cũ hơn
//        // try {
//        //     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        // } catch (ClassNotFoundException e) {
//        //     System.err.println("JDBC Driver not found!");
//        // }
//        
//        return DriverManager.getConnection(URL, USER, PASS);
//    }
//    public static void main(String[] args) {
//        
//   }
//}
//

/*

import java.sql.Connection;
import java.sql.DriverManager;


public class DBContext {
    
    /*USE BELOW METHOD FOR YOUR DATABASE CONNECTION FOR BOTH SINGLE AND MULTILPE SQL SERVER INSTANCE(s)*/
    /*DO NOT EDIT THE BELOW METHOD, YOU MUST USE ONLY THIS ONE FOR YOUR DATABASE CONNECTION*/
/*
     public Connection getConnection()throws Exception {
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber + "\\" + instance +";databaseName="+dbName;
        if(instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://"+serverName+":"+portNumber +";databaseName="+dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }   
    /*Insert your other code right after this comment*/
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
/*
    private final String serverName = "BUIHUY";
    private final String dbName = "StudentDB";
    private final String portNumber = "1433";
    private final String instance="";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final String userID = "sa";
    private final String password = "123";
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection()); 
       } catch (Exception e) {
        }
    }
}
 */