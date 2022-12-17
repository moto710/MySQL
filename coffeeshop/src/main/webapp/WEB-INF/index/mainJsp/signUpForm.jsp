<%@ page import="com.coffeeshop.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
</head>
<body>
<!-- Navbar Start -->
<jsp:include page="/WEB-INF/index/layout/nav.jsp"></jsp:include>
<!-- Navbar End -->

<!-- Carousel Start -->
<jsp:include page="/WEB-INF/index/layout/carousel.jsp"></jsp:include>
<!-- Carousel End -->


<c:if test="${requestScope.user != null}">
  <script>
    let name = '<%= ((User) request.getAttribute("user")).getFullName() %>';
    Swal.fire({
      title: 'Welcome ' + name,
      text: 'to coffee world',
      showClass: {
        popup: 'animate__animated animate__fadeInDown'
      },
      hideClass: {
        popup: 'animate__animated animate__fadeOutUp'
      }
    })
  </script>
</c:if>
<div class="container">
  <h2>Sign Up</h2>
  <form class="was-validated" method="post">
    <div class="form-group">
      <label for="userName">Username:</label>
      <input type="text" class="form-control" id="userName" placeholder="Enter Username" name="userName" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="passWord">Password:</label>
      <input type="password" class="form-control" id="passWord" placeholder="Enter Password" name="passWord" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="rePassWord">Re-Enter Password:</label>
      <input type="password" class="form-control" id="rePassWord" placeholder="Re-Enter Password" name="rePassWord" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="fullName">Full Name:</label>
      <input type="text" class="form-control" id="fullName" placeholder="Enter Your Full Name" name="fullName" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="phone">Phone Number:</label>
      <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" required>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div><div class="form-group">
    <label for="address">Address:</label>
    <input type="text" class="form-control" id="address" placeholder="Choose Address" name="address" required>
    <div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
  </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> Are you human?
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Check this captcha to continue.</div>
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