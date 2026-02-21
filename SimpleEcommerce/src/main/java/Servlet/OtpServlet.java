package Servlet;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import Model.User;
import Service.DataStorage;
@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int enteredOtp = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();

        int originalOtp = (int) session.getAttribute("otp");

        if (enteredOtp == originalOtp) {
            User user = (User) session.getAttribute("tempUser");
            DataStorage.users.add(user);
            response.sendRedirect("login.jsp");
        } else {
        	request.setAttribute("error", "Wrong OTP! Try Again.");
        	request.getRequestDispatcher("otp.jsp").forward(request, response);
        }
    }
}