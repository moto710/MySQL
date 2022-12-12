<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
          integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="container">
    <h1>Edit Customer</h1>
    <form method="post" class="d-flex flex-column mb-3 ">
        <label for="id">ID Customer: </label>
        <input type="text" name="id" id="id" disabled value="${requestScope.customerId.getId()}" class="form-control" >
        <label for="idName">Name: </label>
        <input type="text" id="idName" name="name" class="form-control" value="${requestScope.customerId.getFullName()}"
               placeholder="${requestScope.customerId.getFullName()}">
        <label for="idAddress">Address: </label>
        <input type="text" id="idAddress" name="address" class="form-control"
               value="${requestScope.customerId.getAddress()}">
        <label for="idCountry">Country: </label>
        <input type="text" id="idCountry" name="country" class="form-control"
               value="${requestScope.customerId.getCountry()}">
        <button type="submit">Edit</button>
        <button class="btn btn-light p-2">${requestScope.idc}</button>
    </form>
</div>
</body>
</html>