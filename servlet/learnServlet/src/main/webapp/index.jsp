<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="CheckBox" method="POST">
    <label>
        <input type="checkbox" name="toan" checked="checked" />
    </label> Toan
    <label>
        <input type="checkbox" name="ly" />
    </label> Vat Ly
    <label>
        <input type="checkbox" name="hoa" />
    </label> Hoa Hoc
    <input type="submit" value="Chon Mon Hoc" />
    </form>

<%--<form action="HelloForm" method="GET">--%>
<%--    First Name: <label>--%>
<%--    <input type="text" name="first_name">--%>
<%--</label> <br />--%>
<%--    Last Name: <label>--%>
<%--    <input type="text" name="last_name" />--%>
<%--</label>--%>
<%--    <input type="submit" value="Submit" />--%>
<%--    </form>--%>
</body>
</html>