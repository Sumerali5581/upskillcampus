<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
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
        section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        figure {
            position: relative;
            width: 220px;
            height: 320px;
            overflow: hidden;
            margin: 0 10px;
            border-radius: 0.6rem;
        }

        figure img {
            width: 100%;
            height: 100%;
            /* width: fit-content;
            height: 320px; */
            object-fit: cover;
            border: none;
        }

        figcaption {
            background-color: rgba(48, 48, 48, 0.3);
            color: #fff2de;
            padding: 10px 15px;
            /*margin: none;*/
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 42px;
            overflow: hidden;
            transition: 0.5s ease-in-out;
        }

        .caption-title {
            font-size: 1.2em;
        }

        .caption-full {
            opacity: 0;
            margin-top: 10px;
        }

        .expanded {
            height: 100%;
            transition: 0.5s ease-in-out;
            background-color: rgba(48, 48, 48, 0.7);
        }

        .visible {
            opacity: 100;
        }

        .image-filter {
            filter: blur(5px) contrast(90%);
        }
    </style>
</head>
<body>

<ul class="navbar">
    <a href="admin_dashboard">
        <li style="--bg-color: #a9c700;">

            <span class="icon"><i class="ph-house"></i></span>
            <span class="text">Home</span>
        </li>
    </a>
    <a href="admin_about">
        <li style="--bg-color: #E9724C;">
            <span class="icon"><i class="ph-user"></i></span>
            <span class="text">About</span>
        </li>
    </a>

    <a href="admin_prescription">
        <li style="--bg-color: #C5283D;">

            <span class="icon"><i class="ph ph-prescription"></i></span>
            <span class="text">Prescription</span>
        </li>
    </a>
    <a href="admin_appointment">
        <li style="--bg-color: #54bcce;">

            <span class="icon"><i class="ph ph-first-aid"></i></span>
            <span class="text">Appointment</span>
        </li>
    </a>
    <a href="admin_help">
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


<section class="info">
    <a href="admin_appointment">
        <figure>
            <img
                    src="data:image/png;base64,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"
                    alt="Flood">
            <figcaption>
                <div class="caption-title">Appointments</div>
                <div class="caption-full">See all appointments with your hospital.</div>
            </figcaption>
        </figure>
    </a>
    <a href="admin_prescription">
        <figure>
            <img
                    src="data:image/jpeg;base64,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"
                    alt="Landslide">
            <figcaption>
                <div class="caption-title">Prescriptions</div>
                <div class="caption-full">Check prescriptions.</div>
            </figcaption>
        </figure>
    </a>
    <a href="admin_role">
        <figure>
            <img
                    src="data:image/jpeg;base64,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"
                    alt="Landslide">
            <figcaption>
                <div class="caption-title">Doctors</div>
                <div class="caption-full">Check doctor list.</div>
            </figcaption>
        </figure>
    </a>
    <script >
        const figure = document.querySelectorAll('figure');
        const caption = document.querySelectorAll('figcaption');
        const fullCaption = document.querySelectorAll('.caption-full');
        const figureImage = document.querySelectorAll('figure img');

        figure.forEach((fig, idx) => {
            fig.addEventListener('mouseover', () => {
                caption[idx].classList.add('expanded');
                fullCaption[idx].classList.add('visible');
                figureImage[idx].classList.add('image-filter');
            });

            fig.addEventListener('mouseout', () => {
                caption[idx].classList.remove('expanded');
                fullCaption[idx].classList.remove('visible');
                figureImage[idx].classList.remove('image-filter');
            });
        });
    </script>
</section>
<script>
    <%-- Check if the flag indicating no confirmed appointment exists --%>
    <% if (request.getAttribute("noConfirmedAppointment") != null) { %>
    alert("You have no confirmed appointments.");
    <% } %>
</script>
</body>
</html>
