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
    <title>Exam | Exam Portal</title>


    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"/>

    <style>
        body { background: #f5f7fa; }
        .question-card {
            max-width: 850px;
            margin: auto;
            margin-top: 30px;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 0px 12px rgba(0,0,0,0.2);
            display: none;
        }
        #timerBox {
            position: fixed;
            top: 15px;
            right: 20px;
            padding: 10px 18px;
            background: #dc3545;
            color: white;
            font-size: 20px;
            border-radius: 8px;
            font-weight: bold;
            display: none;
        }
    </style>

    <script>
   

        function enterFullscreen() {
            let elem = document.documentElement;

            if (elem.requestFullscreen) {
                elem.requestFullscreen();
            }


            document.getElementById("fsBox").style.display = "none";
            document.getElementById("timerBox").style.display = "block";
            document.querySelector(".question-card").style.display = "block";

            startTimer();
        }

    
        document.addEventListener("fullscreenchange", () => {
            if (!document.fullscreenElement) {
                alert("⚠️ Fullscreen is required for the exam!");
                enterFullscreen();
            }
        });



        let totalSeconds = 25 * 60;

        function startTimer() {
            let timer = setInterval(function () {
                let minutes = Math.floor(totalSeconds / 60);
                let seconds = totalSeconds % 60;

                document.getElementById("timer").innerHTML =
                    minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

                totalSeconds--;

                if (totalSeconds < 0) {
                    clearInterval(timer);
                    submitExam();
                }
            }, 1000);
        }




        function submitExam() {
            let score = 0;

            if (document.querySelector("input[name='q1']:checked")?.value === "a") score++;
            if (document.querySelector("input[name='q2']:checked")?.value === "b") score++;
            if (document.querySelector("input[name='q3']:checked")?.value === "d") score++;
            if (document.querySelector("input[name='q4']:checked")?.value === "a") score++;
            if (document.querySelector("input[name='q5']:checked")?.value === "c") score++;

            document.getElementById("scoreField").value = score;
            document.getElementById("examForm").submit();
        }
    </script>

</head>

<body>


<div id="fsBox" 
     style="text-align:center; margin-top:60px; display:block;">
    <h2>🔒 Exam Fullscreen Mode</h2>
    <p>Click the button below to enter fullscreen and start the exam.</p>

    <button onclick="enterFullscreen()" 
            class="btn btn-dark btn-lg">
        Enter Fullscreen And Start Exam
    </button>
</div>


<div id="timerBox">
    ⏳ <span id="timer">25:00</span>
</div>


<div class="question-card">

    <h3 class="text-center mb-4">Exam</h3>

    <form id="examForm" action="submitExam" method="post">

        <input type="hidden" id="scoreField" name="score" value="0">

        <h5>1. Which keyword is used to inherit a class in Java?</h5>
        <input type="radio" name="q1" value="a"> extends<br>
        <input type="radio" name="q1" value="b"> implements<br>
        <input type="radio" name="q1" value="c"> this<br>
        <input type="radio" name="q1" value="d"> super<br><br>

        <h5>2. Which HTML tag is used to create a hyperlink?</h5>
        <input type="radio" name="q2" value="a"> &lt;link&gt;<br>
        <input type="radio" name="q2" value="b"> &lt;a&gt;<br>
        <input type="radio" name="q2" value="c"> &lt;href&gt;<br>
        <input type="radio" name="q2" value="d"> &lt;url&gt;<br><br>

        <h5>3. Which DB is open-source and widely used?</h5>
        <input type="radio" name="q3" value="a"> Oracle<br>
        <input type="radio" name="q3" value="b"> SQL Server<br>
        <input type="radio" name="q3" value="c"> MongoDB<br>
        <input type="radio" name="q3" value="d"> MySQL<br><br>

        <h5>4. Java code is executed by ___ ?</h5>
        <input type="radio" name="q4" value="a"> JVM<br>
        <input type="radio" name="q4" value="b"> Compiler<br>
        <input type="radio" name="q4" value="c"> Interpreter<br>
        <input type="radio" name="q4" value="d"> Loader<br><br>

        <h5>5. Which CSS property changes text color?</h5>
        <input type="radio" name="q5" value="a"> style<br>
        <input type="radio" name="q5" value="b"> text-color<br>
        <input type="radio" name="q5" value="c"> color<br>
        <input type="radio" name="q5" value="d"> background<br><br>

        <div class="text-center mt-3">
            <button type="button" onclick="submitExam()" class="btn btn-success btn-lg">
                Submit Exam
            </button>
        </div>

    </form>

</div>

</body>
</html>
