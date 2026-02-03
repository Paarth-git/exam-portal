package com.examportal.servlet;

import java.io.IOException;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.examportal.dao.UserDAO;
import com.examportal.model.User;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final Pattern USERNAME_PATTERN = Pattern.compile("^[A-Za-z0-9_]{5,15}$");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        if (!USERNAME_PATTERN.matcher(username).matches()) {
            response.sendRedirect("signup.jsp?error=Invalid+Username+(5-15+chars,+letters+numbers+underscore)");
            return;
        }

               if (!EMAIL_PATTERN.matcher(email).matches()) {
            response.sendRedirect("signup.jsp?error=Invalid+Email+Format");
            return;
        }

       
        if (password.length() < 8) {
            response.sendRedirect("signup.jsp?error=Password+must+be+at+least+8+characters");
            return;
        }

        UserDAO dao = new UserDAO();

        // Check if user already exists
        if (dao.usernameExists(username)) {
            response.sendRedirect("signup.jsp?error=Username+Already+Exists");
            return;
        }

        if (dao.emailExists(email)) {
            response.sendRedirect("signup.jsp?error=Email+Already+Exists");
            return;
        }

        // Create user
        User user = new User(username, email, password);
        boolean success = dao.addUser(user);

        if (success) {
            response.sendRedirect("login.jsp?success=Account+Created");
        } else {
            response.sendRedirect("signup.jsp?error=Something+Went+Wrong");
        }
    }
}
