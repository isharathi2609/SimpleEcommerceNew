<%@ page import="Service.DataStorage,Model.CartItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Payment</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="center-wrapper">
    <div class="payment-container">
        <div class="brand">ShopMart</div>
        <h2>Checkout & Payment</h2>
        <br>

        <div class="bill-summary">
            <%
                String userEmail = (String) session.getAttribute("user");
                double subtotal = 0;
                int itemsCount = 0;
                for (CartItem item : DataStorage.cartItems) {
                    if (item.getUserEmail().equals(userEmail)) {
                        subtotal += (item.getProduct().getPrice() * item.getQuantity());
                        itemsCount += item.getQuantity();
                    }
                }
                double delivery = (subtotal > 500) ? 0 : 40;
                double total = subtotal + delivery;
            %>
            <div class="bill-row">
                <span>Items (<%= itemsCount %>):</span>
                <span>&#8377; <%= subtotal %></span>
            </div>
            <div class="bill-row">
                <span>Delivery:</span>
                <span><%= (delivery == 0) ? "FREE" : "&#8377; 40" %></span>
            </div>
            <div class="bill-row total-row">
                <span>Order Total:</span>
                <span>&#8377; <%= total %></span>
            </div>
        </div>

        <form action="<%= request.getContextPath() %>/PaymentServlet" method="post">
            <input type="text" class="input-field" placeholder="Card Holder Name" required>
            <input type="text" class="input-field" placeholder="1234 5678 9101 1121" maxlength="16" required>
            <div style="display:flex; gap:10px;">
                <input type="text" class="input-field" placeholder="MM/YY" maxlength="5" required>
                <input type="password" class="input-field" placeholder="CVV" maxlength="3" required>
            </div>
            
            <button type="submit" class="payment-btn">Pay &#8377; <%= total %></button>
        </form>
        
        <p style="margin-top:15px; font-size:12px; color:#666;">
            🔒 Secure SSL Encrypted Payment
        </p>
    </div>
</div>

</body>
</html>