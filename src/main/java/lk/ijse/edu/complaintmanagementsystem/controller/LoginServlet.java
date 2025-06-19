package lk.ijse.edu.complaintmanagementsystem.controller;

import lk.ijse.edu.complaintmanagementsystem.model.User;
import lk.ijse.edu.complaintmanagementsystem.model.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

/**
 * --------------------------------------------
 * @Author Dimantha Kaveen
 * @GitHub: https://github.com/KaveenDK
 * --------------------------------------------
 * @Created 6/15/2025
 * @Project Complaint Management System - CMS
 * --------------------------------------------
 **/

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            UserDAO dao = new UserDAO();
            User user = dao.validate(username, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                if ("Admin".equals(user.getRole())) {
                    resp.sendRedirect(req.getContextPath() + "/view/adminDashboard.jsp");
                } else {
                    resp.sendRedirect(req.getContextPath() + "/view/employeeDashboard.jsp");
                }
            } else {
                req.setAttribute("error", "Invalid username or password");
                req.getRequestDispatcher("view/login.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}