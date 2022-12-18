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

        .list {
            list-style: none;
            display: inline;
        }
        .hidden{
            opacity: 0;
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
        <div class="col-4 d-flex">
            <h2>All Users</h2>
        </div>
        <div class="d-flex justify-content-end col-5">
            <button type="button" class="btn col-5"><a href="${pageContext.request.contextPath}/home?action=signUp"><i
                    class="fa fa-plus"></i>Add User</a></button>
            <div class="search-container">
                <form class="d-inline-block">
                    <input type="text" placeholder="Search..." name="keyword">
                </form>
            </div>
        </div>

    </div>
    <form>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>
                    <ul class="list">
                        <li>ID</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=idAsc"><i
                                        class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=idDesc"><i
                                        class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>User Name</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=userNameAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=userNameDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Password</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=passWordAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=passWordDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Full Name</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=fullNameAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=fullNameDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Phone Number</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=phoneAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=phoneDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Email</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=emailAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=emailDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Address</li>
                        <li>
                            <ul class="list">
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=addressAsc"><i class="fa fa-chevron-up"></i></a></li>
                                <li><a href="${pageContext.request.contextPath}/home?action=manager&sort=addressDesc"><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>

                </th>
                <th>
                    <ul class="list">
                        <li>Action</li>
                        <li class="hidden">
                            <ul class="list">
                                <li><a><i class="fa fa-chevron-up"></i></a></li>
                                <li><a><i class="fa fa-chevron-down"></i></a></li>
                            </ul>
                        </li>
                    </ul>
                </th>
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
        <div class="d-flex justify-content-between">
            <ul class="pagination">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.currentPage - 1}">previous</a>
                </li>
                <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                    <li class="page-item">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/home?action=manager&page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.currentPage + 1}">Next</a>
                </li>

            </ul>
            <ul class="pagination justify-content-end">
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=5">5</a></li>
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=10">10</a></li>
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=15">15</a></li>
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=50">50</a></li>
            </ul>
        </div>
    </form>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>


</body>
</html>