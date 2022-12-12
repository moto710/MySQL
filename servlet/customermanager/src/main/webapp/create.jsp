<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<c:if test="${not empty result}">
  <h5><c:out value="${result}"></c:out></h5>
  </c:if>
<div class="container">
  <h1>Create customer</h1>
  <form method="post">
    <c:if test="${requestScope.msg != null}">
      <div class="alert alert-success">
        <h3>${requestScope.msg}</h3>
      </div>
    </c:if>
    <label for="idName">Name: </label>
    <input type="text" id="idName" name="name" class="form-control">

    <label for="idAddress">Address: </label>
    <input type="text" id="idAddress" name="address" class="form-control">

    <label for="idCountry">Country: </label>
    <input type="text" id="idCountry" name="country" class="form-control">

    <button type="submit" class="mt-3">Create</button>
    <p>${requestScope.method}</p>
  </form>

</div>
</body>
</html>