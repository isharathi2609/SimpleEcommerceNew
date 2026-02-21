package Servlet;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Model.User;
import Service.DataStorage;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Basic validation
        if (email == null || password == null || email.isEmpty()) {
            request.setAttribute("error", "Email and Password are required");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Check if user exists in DataStorage
        for (User user : DataStorage.users) {
            if (user.getEmail().equalsIgnoreCase(email) && user.getPassword().equals(password)) {
                
                // Session create karna zaroori hai cart functionality ke liye
                HttpSession session = request.getSession();
                session.setAttribute("user", email);
                
                // Success: Redirect to products page
                response.sendRedirect("products.jsp");
                return;
            }
        }

        // Failure: Back to login with error
        request.setAttribute("error", "Invalid Email or Password");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}