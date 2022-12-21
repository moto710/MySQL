<%@ page import="com.coffeeshop.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
</head>
<body>

<div class="container">
  <h2>Add New Country</h2>
  <form class="was-validated" method="post" action="${pageContext.request.contextPath}/country">
    <div class="form-group">
      <label for="name">Country Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter Country Name" name="name" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> Are you human?
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this captcha to confirm!</div>
      </label>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>

</body>
</html>