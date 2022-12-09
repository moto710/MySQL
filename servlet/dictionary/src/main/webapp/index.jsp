<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/dictionary" method="post">
        <div>
            Keyword: <label>
            <input type="text" name="input">
        </label>
        </div>
        <div>
            Result: ${requestScope.kq}
        </div>
        <div>
            <button type="submit">Search</button>
        </div>
        <p>Method: ${requestScope.method}</p>
    </form>
</body>
</html>