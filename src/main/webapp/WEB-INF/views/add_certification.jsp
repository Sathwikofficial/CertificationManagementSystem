<%@ page import="java.time.LocalDate" %>
<%
    // Get the current date in yyyy-MM-dd format
    String currentDate = LocalDate.now().toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Certification</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 32px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 30px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
        }
        
         .container {
            max-width: 800px; /* Increased width */
            margin: 0 auto;
            padding: 20px;
        }

        form {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.05);
            max-width: 600px;
            margin: 0 auto;
            box-sizing: border-box;
        }

        label {
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
            display: block;
            font-size: 16px;
        }

        input[type="text"], input[type="date"], input[type="file"], textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus, input[type="file"]:focus, textarea:focus {
            border-color: #66a6ff;
            box-shadow: 0 0 8px rgba(102, 166, 255, 0.5);
            outline: none;
            background-color: #fff;
        }

        textarea {
            resize: vertical;
            height: 120px;
        }

        input[type="submit"] {
            background: linear-gradient(120deg, #66a6ff, #89f7fe);
            color: #fff;
            border: none;
            padding: 15px 30px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 1px;
            transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(120deg, #89f7fe, #66a6ff);
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(102, 166, 255, 0.2);
        }

        input[type="submit"]:active {
            transform: translateY(1px);
            box-shadow: 0 3px 6px rgba(102, 166, 255, 0.2);
        }

        div {
            text-align: center;
            margin-top: 20px;
        }

        span {
            display: inline-block;
            padding: 12px 18px;
            border-radius: 6px;
            margin: 10px;
            font-weight: bold;
            font-size: 14px;
        }

        span:first-of-type {
            background-color: #66a6ff;
            color: white;
        }

        span:last-of-type {
            background-color: #ff6b6b;
            color: white;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            form {
                padding: 20px;
            }

            input[type="submit"] {
                width: 100%;
            }

            h2 {
                font-size: 26px;
                margin-bottom: 20px;
            }

            label {
                font-size: 14px;
            }

            input[type="text"], input[type="date"], input[type="file"], textarea {
                padding: 12px;
            }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #89f7fe;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #66a6ff;
        }

    </style>
</head>
<body>
    <h2>Add Certification</h2>
    
    <div class="container">
    <form action="/user/add_certification" method="post" enctype="multipart/form-data">
        <label for="certificationName">Certification Name:</label><br>
        <input type="text" id="certificationName" name="certificationName" required><br>

        <label for="issuedBy">Issued By:</label><br>
        <input type="text" id="issuedBy" name="issuedBy" required><br>

        <label for="issueDate">Issue Date:</label><br>
        <input type="date" id="issueDate" name="issueDate" max="<%= currentDate %>" required><br>

        <label for="expirationDate">Expiration Date:</label><br>
        <input type="date" id="expirationDate" name="expirationDate" min="<%= currentDate %>" required><br>

        <!-- Hidden input to carry the session email -->
        <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">

        <label for="certificateDescription">Certification Description:</label><br>
        <textarea id="certificateDescription" name="certificateDescription" required></textarea><br>

        <label for="file">Upload Certification File:</label><br>
        <input type="file" id="file" name="file" required><br>

        <input type="submit" value="Add Certification">
    </form>

    
    
    <c:if test="${not empty message}">
            <div class="error-message">
                <c:out value="${message}" />
            </div>
        </c:if>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastify-js/1.12.0/toastify.js"></script>
    
    <script>
        // Fetch the message from the JSP page
        const message = `<c:out value="${message}" />`.trim();

        // Display toast if the message is not empty
        if (message) {
            Toastify({
                text: message,
                duration: 3000,
                close: true,
                gravity: "top", // `top` or `bottom`
                position: "right", // `left`, `center`, or `right`
                backgroundColor: "linear-gradient(to right, #4CAF50, #8BC34A)",
                stopOnFocus: true // Prevent dismiss on hover
            }).showToast();
        }
    </script>
    
    
    
    
</body>


</html>
