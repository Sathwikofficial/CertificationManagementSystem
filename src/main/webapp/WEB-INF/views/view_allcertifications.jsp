<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Certifications</title>
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
    <h2>Your Certifications</h2>

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
                <th>Actions</th>
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
                        <a href="/admin/downloadCertification?certificationId=${cert.certificationId}">Download</a>
                    </td>
                    <td>
                        <a href="/admin/edit_certification?certificationId=${cert.certificationId}">Edit</a> |
                        <a href="/admin/delete_certification?certificationId=${cert.certificationId}">Delete</a>
                    </td>
                    
                </tr>
                </c:if>
            </c:forEach>
        </tbody>
    </table>

</body>
</html>
