<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Discount</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/discount" method="get">
    <div>
        <p>Product name: <label>
            <input type="text" name="name">
        </label></p>
        <p>Product price: <label>
            <input type="number" name="price">
        </label></p>
        <p>Discount rate (%): <label>
            <input type="number" name="rate">
        </label></p>
        <button type="submit"><a href="${pageContext.request.contextPath}/WEB-INF/display-discount.jsp">
            Calculate discount</a></button>
    </div>
</form>
</body>
</html>