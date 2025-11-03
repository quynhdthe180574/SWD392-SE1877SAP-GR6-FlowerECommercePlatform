<%-- 
    Document   : register
    Created on : Nov 1, 2025, 10:08:05 PM
    Author     : FPTSHOP
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Register</h2>
<form action="register" method="post">
    <input type="text" name="first_name" placeholder="First Name" required><br>
    <input type="text" name="last_name" placeholder="Last Name" required><br>
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Register</button>
</form>
<p style="color:red">${error}</p>
</body>
</html>
