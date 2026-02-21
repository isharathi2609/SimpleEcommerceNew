<%@ page import="Service.DataStorage,Model.Product,Model.CartItem" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Products - ShopMart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="page-wrapper">
    <div class="brand">ShopMart</div> 
    <h2 style="text-align:center; margin-bottom:30px; color: #fff;">Our Products</h2>
    
    <div class="product-grid"> 
        <% 
            String userEmail = (String) session.getAttribute("user");
            for(Product p : DataStorage.products) { 
                int quantity = 0;
                if(userEmail != null) {
                    for(CartItem item : DataStorage.cartItems) {
                        if(item.getProduct().getId() == p.getId() && item.getUserEmail().equals(userEmail)) {
                            quantity = item.getQuantity();
                        }
                    }
                }
        %>
            <div class="product-card"> 
                <h3 class="product-name"><%= p.getName() %></h3>
                <p class="product-desc"><%= p.getDescription() %></p>
                <p class="price">&#8377; <%= p.getPrice() %></p>

                <div class="qty-wrapper">
                    <form action="<%= request.getContextPath() %>/CartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit" class="qty-btn minus">−</button>
                    </form>

                    <span class="qty-number"><%= quantity %></span>

                    <form action="<%= request.getContextPath() %>/CartServlet" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="<%= p.getId() %>">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="qty-btn plus">+</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>

    <div  style="text-align:center; margin-top:40px;">
        <a href="cart.jsp" class="view-cart-link">🛒 View Your Cart</a>
    </div>
</div>

</body>
</html>