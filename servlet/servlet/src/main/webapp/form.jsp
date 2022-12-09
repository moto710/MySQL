<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/9/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Form</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/hello-form" method="get">
        <div>First Name: <label>
            <input type="text" name="fname">
        </label></div>
        <div>Last Name: <label>
            <input type="text" name="lname">
        </label></div>
        <div><input type="submit" value="Submit"></div>
    </form>
</body>
</html>
