package Servlet;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Model.*;
import Service.DataStorage;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user");

        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double totalAmount = 0;

        // Calculate total considering quantity
        for (CartItem item : DataStorage.cartItems) {
            if (item.getUserEmail().equals(userEmail)) {
                totalAmount += (item.getProduct().getPrice() * item.getQuantity());
            }
        }

        // Add to global orders
        DataStorage.orders.add(new Order(userEmail, totalAmount));

        // Clear only this user's cart items
        DataStorage.cartItems.removeIf(item -> item.getUserEmail().equals(userEmail));

        // Redirect to success page
        response.sendRedirect("success.jsp");
    }
}