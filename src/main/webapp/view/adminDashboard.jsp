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
<html lang="en">
<head>
    <title>Admin Dashboard</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(135deg, #1a0022 0%, #4b006e 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Arial, sans-serif;
        }
        .glass {
            background: rgba(40, 20, 60, 0.93);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.25);
            backdrop-filter: blur(12px);
            border-radius: 2.5rem;
            color: #f3e8ff;
            border: 2px solid rgba(162, 28, 175, 0.18);
            padding: 2.5rem 2rem 2rem 2rem;
            max-width: 440px;
            width: 100%;
            text-align: center;
        }
        .admin-icon {
            font-size: 3.5rem;
            color: #fff;
            background: linear-gradient(135deg, #a21caf 0%, #7c3aed 100%);
            border-radius: 50%;
            padding: 1rem;
            margin-bottom: 1.2rem;
            box-shadow: 0 4px 24px 0 #a21caf44;
            display: inline-block;
        }
        .dashboard-title {
            font-size: 2rem;
            font-weight: 800;
            color: #e9d5ff;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px #a21caf44;
            margin-bottom: 0.7rem;
        }
        .welcome-msg {
            color: #d8b4fe;
            font-size: 1.13rem;
            margin-bottom: 1.5rem;
        }
        .btn-purple {
            background: linear-gradient(90deg, #7c3aed 0%, #a21caf 100%);
            color: #fff;
            border: none;
            font-weight: 600;
            border-radius: 2rem;
            transition: background 0.2s, box-shadow 0.2s;
        }
        .btn-purple:hover {
            background: linear-gradient(90deg, #a21caf 0%, #7c3aed 100%);
            color: #fff;
            box-shadow: 0 4px 16px 0 rgba(162,28,175,0.25);
        }
        .btn-outline-purple {
            border: 2px solid #a21caf;
            color: #a21caf;
            background: transparent;
            font-weight: 600;
            border-radius: 2rem;
            transition: background 0.2s, color 0.2s;
        }
        .btn-outline-purple:hover {
            background: #a21caf;
            color: #fff;
        }
        .footer-note {
            color: #c4b5fd !important;
            opacity: 0.85;
            margin-top: 2rem;
        }
    </style>
</head>
<body>
<div class="glass mx-auto">
    <span class="admin-icon mb-2"><i class="bi bi-person-gear"></i></span>
    <div class="dashboard-title mb-2">Admin Dashboard</div>
    <div class="welcome-msg mb-4">
        Welcome, <b><%= user.getFullName() %></b>
    </div>
    <div class="d-grid gap-3 mb-3">
        <a href="../ComplaintServlet" class="btn btn-purple btn-lg">View All Complaints</a>
        <button id="logoutBtn" class="btn btn-outline-purple btn-lg">Logout</button>
    </div>
    <div class="footer-note text-muted small">
        &copy; 2025 Complaint Management System by KaveeN.
    </div>
</div>
<script>
    document.getElementById('logoutBtn').onclick = function(e) {
        e.preventDefault();
        Swal.fire({
            title: 'Are you sure you want to logout?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Logout',
            cancelButtonText: 'Cancel',
            confirmButtonColor: '#a21caf'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = '../logout';
            }
        });
    };
</script>
</body>
</html>