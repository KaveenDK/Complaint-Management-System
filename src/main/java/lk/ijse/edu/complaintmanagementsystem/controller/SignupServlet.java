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

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String role = req.getParameter("role");

        if (fullName == null || username == null || password == null || confirmPassword == null || role == null ||
                fullName.trim().length() < 3 || username.trim().length() < 4 ||
                password.length() < 6 || !password.equals(confirmPassword) || role.isEmpty()) {
            req.setAttribute("error", "Invalid input. Please check your details.");
            req.getRequestDispatcher("view/signup.jsp").forward(req, resp);
            return;
        }

        try {
            UserDAO dao = new UserDAO();
            if (dao.existsByUsername(username)) {
                req.setAttribute("error", "Username already exists.");
                req.getRequestDispatcher("view/signup.jsp").forward(req, resp);
                return;
            }

            User user = new User();
            user.setFullName(fullName.trim());
            user.setUsername(username.trim());
            user.setPassword(password);
            user.setRole(role);

            dao.addUser(user);

            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("view/signup.jsp").forward(req, resp);
        }
    }
}
