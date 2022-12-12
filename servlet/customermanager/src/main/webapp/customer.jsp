<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Home Page</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="container">
    <h1>Customer manager</h1>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Full Name</th>
            <th scope="col">Address</th>
            <th scope="col">Country</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.customerList}" var="customer">
            <tr>
                <td>${customer.getId()}</td>
                <td>${customer.getFullName()}</td>
                <td>${customer.getAddress()}</td>
                <td>${customer.getCountry()}</td>
                <td><a href="${pageContext.request.contextPath}/customer-path?action=create" target = "_blank"><i class="fa fa-add"></i></a>
                    <a href="${pageContext.request.contextPath}/customer-path?action=edit&id=${customer.getId()}" target = "_blank"><i
                            class="fa fa-edit"></i></a>
                    <a href="/customer?action=remove" target = "_blank"><i class="fa fa-remove"></i></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>