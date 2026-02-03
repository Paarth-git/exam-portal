<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer score = (Integer) request.getAttribute("score");
    Integer total = (Integer) request.getAttribute("total");

    if (score == null) {
        response.sendRedirect("welcome.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Exam Result | Exam Portal</title>
    <style>
        body { 
            font-family: Arial; text-align: center; padding-top: 80px; 
            background: #f0f2f5;
        }
        .box {
            background: #fff; padding: 30px; width: 350px; 
            margin: auto; border-radius: 10px; 
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        .btn {
            background: #007bff; color: white; 
            padding: 10px 22px; text-decoration: none; 
            border-radius: 5px; display: inline-block; margin-top: 20px;
        }
    </style>
</head>

<body>
<div class="box">
    <h2>Your Exam Result</h2>
    <h3>Score: <%= score %> / <%= total %></h3>

    <a href="logout" class="btn">Logout</a>
</div>
</body>
</html>
