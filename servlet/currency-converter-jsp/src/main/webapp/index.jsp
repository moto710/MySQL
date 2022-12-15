<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <h2>Currency Converter</h2>
    <form action="converter.jsp" method="post">
        <label>Rate: </label><br/>
        <label>
            <input type="text" name="rate" placeholder="RATE"/>
        </label><br/>
        <label>USD: </label><br/>
        <label>
            <input type="text" name="usd" placeholder="USD" value="0"/>
        </label><br/>
        <input type="submit" id="submit" value="Converter"/>
    </form>
    <p>
        <%!
            String a = "100";
        %>
        <%
            List<String> list = new ArrayList<>();
        %>
        <%
            out.println("Value a = " + a);
        %>
        <% out.print("Today is:"+java.util.Calendar.getInstance().getTime());%>
    </p>
    <%
        String num1 = request.getParameter("n1");
        String num2 = request.getParameter("n2");

        int a = Integer.parseInt(num1);
        int b = Integer.parseInt(num2);
        int c = a / b;
        out.print(a + " chia " + b + " = " + c);
        %>
</body>
</html>