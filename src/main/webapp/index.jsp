<%--
  Created by IntelliJ IDEA.
  User: Dimantha Kaveen
  Date: 6/15/2025
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Complaint Management System - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        }
        .logo-circle {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, #a21caf 0%, #7c3aed 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.2rem auto;
            box-shadow: 0 4px 24px 0 #a21caf44;
        }
        .logo-circle i {
            font-size: 2.2rem;
            color: #fff;
        }
        .glass h1 {
            font-size: 2.1rem;
            font-weight: 800;
            color: #e9d5ff;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px #a21caf44;
        }
        .glass p {
            color: #d8b4fe;
            font-size: 1.13rem;
        }
        .btn-purple, .btn-outline-purple {
            font-weight: 600;
            letter-spacing: 1px;
            border-radius: 2rem;
            transition: all 0.18s cubic-bezier(.4,0,.2,1);
        }
        .btn-purple {
            background: linear-gradient(90deg, #7c3aed 0%, #a21caf 100%);
            color: #fff;
            border: none;
            box-shadow: 0 2px 8px 0 rgba(124,58,237,0.15);
            position: relative;
            overflow: hidden;
        }
        .btn-purple::after {
            content: "";
            position: absolute;
            left: -100%;
            top: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, #a21caf55 0%, #7c3aed33 100%);
            transition: left 0.3s;
            z-index: 0;
        }
        .btn-purple:hover::after {
            left: 0;
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
        }
        .btn-outline-purple:hover {
            background: #a21caf;
            color: #fff;
        }
        .footer-note {
            color: #c4b5fd !important;
            opacity: 0.85;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<div class="glass text-center">
    <div class="logo-circle mb-2">
        <i class="bi bi-shield-lock-fill"></i>
    </div>
    <h1 class="mb-3">Complaint Management System</h1>
    <p class="mb-4">
        Manage and track complaints efficiently in one place.
    </p>
    <div class="d-grid gap-3 mb-4">
        <a href="view/login.jsp" class="btn btn-purple btn-lg">Login</a>
        <a href="view/signup.jsp" class="btn btn-outline-purple btn-lg">Sign Up</a>
    </div>
    <div class="footer-note text-muted small mt-3">
        &copy; 2025 Complaint Management System by KaveeN. All rights reserved.
    </div>
</div>
</body>
</html>