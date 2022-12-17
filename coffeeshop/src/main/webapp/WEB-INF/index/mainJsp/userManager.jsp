<%@ page import="com.coffeeshop.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            padding: 12px 16px;
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
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
    <div class="d-flex justify-content-between">
        <h2 class="col-4">All Users</h2>
        <button type="button" class="btn col-2"><a href="${pageContext.request.contextPath}/home?action=signUp"><i
                class="fa fa-plus"></i> Add User</a></button>
    </div>
    <form>
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
            <c:forEach items="${requestScope.userList}" var="user">
                <tr>
                    <td>${user.getId()}</td>
                    <td>${user.getUserName()}</td>
                    <td>${user.getPassWord()}</td>
                    <td>${user.getFullName()}</td>
                    <td>${user.getPhone()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getAddress()}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/home?action=edit&id=${user.getId()}"><i
                                class="fa fa-edit"></i></a>
                        <a href="${pageContext.request.contextPath}/home?action=remove&id=${user.getId()}"><i
                                class="fa fa-trash"></i></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <ul class="pagination">
            <c:if test="${requestScope.currentPage ne 1}">
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.currentPage - 1}">Previous</a></li>
            </c:if>
<c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
    <c:choose>
        <c:when test="${requestScope.currentPage eq i}">
            <li class="page-item"><a class="page-link" href="#">${i}</a></li>
        </c:when>
        <c:otherwise>
            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&page=${i}">${i}</a></li>
        </c:otherwise>
    </c:choose>
</c:forEach>
            <c:if test="${requestScope.currentPage lt requestScope.noOfPages}">
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </c:if>


            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.currentPage + i}">3</a></li>

        </ul>
    </form>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>


</body>
</html>