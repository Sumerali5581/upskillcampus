<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <title>Patient</title>
    <script src="https://unpkg.com/phosphor-icons"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/phosphor-icons/1.4.0/css/phosphor-icons.css">    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-image: url('https://b2930210.smushcdn.com/2930210/wp-content/uploads/Ways-to-Reduce-No-Show-Appointments.jpg?lossy=1&strip=1&webp=1');
        background-size: cover;

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
        margin-top: 0px;
        border-radius: 10px;

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
        width: 100%;
        margin-top: 40px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        background-color: white;
    }

    th {
        background-color: transparent;
    }

    .container {
        margin-top: 20px;
    }

    .container label {
        display: block;
        margin-bottom: 5px;
    }

    .container input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        box-sizing: border-box;
    }

    .container button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .container button:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<ul class="navbar">
    <a href="patient_appointment">
        <li style="--bg-color: #a9c700;">
            <span class="icon" ><i class="ph-light ph-house"></i></i></span>
            <span class="text">Home</span>
        </li>
    </a>
    <li style="--bg-color: #E9724C;">
        <span class="icon"><i class="ph-user"></i></span>
        <span class="text">About</span>
    </li>
    <a href="patient_prescription">
        <li style="--bg-color: #C5283D;">
            <span class="icon"><i class="ph-prescription"></i></span>
            <span class="text">Prescription</span>
        </li>
    </a>
    <a href="patient_appointment">
        <li style="--bg-color: #54bcce;">
            <span class="icon"><i class="ph-calendar"></i></span>
            <span class="text">Appointment</span>
        </li>
    </a>
    <li style="--bg-color: #0c68a5;">
        <span class="icon"><i class="ph-phone"></i></span>
        <span class="text">Contact</span>
    </li>
    <a href="logout">
        <li style="--bg-color: #0c68a5;">
            <span class="icon"><i class="ph-sign-out" style="color: white;"></i></span>
            <span class="text">Logout</span>
        </li>
    </a>
</ul>

<h1 style="margin-top: 90px">Appointments</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Patient Name</th>
        <th>Doctor Name</th>
        <th>Appointment Date</th>
        <th>Appointment Time</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="appointment" items="${appointments}">
        <tr>
            <td>${appointment.id}</td>
            <td>${appointment.patient_name}</td>
            <td>${appointment.doctor_name}</td>
            <td><fmt:formatDate value="${appointment.date}" pattern="dd-MM-yyyy" /></td>
            <td>${appointment.time}</td>
            <td>${appointment.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>