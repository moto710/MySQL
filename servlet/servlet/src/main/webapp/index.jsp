<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
<%--    <style type="text/css">--%>
<%--        .login {--%>
<%--            height:180px; width:230px;--%>
<%--            margin:0;--%>
<%--            padding:10px;--%>
<%--            border:1px #CCC solid;--%>
<%--        }--%>
<%--        .login input {--%>
<%--            padding:5px; margin:5px--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<%--<form action="${pageContext.request.contextPath}/login" method="post">--%>
<%--    <div class="login">--%>
<%--        <h2>Login</h2>--%>
<%--        <label>--%>
<%--            <input type="text" name="username" size="30" placeholder="username"/>--%>
<%--        </label>--%>
<%--        <label>--%>
<%--            <input type="password" name="password" size="30" placeholder="password"/>--%>
<%--        </label>--%>
<%--        <input type="submit" value="Sign in"/>--%>
<%--    </div>--%>
<%--</form>--%>

<h1><%= "Hello World!" %>
</h1>

<br/>
<a href="hello-servlet">Hello Servlet</a>
<p id="b"></p>
</body>
<script>
    let a = 1000;
    document.getElementById("b").innerHTML = a;
</script>
</html>