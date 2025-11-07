<%-- 
    Document   : login
    Created on : Nov 1, 2025, 10:08:38 PM
    Author     : FPTSHOP
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h2>Login</h2>
<form action="login" method="post">
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>
<p style="color:red">${error}</p>
<p style="color:green">${param.msg}</p>
</body>
</html>
