package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Product;
import Model.CartItem;
import Service.DataStorage;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user");

        // Agar user logged in nahi hai toh products par hi rakhein ya login bhejien
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String productIdStr = request.getParameter("productId");
        String action = request.getParameter("action");

        if (productIdStr != null && action != null) {
            int productId = Integer.parseInt(productIdStr);

            // Find the product in DataStorage
            Product currentProduct = null;
            for (Product p : DataStorage.products) {
                if (p.getId() == productId) {
                    currentProduct = p;
                    break;
                }
            }

            if (currentProduct != null) {
                // Check if item already in cart
                CartItem existingItem = null;
                for (CartItem item : DataStorage.cartItems) {
                    if (item.getUserEmail().equals(userEmail) && item.getProduct().getId() == productId) {
                        existingItem = item;
                        break;
                    }
                }

                // Add or Increase Quantity
                if ("add".equals(action)) {
                    if (existingItem != null) {
                        existingItem.setQuantity(existingItem.getQuantity() + 1);
                    } else {
                        DataStorage.cartItems.add(new CartItem(userEmail, currentProduct, 1));
                    }
                } 
                // Decrease or Remove Quantity
                else if ("remove".equals(action)) {
                    if (existingItem != null) {
                        if (existingItem.getQuantity() > 1) {
                            existingItem.setQuantity(existingItem.getQuantity() - 1);
                        } else {
                            DataStorage.cartItems.remove(existingItem);
                        }
                    }
                }
            }
        }

        // Hamesha products page par wapas bhejien taaki change dikhe
        response.sendRedirect("products.jsp");
    }
}