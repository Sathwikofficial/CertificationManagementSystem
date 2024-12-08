<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #6b5b95, #feb236);
            height: 100vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        nav {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        nav h1 {
            margin: 0;
            font-size: 1.5em;
            color: #6b5b95;
        }

        .navbar-buttons {
            display: flex;
            gap: 15px;
        }

        .navbar-buttons button {
            padding: 10px 20px;
            background-color: #6b5b95;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1em;
        }

        .navbar-buttons button:hover {
            background-color: #5a4c7e;
        }

        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            object-fit: cover;
        }

        .container {
            width: 400px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            margin: auto;
            margin-top: 50px;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }

        .welcome-message {
            font-size: 1.2em;
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .project-description {
            font-size: 1.1em;
            color: #333;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .logout-button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #6b5b95;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            margin-top: 20px;
        }

        .logout-button:hover {
            background-color: #5a4c7e;
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- Video Background -->
    <video class="video-background" autoplay loop muted>
        <source src="your-video-file.mp4" type="video/mp4">
    </video>

    <!-- Navigation Bar -->
    <nav>
        <h1>Certification Tracking System</h1>
        <div class="navbar-buttons">
            <button onclick="window.location.href='/login'">Login</button>
            <button onclick="window.location.href='/signup'">Signup</button>
        </div>
    </nav>

    <!-- Home Page Container -->
    <div class="container">
        <h2>Welcome to the Certification Tracking System</h2>
        <p class="welcome-message">
            Hello, User! This platform helps you efficiently track and manage your professional certifications, ensuring they remain up to date.
        </p>

        <!-- Project Description Section -->
        <div class="project-description">
            <p>
                Our project, "Professional Skill Certification Tracking System," aims to simplify the management of certifications by storing and organizing all the necessary information. 
                Users can easily track certification expiry dates, request renewals, and store certificates for quick access. The system will send timely reminders to ensure that certifications are renewed before their expiration.
            </p>
            <p>
                This system is designed with ease of use and scalability in mind. As you continue to gain new skills and certifications, this platform will grow with you, helping you manage all your qualifications in one central place.
            </p>
        </div>

        
    </div>

</body>
</html>
