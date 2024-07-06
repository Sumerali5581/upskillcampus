<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Patient</title>
    <script src="https://unpkg.com/phosphor-icons"></script>
    <style>
        body {
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/012/910/429/small/stethoscope-with-calendar-page-date-on-wood-table-background-doctor-appointment-medical-concept-photo.jpg');
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
            /* overflow: hidden; */
            background-color: #f4f4f4;
            /* padding: 20px; */
            /* display: grid;
            place-content: center;
            min-height: 100vh; */
        }

        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #1e1e1e;
            padding: 10px;
            /* border-radius: 10px; */
            gap: 28px;
            border-radius: 10px;

            margin-top: 0px;
            margin-left: 0px;
            z-index: 1;
        }

        .navbar li {
            position: relative;
            list-style: none;
            width: 72px;
            height: 50px;
            border-radius: 72px;
            /* background: white; */
            cursor: pointer;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 0 2px #fff;
            transition: 300ms;
        }

        .navbar li:hover {
            width: 180px;
            box-shadow: 0 0 0 2px var(--bg-color);
        }

        .navbar li::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 32px;
            background: var(--bg-color);
            opacity: 0;
            transition: 300ms;
        }

        .navbar li:hover::before {
            opacity: 1;
        }

        .navbar li span {
            position: absolute;
        }

        .navbar li i {
            color: #fff;
            font-size: 2em;
            transition: 300ms;
            transition-delay: 150ms;
        }

        .navbar li:hover i {
            transform: scale(0);
            color: #fff;
            transition-delay: 0s;
        }

        .navbar li .text {
            color: #1e1e1e;
            font-size: 1.5em;
            z-index: 1;
            text-transform: uppercase;
            font-weight: 400;
            letter-spacing: 0.024em;
            opacity: 0;
            transition: 300ms;
            letter-spacing: -0.125px;
        }

        .navbar li:hover .text {
            opacity: 1;
        }
        table {
            border-collapse: collapse;
            width: 40%;
            margin-top: 40px;
            margin-left: 450px;
        }

        th, td {
            border: 1px solid #000000;
            padding: 8px;
            text-align: left;
            background-color: transparent;
        }

        th {
            background-color: transparent;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Alegreya Sans", sans-serif;
        }

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Adjust the alpha value for the desired level of blur */
            z-index: -1;
        }

        .container {
            background-color: transparent;
            padding: 20px;
            backdrop-filter: blur(25px);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 1;
            margin-top: 125px;
            position: relative;
            width: 40%;
            margin-left: 450px;
            align-items: center;
            height: 50%;
        }

        .container h2{
            text-align: center;
            color: white;
        }

        form {
            text-align: center;
        }

        label {
            display: block;
            margin: 10px 0;
            text-align: start;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<ul class="navbar">
    <a href="patient_appointment">
        <li style="--bg-color: #a9c700;">

            <span class="icon"><i class="ph-house"></i></span>
            <span class="text">Home</span>
        </li>
    </a>
    <a href="patient_about">
        <li style="--bg-color: #E9724C;">
            <span class="icon"><i class="ph-user"></i></span>
            <span class="text">About</span>
        </li>
    </a>

    <a href="patient_prescription">
        <li style="--bg-color: #C5283D;">

            <span class="icon"><i class="ph ph-prescription"></i></span>
            <span class="text">Prescription</span>
        </li>
    </a>
    <a href="patient_appointment">
        <li style="--bg-color: #54bcce;">

            <span class="icon"><i class="ph ph-first-aid"></i></span>
            <span class="text">Appointment</span>
        </li>
    </a>
    <a href="patient_help">
        <li style="--bg-color: #0c68a5;">
            <span class="icon"><i class="ph-phone"></i></span>
            <span class="text">Contact</span>
        </li>
    </a>

    <a href="logout">
        <li style="--bg-color: #0c68a5;">
            <span class="icon"><i class="ph ph-sign-out"></i></span>
            <span class="text">Logout</span>
        </li>
    </a>
</ul>




<div class="container">

    <form action="/smtp_form1" method="post" enctype="multipart/form-data" class="m-5 w-50">
        <div class="login-header">
            <span>Contact Us</span>
        </div>
        <div class="input_box">
            <label for="subject" class="label">Subject</label>
            <input type="text" id="subject" name="subject" class="input-field" required>

            <i class="bx bx-user icon"></i>
        </div>
        <div class="input_box">
            <label for="body" class="label">Body</label>
            <input type="text" name="body" id="body" class="input-field" required>

            <i class="bx bx-lock-alt icon"></i>
        </div>
        <div class="mb-3">
            <label for="files" class="form-label">Attach Files</label>
            <input class="form-control" type="file" name="files" id="files" multiple>
        </div>
        <button style="width: 100%;" type="submit">Submit</button>
    </form>
</div>


</body>
</html>
