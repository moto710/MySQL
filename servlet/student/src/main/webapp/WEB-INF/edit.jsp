<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.15/dist/sweetalert2.all.min.js"></script>
  <link rel="stylesheet" href="dropdown.css">
</head>
<body>
<div class="container">
  <h1>Create New User</h1>
  <p><a href="users?action=create">List All Users</a></p>
  <form method="post" class="was-validated">
    <c:if test="${requestScope.msg != null}">
      <script>
        let message = '<%= request.getAttribute("msg")%>'
        window.onload = function () {
          Swal.fire({
            position: 'top-center',
            icon: 'success',
            title: message,
            showConfirmButton: false,
            timer: 1500
          })
        }
      </script>
    </c:if>
    <c:if test="${requestScope.errors != null}">
      <div class="alert alert-danger" role="alert">
        <ul>
          <c:forEach items="${requestScope.errors}" var="error">
            <li>${error}</li>
          </c:forEach>
        </ul>
      </div>
    </c:if>
    <div class="form-group">
      <label for="name">Full Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter Full Name" name="name" required
             value="${requestScope.needEditUser.getName()}">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" required
             value="${requestScope.needEditUser.getEmail()}">
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="country">Country:</label>
      <div class="custom-select">
        <select id="country" name="country">
          <option selected>
            <c:forEach items="${requestScope.countryList}" var="country">
              <c:if test="${country.getId() == requestScope.needEditUser.getIdCountry()}">${country.getName()}</c:if>
            </c:forEach>
          </option>
          <c:forEach items="${requestScope.countryList}" var="country">
            <option value="${country.getId()}">${country.getName()}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <button type="submit" class="btn btn-primary mb-3">Submit</button>
  </form>
</div>
<script src="dropdown.js"></script>
</body>
</html>