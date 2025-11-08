import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.regex.Pattern;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thiết lập kiểu nội dung phản hồi
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Lấy dữ liệu từ biểu mẫu
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String gender = request.getParameter("gender");
        String dobStr = request.getParameter("dob");
        
        // Cờ kiểm tra hợp lệ và thông báo lỗi
        boolean isValid = true;
        StringBuilder errorMsg = new StringBuilder();
        
        // Kiểm tra Username: 6-12 ký tự, chỉ chứa chữ cái
        if (username == null || !username.matches("^[a-zA-Z]{6,12}$")) {
            isValid = false;
            errorMsg.append("Invalid username. Must be 6-12 letters only.<br>");
        }
        
        // Kiểm tra Email
        if (email == null || !isValidEmail(email)) {
            isValid = false;
            errorMsg.append("Invalid email.<br>");
        }
        
        // Kiểm tra Password: ít nhất 8 ký tự, chứa ký tự đặc biệt
        if (password == null || password.length() < 8 || !containsSpecialChar(password)) {
            isValid = false;
            errorMsg.append("Invalid password. Must be at least 8 characters and include special characters.<br>");
        }
        
        // Kiểm tra Confirm Password: phải khớp với Password
        if (confirm == null || !confirm.equals(password)) {
            isValid = false;
            errorMsg.append("Passwords do not match.<br>");
        }
        
        // Kiểm tra Gender: phải chọn Male hoặc Female
        if (gender == null || (!gender.equals("Male") && !gender.equals("Female"))) {
            isValid = false;
            errorMsg.append("Please select a gender.<br>");
        }
        
        // Kiểm tra DOB và tuổi: phải ít nhất 18 tuổi
        LocalDate dob = null;
        try {
            dob = LocalDate.parse(dobStr, DateTimeFormatter.ISO_DATE);
            int age = Period.between(dob, LocalDate.now()).getYears();
            if (age < 18) {
                isValid = false;
                errorMsg.append("You must be at least 18 years old.<br>");
            }
        } catch (Exception e) {
            isValid = false;
            errorMsg.append("Invalid date of birth.<br>");
        }
        
        // Hiển thị kết quả
        if (isValid) {
            out.println("<h2>Registration Successful</h2>");
            out.println("<p>Username: " + username + "</p>");
            out.println("<p>Email: " + email + "</p>");
            out.println("<p>Gender: " + gender + "</p>");
            out.println("<p>Date of Birth: " + dobStr + "</p>");
        } else {
            out.println("<h2>Invalid Data</h2>");
            out.println(errorMsg.toString());
        }
    }
    
// Hàm kiểm tra định dạng Email đơn giản và chuẩn
private boolean isValidEmail(String email) {
    // Regex kiểm tra định dạng email quốc tế
    String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
    return Pattern.matches(emailRegex, email);
}
    
    // Hàm kiểm tra Password có ký tự đặc biệt không
    private boolean containsSpecialChar(String password) {
        String specialChars = "@#%^&*";
        for (char c : password.toCharArray()) {
            if (specialChars.indexOf(c) != -1) {
                return true;
            }
        }
        return false;
    }
}