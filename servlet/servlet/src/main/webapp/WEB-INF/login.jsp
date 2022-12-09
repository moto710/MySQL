<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/8/2022
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
  <style type="text/css">
    .login {
      height:180px; width:230px;
      margin:0;
      padding:10px;
      border:1px #CCC solid;
    }
    .login input {
      padding:5px; margin:5px
    }
  </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/login" method="post">
  <div class="login">
    <h2>Login</h2>
    <label>
      <input type="text" name="username" size="30" placeholder="username"/>
    </label>
    <label>
      <input type="password" name="password" size="30" placeholder="password"/>
    </label>
    <input type="submit" value="Sign in"/>
  </div>
</form>
</body>
</html>
