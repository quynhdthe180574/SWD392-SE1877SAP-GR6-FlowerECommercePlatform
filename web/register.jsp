<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Flower Shop</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="logo">🌸 Flower Shop</div>
            <h2>Create Account</h2>
            <p class="subtitle">Join us and start your floral journey</p>

            <form action="register" method="post">
                <div class="input-group user">
                    <input type="text" name="first_name" placeholder="First Name" required>
                </div>
                <div class="input-group user">
                    <input type="text" name="last_name" placeholder="Last Name" required>
                </div>
                <div class="input-group email">
                    <input type="email" name="email" placeholder="Email" required>
                </div>
                <div class="input-group password">
                    <input type="password" name="password" placeholder="Password" required>
                </div>

                <button type="submit" class="btn">Register</button>

                <p style="color:red; text-align:center; margin-top:10px;">${error}</p>
                <p style="color:green; text-align:center; margin-top:10px;">${success}</p>

            </form>
        </div>
    </div>
</body>
</html>
