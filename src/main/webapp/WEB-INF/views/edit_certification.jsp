<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Certification</title>
</head>
<body>

    <h2>Edit Certification</h2>

    <form action="/user/edit_certification" method="post">
        <input type="hidden" name="certificationId" value="${certification.certificationId}" />

        <label for="certificationName">Certification Name:</label>
        <input type="text" id="certificationName" name="certificationName" value="${certification.certificationName}" required><br><br>

        <label for="issuedBy">Issued By:</label>
        <input type="text" id="issuedBy" name="issuedBy" value="${certification.issuedBy}" required><br><br>

        <label for="issueDate">Issue Date:</label>
        <input type="text" id="issueDate" name="issueDate" value="${certification.issueDate}" required><br><br>

        <label for="expirationDate">Expiration Date:</label>
        <input type="text" id="expirationDate" name="expirationDate" value="${certification.expirationDate}" required><br><br>

        <label for="certificateDescription">Description:</label>
        <textarea id="certificateDescription" name="certificateDescription">${certification.certificateDescription}</textarea><br><br>

        <button type="submit">Save Changes</button>
    </form>

</body>
</html>
