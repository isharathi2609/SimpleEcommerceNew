<%@ page import="Service.DataStorage,Model.CartItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart - ShopMart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="page-wrapper">
    <h1 class="brand">Your Shopping Cart</h1>

    <%
        String userEmail = (String) session.getAttribute("user");
        double total = 0;
        boolean hasItems = false;
    %>

    <div class="cart-container">
    <%
        if(userEmail != null) {
            for(CartItem item : DataStorage.cartItems){
                if(item.getUserEmail().equals(userEmail)){
                    hasItems = true;
                    double subtotal = item.getQuantity() * item.getProduct().getPrice();
                    total += subtotal;
    %>
        <div class="cart-box" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid rgba(255,255,255,0.1); padding: 15px 0;">
            <div style="text-align: left;">
                <h3 style="color: #fff; margin-bottom: 5px;"><%= item.getProduct().getName() %></h3>
                <p style="color: #bdc3c7; font-size: 14px;">Price: &#8377; <%= item.getProduct().getPrice() %></p>
                <p style="color: #fff;">Quantity: <strong><%= item.getQuantity() %></strong></p>
            </div>
            <div style="text-align: right;">
                <p style="font-size: 20px; color: #ff9f43;"><strong>&#8377; <%= subtotal %></strong></p>
            </div>
        </div>
    <%
                }
            }
        }

        if(!hasItems){
    %>
        <div style="text-align:center; padding: 40px 0;">
            <h3 style="margin-bottom: 15px; color: #fff;">Your cart is empty 🛒</h3>
            <a href="products.jsp" class="view-cart-link">Shop Now</a>
        </div>
    <%
        } else {
    %>
        <div class="cart-total" style="text-align: right; margin-top: 20px; font-size: 24px; color: #00c6ff; font-weight: bold;">
            Total Amount: &#8377; <%= total %>
        </div>

        <div style="text-align:center; margin-top:40px;">
            <a href="payment.jsp" class="view-cart-link" style="padding: 15px 50px; font-size: 18px;">
                Proceed to Payment
            </a>
        </div>
    <% } %>

        <div style="text-align:center; margin-top:25px;">
            <a href="products.jsp" style="color: #bdc3c7; text-decoration: none; font-size: 14px; border-bottom: 1px solid #bdc3c7;">
                ← Back to Products
            </a>
        </div>
    </div>
</div>

</body>
</html>