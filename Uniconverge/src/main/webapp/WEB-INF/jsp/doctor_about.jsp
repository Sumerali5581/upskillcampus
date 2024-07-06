<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>About</title>
    <script src="https://unpkg.com/phosphor-icons"></script>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Alegreya+Sans&display=swap");
        body {
            background-image: url('https://static.vecteezy.com/system/resources/thumbnails/012/910/429/small/stethoscope-with-calendar-page-date-on-wood-table-background-doctor-appointment-medical-concept-photo.jpg');
            background-size: cover;
            margin: 0;
            font-family: Arial, sans-serif;
            overflow: hidden;
            background-color: #f4f4f4;

            display: grid;
            place-content: center;
            min-height: 100vh;
        }

        ul {
            position: fixed;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: center; /* Center the icons horizontally */
            align-items: center;
            background-color: #1e1e1e;
            padding: 10px;
            border-radius: 10px;
            gap: 10px;
        }

        ul li {
            position: relative;
            list-style: none;
            width: 72px;
            height: 50px;
            border-radius: 72px;
            background: #1e1e1e;
            cursor: pointer;
            display: flex;
            flex-direction: column; /* Stack icon and text vertically */
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 0 2px #fff;
            transition: 300ms;
        }


        ul li:hover {
            width: 160px;
            box-shadow: 0 0 0 2px var(--bg-color);
        }

        ul li::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 32px;
            background: var(--bg-color);
            opacity: 0;
            transition: 300ms;
        }

        ul li:hover::before {
            opacity: 1;
        }

        ul li span {
            position: absolute;
        }

        ul li i {
            color: #fff;
            font-size: 2em;
            transition: 300ms;
            transition-delay: 150ms;
        }

        ul li:hover i {
            transform: scale(0);
            color: #fff;
            transition-delay: 0s;
        }

        ul li .text {
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

        section {
            margin-bottom: 40px;
        }
        ul li:hover .text {
            opacity: 1;
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



        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            text-align: center;
            text-decoration: none;
            background-color: #4CAF50;
            color: #fff;
            border-radius: 5px;
            margin: 10px;
        }

        .btn:hover {
            background-color: #45a049;
        }

        footer {
            /* background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center; */
            position: fixed;
            bottom: 0;
            width: 100%;
            display: flex;
            justify-content: center; /* Center the icons horizontally */
            align-items: center;
            background-color: #1e1e1e;
            padding: 10px;
            border-radius: 10px;
            gap: 10px;
        }
        ul1 {
            list-style-type: none;
            padding: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
        }

        li1 {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<ul class="navbar">
    <a href="doctor_appointment">
        <li style="--bg-color: #a9c700;">

            <span class="icon"><i class="ph-house"></i></span>
            <span class="text">Home</span>
        </li>
    </a>
    <a href="doctor_about">
        <li style="--bg-color: #E9724C;">
            <span class="icon"><i class="ph-user"></i></span>
            <span class="text">About</span>
        </li>
    </a>

    <a href="doctor_prescription">
        <li style="--bg-color: #C5283D;">

            <span class="icon"><i class="ph ph-prescription"></i></span>
            <span class="text">Prescription</span>
        </li>
    </a>
    <a href="doctor_appointment">
        <li style="--bg-color: #54bcce;">

            <span class="icon"><i class="ph ph-first-aid"></i></span>
            <span class="text">Appointment</span>
        </li>
    </a>
    <a href="doctor_help">
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


<main>
    <section1 style="margin-top: 80px;">
        <h2>About us</h2>
        <p>This website is developed to manage all hospital records.</p>
    </section1>

    <section>
        <h2>Our Team</h2>
        <ul1>


            <li1>
                <img src="https://media.licdn.com/dms/image/D4D03AQH6CCPdDUVeOQ/profile-displayphoto-shrink_200_200/0/1708966655824?e=1724889600&v=beta&t=ouIU-mHe-ym7H_w19hYf9pKZnq7Y36ezszNUCLJKixA" alt="Aishwarya" width="400" height="400">
                <h3>Aishwarya Bangar</h3>
                <a href="https://www.linkedin.com/in/aishwarya-bangar-076245232/" class="contact-button">Contact</a>
            </li1>

            <li1>
                <img src="https://media.licdn.com/dms/image/D5635AQEwVav224XcaQ/profile-framedphoto-shrink_200_200/0/1682317565128?e=1720180800&v=beta&t=SFHca2h8bJbsbRqzHB0Z8KUionw4YDsWdPaDhqZZnjg" alt="Sumer"
                     width="400" height="400">
                <h3>Sumer Ali</h3>
                <a href="https://www.linkedin.com/in/sumer-ali-921015229/" class="contact-button">Contact</a>
            </li1>

        </ul1>
    </section>

    <section>
        <h2>Our Mission</h2>
        <p>To provide flexible and enhanced system to manage hospital records.</p>
    </section>
</main>

<footer>
    <p><a href="doctor_help">Want to contact us.</a></p>
</footer>
</body>
</html>
