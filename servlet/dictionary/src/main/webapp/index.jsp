<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dictionary</title>
</head>
<body>
    <form action="" method="post">
        <div>
            Keyword: <input type="text" name="input">
        </div>
        <div>
            Result: ${r}
        </div>
        <div>
            <button type="submit">Search</button>
        </div>
    </form>
</body>
</html>