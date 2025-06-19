<%--
  Created by IntelliJ IDEA.
  User: Dimantha Kaveen
  Date: 6/15/2025
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Complaint Management System</title>
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
        .login-wrapper {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: none;
            border-radius: 2.5rem;
            box-shadow: none;
        }
        .glass {
            background: rgba(40, 20, 60, 0.93);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.25);
            backdrop-filter: blur(12px);
            border-radius: 2.5rem 0 0 2.5rem;
            color: #f3e8ff;
            border: 2px solid rgba(162, 28, 175, 0.18);
            padding: 2.5rem 2rem 2rem 2rem;
            max-width: 400px;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .logo-circle {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #a21caf 0%, #7c3aed 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.2rem auto;
            box-shadow: 0 4px 24px 0 #a21caf44;
        }
        .logo-circle i {
            font-size: 2rem;
            color: #fff;
        }
        .glass h4 {
            font-size: 1.5rem;
            font-weight: 700;
            color: #e9d5ff;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px #a21caf44;
        }
        .form-label {
            color: #d8b4fe;
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
        }
        .right-panel {
            flex: 1;
            background: linear-gradient(135deg, #a21caf 0%, #7c3aed 100%);
            border-radius: 0 2.5rem 2.5rem 0;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            min-width: 0;
        }
        .right-panel-content {
            color: #fff;
            text-align: center;
            z-index: 2;
            padding: 2rem;
        }
        .right-panel .icon-bg {
            font-size: 6rem;
            opacity: 0.08;
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .cms-icon {
            font-size: 4.5rem;
            color: #fff;
            background: rgba(124,58,237,0.18);
            border-radius: 50%;
            padding: 1.2rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 24px 0 #a21caf44;
            display: inline-block;
        }
        .system-title {
            font-size: 2.1rem;
            font-weight: 800;
            color: #f3e8ff;
            letter-spacing: 1px;
            text-shadow: 0 2px 8px #a21caf44;
            margin-bottom: 0.7rem;
        }
        .system-desc {
            color: #e0c3fc;
            font-size: 1.13rem;
            margin-bottom: 1.5rem;
        }
        .quote {
            font-size: 1.05rem;
            opacity: 0.8;
            margin-top: 2.5rem;
        }
        .quote-author {
            font-size: 0.95rem;
            opacity: 0.6;
        }
        @media (max-width: 900px) {
            .login-wrapper {
                flex-direction: column;
                max-width: 100%;
            }
            .glass, .right-panel {
                border-radius: 2.5rem;
                max-width: 100%;
            }
            .right-panel {
                display: none;
            }
        }
    </style>
</head>
<body>
<div class="login-wrapper">
    <div class="glass mx-auto">
        <div class="logo-circle mb-2">
            <i class="bi bi-person-fill-lock"></i>
        </div>
        <h4 class="mb-3 text-center">Login</h4>
        <form id="loginForm" action="<%= request.getContextPath() %>/login" method="post" autocomplete="off">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" maxlength="32" required />
            </div>
            <div class="mb-3 position-relative">
                <label class="form-label">Password</label>
                <div class="input-group">
                    <input type="password" name="password" class="form-control" maxlength="32" required id="passwordInput" />
                    <button type="button" class="btn btn-outline-secondary" tabindex="-1" id="togglePassword" style="border-radius: 0 1rem 1rem 0;">
                        <i class="bi bi-eye" id="togglePasswordIcon"></i>
                    </button>
                </div>
            </div>
            <button type="submit" class="btn btn-purple w-100 mb-2">Login</button>
            <div class="text-center mt-2 mb-2">
                <span class="text-light">Don't have an account?</span>
            </div>
            <a href="signup.jsp" class="btn btn-outline-purple w-100">Create Account</a>
        </form>
        <div class="footer-note text-muted small mt-4 text-center">
            &copy; 2025 Complaint Management System by KaveeN.
        </div>
    </div>
    <div class="right-panel d-none d-md-flex">
        <div class="right-panel-content w-100">
            <span class="cms-icon"><i class="bi bi-clipboard-data"></i></span>
            <div class="system-title">Complaint Management System</div>
            <div class="system-desc">
                Effortlessly manage, track, and resolve complaints.<br>
                Secure, reliable, and user-friendly for your organization.
            </div>
            <div class="w-50 mx-auto" style="height:2px; background:#fff; opacity:0.2;"></div>
            <div class="quote mt-4">
                "The secret of getting ahead is getting started."
                <div class="quote-author mt-2">- Dimantha KaveeN -</div>
            </div>
        </div>
        <i class="bi bi-clipboard-data icon-bg"></i>
    </div>
</div>
<script>
    document.getElementById('loginForm').onsubmit = function(e) {
        const username = this.username.value.trim();
        const password = this.password.value.trim();
        if (!username || !password) {
            Swal.fire({
                icon: "warning",
                title: "Validation Error",
                text: "Username and password are required!"
            });
            e.preventDefault();
            return false;
        }
        return true;
    };
    // Show/hide password toggle
    document.getElementById('togglePassword').onclick = function() {
        const pwd = document.getElementById('passwordInput');
        const icon = document.getElementById('togglePasswordIcon');
        if (pwd.type === "password") {
            pwd.type = "text";
            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");
        } else {
            pwd.type = "password";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");
        }
    };
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Login Failed',
        text: '<%= error %>'
    });
    <% } %>
</script>
</body>
</html>