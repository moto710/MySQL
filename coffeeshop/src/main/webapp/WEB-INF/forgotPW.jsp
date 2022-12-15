<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Forgot Password Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

  <link href="${pageContext.request.contextPath}/css/signUp.css" rel="stylesheet" type="text/css" media="all" />

  <link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<c:if test="${requestScope.pw.isEmpty() == false}">
  <script>
    swal({
      title: "Here's your password:",
      text: "${requestScope.pw}",
      icon: "success",
      button: "OK!",
    });
  </script>
</c:if>
<div class="main-w3layouts wrapper">
  <h1>Fill your information to restore password</h1>
  <div class="main-agileinfo">
    <div class="agileits-top">
      <form action="#" method="post">
        <input class="text" type="text" name="userName" placeholder="Username" required>
        <input class="text email" type="email" name="email" placeholder="Email" required>
        <input class="text" type="text" name="phone" placeholder="Phone Number" required>
        <div class="wthree-text">
          <label class="anim">
            <input type="checkbox" class="checkbox" required="">
            <span>Please check this captcha</span>
          </label>
          <div class="clear"> </div>
        </div>
        <input type="submit" value="GET PASSWORD">
      </form>
      <p>Already have an Account? <a href="${pageContext.request.contextPath}/login?action=login"> Login Now!</a></p>
    </div>
  </div>
  <div class="colorlibcopy-agile">
    <p>© 2018 Colorlib Signup Form. All rights reserved | Design by <a href="https://colorlib.com/" target="_blank">Colorlib</a></p>
  </div>
  <ul class="colorlib-bubbles">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
  </ul>
</div>
</body>
</html>
