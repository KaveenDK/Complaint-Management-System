<%--
  Created by IntelliJ IDEA.
  User: Dimantha Kaveen
  Date: 6/15/2025
  Time: 11:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="lk.ijse.edu.complaintmanagementsystem.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Employee".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">Submit Complaint</span>
        <span class="text-white">Logged in as <%= user.getFullName() %> | <a href="employeeDashboard.jsp" class="btn btn-sm btn-light">Dashboard</a></span>
    </div>
</nav>
<div class="container mt-4">
    <form name="complaintForm" action="../ComplaintServlet" method="post" onsubmit="return validateComplaintForm();">
        <input type="hidden" name="action" value="create">
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" name="title" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" rows="4" class="form-control" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit Complaint</button>
    </form>
</div>
</body>
</html>