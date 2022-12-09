<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/9/2022
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display discount</title>
</head>
<body>
  <div>
    <p>Product name: ${requestScope.name}</p>
    <p>Discount amount: ${requestScope.discount}</p>
    <p>New price: ${requestScope.newPrice}</p>
  </div>
</body>
</html>
