<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | Exam Portal</title>

   
    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #f0f2f5;
        }
        .login-card {
            max-width: 420px;
            margin: auto;
            margin-top: 80px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.15);
        }
        .error {
            color: red;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="login-card">

    <h3 class="text-center mb-3">Exam Portal Login</h3>

    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>

    <form action="login" method="post">

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input name="username" type="text" class="form-control" required />
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input name="password" type="password" class="form-control" required />
        </div>

        <button type="submit" class="btn btn-primary w-100">Login</button>

        <div class="text-center mt-3">
            <a href="signup.jsp">Create new account</a>
        </div>

    </form>

</div>

</body>
</html>
