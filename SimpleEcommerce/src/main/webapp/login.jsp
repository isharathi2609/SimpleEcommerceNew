<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - ShopMart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="center-wrapper">
    <div class="login-container">
        <div class="brand">ShopMart</div>
        <h2>Welcome Back</h2>
        
        <%-- Error Message dikhane ke liye --%>
        <% if(request.getAttribute("error") != null) { %>
            <p style="color: red; font-size: 13px;"><%= request.getAttribute("error") %></p>
        <% } %>

        <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
            <input type="email" name="email" class="input-field" placeholder="Enter Email" required>
            <input type="password" name="password" class="input-field" placeholder="Enter Password" required>
            
            <%-- Maine yahan 'btn' class wapas add kar di hai jo aapke purane CSS mein thi --%>
            <button type="submit" class="btn login-btn">Login</button>
        </form>
        
        <p style="margin-top: 15px; color: #333;">
            Don't have an account? <a href="register.jsp" style="color: #00c6ff;">Register</a>
        </p>
    </div>
</div>

</body>
</html>