<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
</head>
<body>
<div class="container">
    <h1>User Management</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.userList}" var="user">
            <tr>
                <td>${user.getId()}</td>
                <td>${user.getName()}</td>
                <td>${user.getEmail()}</td>
                <c:forEach items="${countryList}" var="country">
                    <c:if test="${user.getIdCountry() == country.getId()}">
                        <td>${country.getName()}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.getId()}"
                       data-toggle="tooltip" data-placement="top" title="Edit!">
                        <i class="fa-solid fa-pen-nib"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.getId()}"
                       data-toggle="tooltip" data-placement="top" title="Remove!">
                        <i class="fa-regular fa-rectangle-xmark"></i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<div class="container d-flex flex-row-reverse">
    <a href="${pageContext.request.contextPath}/users?action=create">
        <button type="button" class="btn btn-primary btn-lg mb-3">Create New User</button>
    </a>
</div>
</body>
</html>