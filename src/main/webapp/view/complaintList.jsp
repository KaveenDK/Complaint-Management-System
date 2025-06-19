<%--
  Created by IntelliJ IDEA.
  User: Dimantha Kaveen
  Date: 6/15/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.edu.complaintmanagementsystem.model.Complaint" %>
<%@ page import="lk.ijse.edu.complaintmanagementsystem.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> complaints = (List<Complaint>) request.getAttribute("complaints");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Complaint List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">Complaint List</span>
        <span class="text-white">
            Logged in as <%= user.getFullName() %> |
            <a href="<%= user.getRole().equals("Admin") ? "adminDashboard.jsp" : "employeeDashboard.jsp" %>" class="btn btn-sm btn-light">Dashboard</a>
        </span>
    </div>
</nav>

<div class="container mt-4">
    <h4><%= user.getRole().equals("Admin") ? "All Complaints" : "My Complaints" %></h4>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Status</th>
            <th>Remarks</th>
            <th>Created</th>
            <% if ("Admin".equals(user.getRole()) || "Employee".equals(user.getRole())) { %>
            <th>Actions</th>
            <% } %>
        </tr>
        </thead>
        <tbody>
        <%
            for (Complaint c : complaints) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getTitle() %></td>
            <td><%= c.getDescription() %></td>
            <td><%= c.getStatus() %></td>
            <td><%= c.getRemarks() != null ? c.getRemarks() : "-" %></td>
            <td><%= c.getCreatedAt() %></td>
            <td>
                <% if ("Admin".equals(user.getRole())) { %>
                <form action="../ComplaintServlet" method="post" class="d-flex flex-column gap-2">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <select name="status" class="form-select form-select-sm">
                        <option <%= "Pending".equals(c.getStatus()) ? "selected" : "" %>>Pending</option>
                        <option <%= "In Progress".equals(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                        <option <%= "Resolved".equals(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                    </select>
                    <input type="text" name="remarks" class="form-control form-control-sm" placeholder="Remarks" value="<%= c.getRemarks() != null ? c.getRemarks() : "" %>">
                    <button type="submit" class="btn btn-sm btn-success">Update</button>
                </form>
                <form action="../ComplaintServlet" method="post" class="mt-1">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
                <% } else if ("Employee".equals(user.getRole()) && !"Resolved".equals(c.getStatus())) { %>
                <form action="../ComplaintServlet" method="post">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= c.getId() %>">
                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                </form>
                <% } %>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>