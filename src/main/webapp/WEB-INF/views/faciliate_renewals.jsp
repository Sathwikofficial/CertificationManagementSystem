<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitor Renewal Deadlines</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        .message {
            margin: 10px 0;
            padding: 10px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h2>All Renewals Deadlines</h2>

    <!-- Display success or error message if present -->
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>

    <table>
        <thead>
            <tr>
                <th>Certification Name</th>
                <th>Issued By</th>
                <th>Issue Date</th>
                <th>Expiration Date</th>
                <th>Description</th>
                <th>Email</th>
                <th>Download</th>
                <th>Send Reminder</th> <!-- New Column for Send Reminder Button -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cert" items="${certifications}">
            <c:if test="${cert.active}">
                <tr>
                    <td>${cert.certificationName}</td>
                    <td>${cert.issuedBy}</td>
                    <td>${cert.issueDate}</td>
                    <td>${cert.expirationDate}</td>
                    <td>${cert.certificateDescription}</td>
                    <td>${cert.email}</td>
                    <td>
                        <a href="/user/downloadCertification?certificationId=${cert.certificationId}">Download</a>
                    </td>
                    <td>
                        <!-- Button to trigger email sending -->
                        <form action="/admin/sendRenewalReminder" method="post">
                            <input type="hidden" name="certificationId" value="${cert.certificationId}" />
                            <button type="submit">Send Reminder</button>
                        </form>
                    </td>
                </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
