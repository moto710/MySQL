<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
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