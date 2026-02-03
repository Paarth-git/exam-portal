<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup | Exam Portal</title>

    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #e9eef3;
        }
        .signup-card {
            max-width: 450px;
            margin: auto;
            margin-top: 70px;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.15);
        }
        .error, .success {
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .error { color: red; }
        .success { color: green; }
    </style>

</head>
<body>

<div class="signup-card">

    <h3 class="text-center mb-4">Create an Account</h3>

    <%
        String error = request.getParameter("error");
        String success = request.getParameter("success");

        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
        if (success != null) {
    %>
        <p class="success"><%= success %></p>
    <%
        }
    %>

    <form action="signup" method="post">

        <!-- Username -->
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input 
                name="username" 
                type="text" 
                class="form-control" 
                placeholder="Enter username"
                required
                pattern="[A-Za-z0-9_]{5,15}"
                title="Username must be 5-15 characters (letters, numbers, underscore only)."
            />
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input 
                name="email" 
                type="email" 
                class="form-control" 
                placeholder="example@mail.com"
                required
            />
        </div>

        <!-- Password -->
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input 
                name="password" 
                type="password" 
                class="form-control" 
                placeholder="Minimum 8 characters"
                required
                pattern=".{8,}"
                title="Password must be at least 8 characters long."
            />
        </div>

        <button type="submit" class="btn btn-success w-100">Create Account</button>

        <div class="text-center mt-3">
            <a href="login.jsp">Already have an account? Login</a>
        </div>

    </form>
</div>

</body>
</html>
