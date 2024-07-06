<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to Doctor Appointment Booking</title>
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


<section class="info">
    <a href="appointmentForm">
        <figure>
            <img
                    src="data:image/png;base64,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"
                    alt="Flood">
            <figcaption>
                <div class="caption-title">Book an Appointment?</div>
                <div class="caption-full">You can request for appointment to doctors.</div>
            </figcaption>
        </figure>
    </a>
    <a href="checkAppointment">
        <figure>
            <img
                    src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs81ePaBS6ArLJm5qRnE_p4dTFraTv8KPXRg&s"
                    alt="Landslide">
            <figcaption>
                <div class="caption-title">Check Appointment</div>
                <div class="caption-full">Check all your requested appointments.</div>
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
