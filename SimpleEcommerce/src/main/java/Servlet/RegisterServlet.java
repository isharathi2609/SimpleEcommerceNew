package Servlet;
import javax.servlet.annotation.WebServlet;


import java.io.IOException;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;
import Model.User;
import Service.DataStorage;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int otp = new Random().nextInt(9000) + 1000;

        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("tempUser", new User(name, email, password));

        request.setAttribute("generatedOtp", otp);
        request.getRequestDispatcher("otp.jsp").forward(request, response);
    }
}