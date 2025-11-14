<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login - Flower Shop</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login-container">
            <div class="login-card">
                <div class="logo">Flower Shop</div>
                <h2>Welcome Back</h2>
                <p class="subtitle">Log in to continue your floral journey</p>

                <form action="login" method="post">
                    <div class="input-group email">
                        <input type="email" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-group password">
                        <input type="password" name="password" placeholder="Password" required>
                    </div>

                    <button type="submit" class="btn">Login</button>

                    <p style="color:red; text-align:center;">${error}</p>
                    <p style="color:green; text-align:center;">${param.msg}</p>
                    <p class="register-link">
                        Don’t have an account? <a href="register.jsp">Register</a>
                    </p>
                </form>
            </div>
        </div>
    </body>
</html>
