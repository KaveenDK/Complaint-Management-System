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
    if (user == null || !"Admin".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <span class="navbar-brand">Admin Dashboard</span>
        <span class="text-white">Welcome, <%= user.getFullName() %> | <a href="../logout" class="btn btn-sm btn-light">Logout</a></span>
    </div>
</nav>
<div class="container mt-4">
    <a href="../ComplaintServlet" class="btn btn-primary w-100">View All Complaints</a>
</div>
</body>
</html>