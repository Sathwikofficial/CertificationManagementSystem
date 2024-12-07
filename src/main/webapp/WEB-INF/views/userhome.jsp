<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Home</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            color: #333;
        }

        h2 {
            text-align: center;
            color: #fff;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 20px;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #333;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        /* Main Content Area */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            flex-grow: 1;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            margin: 20px auto;
        }

        /* Navbar */
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 22px;
        }

        .logout-btn {
            float: right;
            padding: 10px;
            background-color: #f44336;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .logout-btn:hover {
            background-color: #e53935;
        }

        /* Form Styles */
        form {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            box-sizing: border-box;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #444;
        }

        input[type="text"], input[type="date"], input[type="file"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #66a6ff;
            box-shadow: 0 0 5px rgba(102, 166, 255, 0.5);
            outline: none;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input[type="submit"] {
            background: linear-gradient(120deg, #66a6ff, #89f7fe);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            transform: translateY(0);
        }

        /* Transition Effects */
        input[type="text"], input[type="email"], input[type="date"], input[type="file"], textarea {
            position: relative;
        }

        input[type="text"]:hover, input[type="email"]:hover, input[type="date"]:hover, input[type="file"]:hover, textarea:hover {
            border-color: #89f7fe;
        }

        /* Message Section */
        div {
            text-align: center;
            margin-top: 20px;
        }

        span {
            display: inline-block;
            padding: 10px;
            border-radius: 5px;
            margin: 5px;
            font-weight: bold;
            color: white;
        }

        span:first-of-type {
            background-color: #66a6ff;
        }

        span:last-of-type {
            background-color: #ff6b6b;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            form {
                padding: 20px;
            }

            input[type="submit"] {
                width: 100%;
            }

            h2 {
                font-size: 18px;
            }
        }

        /* Dropdown Menu Styles */
        .dropdown-btn {
            font-size: 18px;
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            background: #333;
            border: none;
            width: 100%;
            text-align: left;
            cursor: pointer;
            display: block;
            transition: 0.3s;
        }

        .dropdown-btn:hover {
            background-color: #575757;
        }

        .dropdown-container {
            display: none;
            background-color: #262626;
            padding-left: 20px;
        }

        .dropdown-container a {
            color: lightgray;
        }

        .dropdown-container a:hover {
            color: white;
        }

        .active {
            background-color: #575757;
        }

    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
       
        <a href="#" class="active" onclick="loadContent('User_DashBoard')">Dashboard</a>
        
        <button class="dropdown-btn">Certification Management</button>
        <div class="dropdown-container">
            <a href="#" onclick="loadContent('add_certification?email=<%= request.getAttribute("email") %>')">Add Certification</a>
            <a href="#" onclick="loadContent('view_mycertifications?email=<%= request.getAttribute("email") %>')">View Certification</a>
        </div>
        <a href="#" onclick="loadContent('monitor_myrenewals?email=<%= request.getAttribute("email") %>')">Monitor Renewal Deadlines</a>
        
       <button class="dropdown-btn">Settings</button>
        <div class="dropdown-container">
            <a href="#" onclick="loadContent('user_profile?email=<%= request.getAttribute("email") %>')">My Profile</a>
            
        </div>
    </div>

	<div class="navbar">
            <span>Welcome, User!</span>
            <span>Email: <%= request.getAttribute("email") %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
        </div>
    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Navbar -->
        

        <!-- Default Content Section -->
        <div id="content-section">
   

   

   
</div>


        
    </div>

    <script>
        // Toggle Dropdown Menu
        var dropdownBtns = document.querySelectorAll('.dropdown-btn');
        dropdownBtns.forEach(function (btn) {
            btn.addEventListener('click', function () {
                var dropdown = this.nextElementSibling;
                dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
                this.classList.toggle('active');
            });
        });

        // Optional: Highlight the active link in the sidebar
        var sidebarLinks = document.querySelectorAll('.sidebar a');
        sidebarLinks.forEach(function (link) {
            link.addEventListener('click', function () {
                sidebarLinks.forEach(function (link) {
                    link.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        // Load content dynamically into the content section
        function loadContent(page) {
            fetch('/user/' + page)  
                .then(response => response.text())
                .then(data => {
                    document.getElementById('content-section').innerHTML = data;
                })
                .catch(error => console.error('Error loading content:', error));
        }
        
     // Load the dashboard by default
        window.onload = function() {
            loadContent('User_DashBoard');
        }
    </script>
</body>
</html>
