<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency converter</title>
</head>
<body>
<form action="/convert" method="post">
    <div>
        <div>
            <p>Rate: <label>
                <input type="number" name ="rate">
            </label></p>
            <p>USD: <label>
                <input type="number" name="usd">
            </label></p>
            <p>VND: <label>
                <input type="number" name=""vnd>
            </label></p>
        </div>
        <div>
            <button type="submit">Result</button>
        </div>
    </div>
</form>
</body>
</html>