<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitor Renewal DeadLines</title>
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
    </style>
</head>
<body>
    <h2>Your Renewals DeadLines</h2>

    <table>
        <thead>
            <tr>
                <th>Certification Name</th>
                <th>Issued By</th>
                <th>Issue Date</th>
                <th>Expiration Date</th>
                <th>Description</th>
                <th>Download</th>
                
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
                    <td>
                        <a href="/user/downloadCertification?certificationId=${cert.certificationId}">Download</a>
                    </td>
                    
                </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
