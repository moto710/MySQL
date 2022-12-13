<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
  <h2>Create New Customer</h2>
  <p><a href="users?action=users">List All Users</a></p>
  <form class="was-validated" method="post">
    <div class="form-group">
      <label for="name">Username:</label>
      <input type="text" class="form-control" placeholder="Enter Customer's Name" name="name" id="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" placeholder="Enter Customer's Email" name="email" id="email" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="country">Country:</label>
      <input type="text" class="form-control" placeholder="Enter Customer's Country" name="idCountry" id="country" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <button type="submit" class="btn btn-primary">Create new Customer</button>
  </form>
</div>


<%--<div align="center">--%>
<%--  <form method="post">--%>
<%--    <table border="1" cellpadding="5">--%>
<%--      <caption>--%>
<%--        <h2>Add New User</h2>--%>
<%--      </caption>--%>
<%--      <tr>--%>
<%--        <th>User Name:</th>--%>
<%--        <td>--%>
<%--          <label for="name"></label><input type="text" name="name" id="name" size="45"/>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th>User Email:</th>--%>
<%--        <td>--%>
<%--          <label for="email"></label><input type="text" name="email" id="email" size="45"/>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th>Country:</th>--%>
<%--        <td>--%>
<%--          <label for="country"></label><input type="text" name="idCountry" id="country" size="15"/>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <td colspan="2" align="center">--%>
<%--          <input type="submit" value="Save"/>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--    </table>--%>
<%--  </form>--%>
<%--</div>--%>
</body>
</html>