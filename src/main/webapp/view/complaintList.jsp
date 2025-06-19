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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background: linear-gradient(135deg, #1a0022, #4b006e);
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
            color: #f3e8ff;
        }
        .glass {
            background: rgba(40, 20, 60, 0.95);
            border: 2px solid rgba(162, 28, 175, 0.18);
            border-radius: 1.5rem;
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1100px;
            box-shadow: 0 0 20px #a21caf55;
        }
        .list-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 1.5rem;
            color: #e9d5ff;
            text-shadow: 0 2px 8px #a21caf44;
        }
        .table thead th {
            background: linear-gradient(90deg, #7c3aed, #a21caf);
            color: white;
            text-align: center;
        }
        .btn-sm {
            border-radius: 1rem;
            font-weight: 500;
        }
        .btn-success, .btn-danger {
            color: white;
            border: none;
        }
        .btn-success:hover {
            background: linear-gradient(90deg, #a21caf, #7c3aed);
        }
        .btn-danger:hover {
            background: linear-gradient(90deg, #7c3aed, #a21caf);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand mb-0 h1">Complaint List</span>
    <span class="text-white">
        Logged in as <%= user.getFullName() %> |
        <a href="<%= user.getRole().equals("Admin") ? "view/adminDashboard.jsp" : "view/employeeDashboard.jsp" %>" class="btn btn-sm btn-light">Dashboard</a>
    </span>
</nav>
<div class="glass container">
    <div class="list-title"><i class="bi bi-clipboard-data"></i> <%= user.getRole().equals("Admin") ? "All Complaints" : "My Complaints" %></div>
    <div class="table-responsive">
        <table class="table table-striped table-bordered align-middle text-white">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Remarks</th>
                <th>Created</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                if (complaints != null && !complaints.isEmpty()) {
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
                    <form action="<%= request.getContextPath() %>/ComplaintServlet" method="post" class="mb-2">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="id" value="<%= c.getId() %>">
                        <select name="status" class="form-select form-select-sm mb-1">
                            <option <%= "Pending".equals(c.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option <%= "In Progress".equals(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                            <option <%= "Resolved".equals(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                        </select>
                        <input type="text" name="remarks" class="form-control form-control-sm mb-1" placeholder="Remarks" value="<%= c.getRemarks() != null ? c.getRemarks() : "" %>">
                        <button type="submit" class="btn btn-sm btn-success w-100">Update</button>
                    </form>
                    <form action="<%= request.getContextPath() %>/ComplaintServlet" method="post" class="delete-form">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= c.getId() %>">
                        <button type="button" class="btn btn-sm btn-danger w-100 btn-delete">Delete</button>
                    </form>
                    <% } else if ("Employee".equals(user.getRole()) && !"Resolved".equals(c.getStatus())) { %>
                    <form action="<%= request.getContextPath() %>/ComplaintServlet" method="post" class="delete-form">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= c.getId() %>">
                        <button type="button" class="btn btn-sm btn-danger w-100 btn-delete">Delete</button>
                    </form>
                    <% } else { %>
                    <span class="text-muted">No actions</span>
                    <% } %>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="7" class="text-center text-warning">No complaints found</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<script>
    document.querySelectorAll('.btn-delete').forEach(btn => {
        btn.addEventListener('click', function (e) {
            e.preventDefault();
            const form = this.closest('form');
            Swal.fire({
                title: 'Are you sure?',
                text: "This will delete the complaint permanently.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#a21caf',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    form.submit();
                }
            });
        });
    });
</script>
</body>
</html>