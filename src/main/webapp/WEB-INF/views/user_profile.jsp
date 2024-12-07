<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Profile</title>
    <style>
        table {
            border-collapse: collapse;
            width: 50%;
            margin: 20px auto;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
        }

        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>User Profile</h1>

    <c:choose>
        <c:when test="${not empty user}">
            <table>
                <tr>
                    <th>Full Name</th>
                    <td>${user.fullName}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>${user.phoneNumber}</td>
                </tr>
                <tr>
                    <th>Active Status</th>
                    <td>${user.active ? "Active" : "Inactive"}</td>
                </tr>
            </table>
        </c:when>
        <c:otherwise>
            <p class="error">${error}</p>
        </c:otherwise>
    </c:choose>
</body>
</html>
