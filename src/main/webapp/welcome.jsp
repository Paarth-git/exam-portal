<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.examportal.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Exam Instructions | Exam Portal</title>

    <link rel="stylesheet" 
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #f0f4f7;
        }
        .card-box {
            max-width: 800px;
            margin: auto;
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
        }
        .logout-btn {
            position: absolute;
            top: 20px;
            right: 20px;
        }
    </style>

    <script>
        function enableStart() {
            document.getElementById("startBtn").disabled = 
                !document.getElementById("agree").checked;
        }
    </script>

</head>

<body>

<a href="logout" class="btn btn-danger logout-btn">Logout</a>

<div class="card-box">
    <h2 class="text-center mb-4">Welcome, <%= user.getUsername() %> 👋</h2>

    <h4>📘 Exam Instructions</h4>
    <ul>
        <li>The exam duration is <strong>25 minutes</strong>.</li>
        <li>The exam contains multiple-choice questions.</li>
        <li>The exam will auto-submit when the timer ends.</li>
        <li>Do not close the browser or press ESC.</li>
        <li>You must enter fullscreen AFTER the exam page loads.</li>
    </ul>

    <div class="form-check mt-3">
        <input class="form-check-input" type="checkbox" id="agree" onclick="enableStart()">
        <label class="form-check-label">
            I have read and understood all the instructions.
        </label>
    </div>

    <div class="text-center mt-4">
        <form action="startExam" method="get">
            <button id="startBtn" class="btn btn-primary" disabled>
                Start Exam
            </button>
        </form>
    </div>

</div>

</body>
</html>
