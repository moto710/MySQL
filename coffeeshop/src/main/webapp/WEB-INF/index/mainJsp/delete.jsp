<%@ page import="com.coffeeshop.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
    <style>
        .btn {
            border-radius: 10px;
        }
    </style>
</head>
<body>
<!-- Navbar Start -->
<jsp:include page="/WEB-INF/index/layout/nav.jsp"></jsp:include>
<!-- Navbar End -->

<!-- Carousel Start -->
<jsp:include page="/WEB-INF/index/layout/carousel.jsp"></jsp:include>
<!-- Carousel End -->

<div class="container">
    <form method="post">
        <div class="d-flex justify-content-between">
            <h2 class="col-4">Delete User</h2>
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>User Name</th>
                <th>Password</th>
                <th>Full Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${requestScope.user.getId()}</td>
                <td>${requestScope.user.getUserName()}</td>
                <td>${requestScope.user.getPassWord()}</td>
                <td>${requestScope.user.getFullName()}</td>
                <td>${requestScope.user.getPhone()}</td>
                <td>${requestScope.user.getEmail()}</td>
                <td>${requestScope.user.getAddress()}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/home?action=edit&id=${requestScope.user.getId()}"><i
                            class="fa fa-edit"></i></a>
                    <a href="${pageContext.request.contextPath}/home?action=remove&id=${requestScope.user.getId()}"><i
                            class="fa fa-trash"></i></a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>
</body>
</html>