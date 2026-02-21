<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<div class="center-wrapper">
    <div class="login-container">
        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post">

            <input type="text" name="name"
                placeholder="Enter Your Name"
                class="input-field" required>

            <input type="email" name="email"
                placeholder="Enter Email"
                class="input-field" required>

            <input type="password" name="password"
                placeholder="Enter Password"
                class="input-field" required>

            <button type="submit" class="login-btn">Register</button>
        </form>

        <p style="margin-top:15px; font-size:14px;">
            Already have an account?
            <a href="login.jsp" style="color:#667eea; text-decoration:none;">
                Login
            </a>
        </p>

    </div>
</div>

</body>
</html>