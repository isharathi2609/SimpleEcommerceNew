<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success - ShopMart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="center-wrapper">
    <div class="success-card">
        <div class="tick-icon">✔</div>
        <div class="brand">ShopMart</div>
        <h2 style="margin-bottom: 10px;">Thank You!</h2>
        <p style="color: #666; margin-bottom: 20px;">Your order has been placed successfully.</p>
        
        <div style="border-top: 1px solid #eee; padding-top: 20px;">
            <a href="products.jsp" class="btn" style="text-decoration: none; display: block;">
                Continue Shopping
            </a>
        </div>
    </div>
</div>

</body>
</html>