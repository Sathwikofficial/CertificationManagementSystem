<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <style>
        /* General Styles */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    color: #fff;
    background-color: #f4f4f9;
}

/* Sidebar */
.sidebar {
    height: 100vh;
    width: 260px;
    background-color: #1e293b; /* Dark Blue Gray */
    position: fixed;
    top: 0;
    left: 0;
    padding-top: 20px;
    box-shadow: 2px 0 10px rgba(0, 0, 0, 0.2);
    transition: width 0.3s ease-in-out;
}

.sidebar a,
.sidebar button {
    padding: 15px 20px;
    text-decoration: none;
    font-size: 18px;
    color: #cbd5e1; /* Light Grayish Blue */
    display: block;
    border: none;
    background: none;
    width: 83%;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
}

.sidebar a:hover,
.sidebar button:hover {
    background-color: #334155; /* Deeper Blue Gray */
    color: #ffffff;
}

.sidebar a.active {
    background-color: #475569; /* Steel Blue Gray */
    color: #ffffff;
    font-weight: bold;
}

.dropdown-container {
    display: none;
    background-color: #334155; /* Matches the hover effect of buttons */
    padding-left: 20px;
    transition: all 0.3s ease-in-out;
}

.dropdown-container a {
    font-size: 16px;
    color: #94a3b8; /* Lighter Grayish Blue */
    padding: 10px 20px;
    transition: color 0.3s ease;
}

.dropdown-container a:hover {
    color: #ffffff;
}

/* Main Content */
.main-content {
    margin-left: 260px;
    padding: 20px;
    flex-grow: 1;
    transition: margin-left 0.3s ease-in-out;
}

.navbar {
    background-color: #1e293b;
    color: #ffffff;
    padding: 10px 20px;
    font-size: 22px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
}

.logout-btn {
    background-color: #ef4444; /* Bright Red */
    color: #ffffff;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.logout-btn:hover {
    background-color: #dc2626; /* Darker Red */
}

/* Content Section */
#content-section {
    background-color: #ffffff;
    color: #1e293b;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
    animation: fadeIn 0.5s ease-in-out;
}

/* Animations */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    .sidebar {
        width: 200px;
    }

    .main-content {
        margin-left: 200px;
    }

    .navbar {
        font-size: 18px;
    }
}
        

      
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <a href="#" class="active" id="dashboard-link">Dashboard</a>
        
        <button class="dropdown-btn">Certification Management</button>
        <div class="dropdown-container">
            
             <a href="#" onclick="loadContent('view_pending_certifications')">Accept Certification</a>
            <a href="#" onclick="loadContent('view_allcertifications')">View Certification</a>
            
            
        </div>
        
        <a href="#" onclick="loadContent('monitor_allrenewals')">Track Expiration Dates</a>
        <a href="#" onclick="loadContent('facilitate_renewals')">Facilitate Renewals</a>
        
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Navbar -->
        <div class="navbar">
            <span>Welcome, Admin!</span>
            <span>Email: <%= request.getAttribute("email") %></span>
            <a href="<%= request.getContextPath() %>/logout" class="logout-btn">Logout</a>
        </div>

        <!-- Default Content Section -->
        <div id="content-section">
            <h2>Welcome, Admin!</h2>
            <p>Your email: <span><%= request.getAttribute("email") %></span></p>
            <p>This is the admin dashboard. Use the menu to navigate to different sections.</p>
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
            fetch('/admin/' + page)  // Adjusted to remove ".jsp" extension, as the controller handles this
                .then(response => response.text())
                .then(data => {
                    document.getElementById('content-section').innerHTML = data;
                })
                .catch(error => console.error('Error loading content:', error));
        }
    </script>
</body>
</html>
