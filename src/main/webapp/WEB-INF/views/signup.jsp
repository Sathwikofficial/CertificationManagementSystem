<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
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

        /* Navigation Bar Styles */
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
        
        .menu {
            display: none;
            flex-direction: column;
            position: absolute;
            top: 60px;
            right: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            z-index: 1000;
        }

        .menu-item {
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .menu-item:hover {
            background-color: #f0f0f0;
        }

        .hamburger {
            display: flex;
            flex-direction: column;
            justify-content: center;
            cursor: pointer;
        }

        .bar {
            height: 3px;
            width: 25px;
            background-color: #6b5b95;
            margin: 3px 0;
            transition: 0.3s;
        }
        

        /* Container Styles */
        .container {
            width: 400px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            margin: auto;
            margin-top: 50px;
            transition: transform 0.3s, box-shadow 0.3s;
            max-height: 83vh;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.5);
        }

        .container h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2em;
            color: #333;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 10px;
            font-size: 1em;
            transition: border 0.3s, background 0.3s;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border: 1px solid #6b5b95;
            outline: none;
            background-color: #f8f8f8;
        }
        
        @keyframes slideIn {
		    0% {
		        opacity: 0;
		        transform: translateY(20%);
		    }
		    100% {
		        opacity: 1;
		        transform: translateY(0);
		    }
		}
		
		@keyframes slideOut {
		    0% {
		        opacity: 1;
		        transform: translateY(0);
		    }
		    100% {
		        opacity: 0;
		        transform: translateY(20%);
		    }
		}

        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            padding: 15px;
            background-color: #6b5b95;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #5a4c7e;
            transform: translateY(-2px);
        }

        .create-account {
            text-align: center;
            margin-top: 20px;
        }

        .create-account a {
            text-decoration: none;
            color: #6b5b95;
            font-weight: bold;
            transition: color 0.3s;
        }

        .create-account a:hover {
            color: #feb236;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
        
         /* Popup Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1001;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }
        .video-background {
		    position: fixed;
		    top: 20;
		    left: 0;
		    width: 100vw;   /* Full viewport width */
		    height: 100vh;  /* Full viewport height */
		    z-index: -1;
		    object-fit: cover; /* Ensures the video covers the background */
		}

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 10px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        /* Apply animation to modal */
		.modal-content {
		    animation: slideIn 0.5s ease forwards;
		}
		
		.modal-content.hide {
		    animation: slideOut 0.5s ease forwards;
		}

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .menu {
                width: 200px;
            }

            .role-options {
                flex-direction: column;
            }

            .role-option {
                margin: 5px 0;
            }
        }
        
    </style>
    
   <script>
    
    
    
        // Toggle menu display
        function toggleMenu() {
            const menu = document.getElementById("menu");
            menu.style.display = menu.style.display === "flex" ? "none" : "flex";
        }

        // Close menu on item click
        function closeMenu() {
            document.getElementById("menu").style.display = "none";
        }

        // Close menu when clicking outside of the menu
        window.onclick = function(event) {
            const menu = document.getElementById("menu");
            if (event.target == menu) {
                closeMenu();
            }
        };

        

        // Show modal
        function showModal(modalId) {
            const modal = document.getElementById(modalId);
            modal.style.display = "block";
        }

        // Close modal
        function closeModal(modalId) {
            const modalContent = document.querySelector(`#${modalId} .modal-content`);
            modalContent.classList.add('hide');
            setTimeout(() => {
                document.getElementById(modalId).style.display = 'none';
                modalContent.classList.remove('hide');
            }, 500);  // Duration of the closing animation
        }
        
        function Login() {
            window.location.href = '/login';     // Redirect to signup page
        }
    </script>
    
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <h1>Skill Certification Management System</h1>
        <div>
            <div class="hamburger" onclick="toggleMenu()">
                <div class="bar"></div>
                <div class="bar"></div>
                <div class="bar"></div>
            </div>
            <div id="menu" class="menu">
                <div class="menu-item" onclick="showModal('aboutModal'); closeMenu()">About</div>
                <div class="menu-item" onclick="showModal('servicesModal'); closeMenu()">Services</div>
                <div class="menu-item" onclick="showModal('faqsModal'); closeMenu()">FAQs</div>
            </div>
        </div>
    </nav>

    <!-- Background Video -->
    <video autoplay muted loop class="video-background">
        <source src="${pageContext.request.contextPath}/background1.mp4" type="video/mp4">
    </video>

    <!-- Signup Form Container -->
    <div class="container">
        <h2>User Signup</h2>
        
        <!-- Display Error or Success Messages -->
        <div style="color: red; text-align: center; margin-bottom: 20px;">
            <c:if test="${not empty errorMessage}">
                <p>${errorMessage}</p>
            </c:if>
        </div>
        <div style="color: green; text-align: center; margin-bottom: 20px;">
            <c:if test="${not empty successMessage}">
                <p>${successMessage}</p>
            </c:if>
        </div>

        <form action="${pageContext.request.contextPath}/signup" method="post">
            <label>Full Name:</label>
            <input type="text" name="fullName" value="${user.fullName}" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${user.email}" required>

            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Signup">
        </form>
        <div class="create-account">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
        </div>
    </div>
    
    <!-- About Modal -->
    <div id="aboutModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('aboutModal')">&times;</span>
            <h2>About Us</h2>
            <p>This system is designed to help users manage their professional skill certifications effectively.</p>
        </div>
    </div>

    <!-- Services Modal -->
    <div id="servicesModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('servicesModal')">&times;</span>
            <h2>Our Services</h2>
            <p>We offer a range of services including certification tracking, reminders for renewals, and online verification.</p>
        </div>
    </div>

    <!-- FAQs Modal -->
    <div id="faqsModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('faqsModal')">&times;</span>
            <h2>Frequently Asked Questions</h2>
            <p>1. How can I track my certifications?</p>
            <p>2. What happens when a certification expires?</p>
            <p>3. How do I renew my certifications?</p>
            <p>For more inquiries, feel free to contact us!</p>
        </div>
    </div>
</body>
</html>
