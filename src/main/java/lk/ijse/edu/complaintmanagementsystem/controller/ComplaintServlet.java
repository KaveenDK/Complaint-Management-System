package lk.ijse.edu.complaintmanagementsystem.controller;

import lk.ijse.edu.complaintmanagementsystem.model.Complaint;
import lk.ijse.edu.complaintmanagementsystem.model.User;
import lk.ijse.edu.complaintmanagementsystem.model.dao.ComplaintDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * --------------------------------------------
 * @Author Dimantha Kaveen
 * @GitHub: https://github.com/KaveenDK
 * --------------------------------------------
 * @Created 6/15/2025
 * @Project Complaint Management System - CMS
 * --------------------------------------------
 **/

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
            return;
        }

        try {
            ComplaintDAO dao = new ComplaintDAO();

            if ("create".equalsIgnoreCase(action)) {
                Complaint complaint = new Complaint();
                complaint.setUserId(user.getId());
                complaint.setTitle(req.getParameter("title"));
                complaint.setDescription(req.getParameter("description"));
                dao.addComplaint(complaint);
                resp.sendRedirect(req.getContextPath() + "/view/employeeDashboard.jsp");

            } else if ("update".equalsIgnoreCase(action) && "Admin".equals(user.getRole())) {
                int complaintId = Integer.parseInt(req.getParameter("id"));
                String status = req.getParameter("status");
                String remarks = req.getParameter("remarks");
                dao.updateComplaint(complaintId, status, remarks);

                List<Complaint> complaints = dao.getAllComplaints();
                req.setAttribute("complaints", complaints);
                req.getRequestDispatcher("/view/complaintList.jsp").forward(req, resp);

            } else if ("delete".equalsIgnoreCase(action)) {
                int complaintId = Integer.parseInt(req.getParameter("id"));
                boolean canDelete = false;

                if ("Admin".equals(user.getRole())) {
                    canDelete = true;
                } else if ("Employee".equals(user.getRole())) {
                    List<Complaint> userComplaints = dao.getComplaintsByUser(user.getId());
                    for (Complaint c : userComplaints) {
                        if (c.getId() == complaintId && !"Resolved".equals(c.getStatus())) {
                            canDelete = true;
                            break;
                        }
                    }
                }

                if (canDelete) {
                    dao.deleteComplaint(complaintId);
                }
                List<Complaint> complaints = "Admin".equals(user.getRole()) ?
                        dao.getAllComplaints() : dao.getComplaintsByUser(user.getId());
                req.setAttribute("complaints", complaints);
                req.getRequestDispatcher("/view/complaintList.jsp").forward(req, resp);

            } else {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
            return;
        }
        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/view/login.jsp");
            return;
        }

        try {
            ComplaintDAO dao = new ComplaintDAO();
            List<Complaint> complaints;
            if ("Admin".equals(user.getRole())) {
                complaints = dao.getAllComplaints();
            } else {
                complaints = dao.getComplaintsByUser(user.getId());
            }
            req.setAttribute("complaints", complaints);
            req.getRequestDispatcher("/view/complaintList.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}