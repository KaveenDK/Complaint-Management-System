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
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js"></script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4 bg-white p-4 rounded shadow">
            <h4 class="mb-3 text-center">Login</h4>
            <form name="loginForm" action="../login" method="post" onsubmit="return validateLoginForm();">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required />
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required />
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>
            <% String error = (String) request.getAttribute("error");
                if (error != null) { %>
            <script>
                Swal.fire({ icon: 'error', title: 'Login Failed', text: '<%= error %>' });
            </script>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
