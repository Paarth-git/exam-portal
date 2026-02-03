package com.examportal.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.examportal.dao.UserDAO;
import com.examportal.model.User;

@WebServlet("/submitExam")
public class SubmitExamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int score = Integer.parseInt(request.getParameter("score"));
        int total = 5; // You have 5 questions

        new UserDAO().updateScore(user.getUsername(), score);


        request.setAttribute("score", score);
        request.setAttribute("total", total);


        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
