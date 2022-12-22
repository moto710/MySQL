<%@ page import="com.coffeeshop.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
    <style>

        .table thead th {
            border: none;
            text-align: center;
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


<c:if test="${requestScope.message ne null}">
    <script>
        let msg = '<c:out value="${requestScope.message}"/>';
        Swal.fire({
            title: msg,
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })
    </script>
</c:if>

<div class="container-fluid">
    <div class="d-flex justify-content-between">
        <div class="col-4 d-flex">
            <h2>All Users</h2>
        </div>
        <div class="d-flex justify-content-end col-5">
            <button type="button" class="btn col-5"><a href="${pageContext.request.contextPath}/home?action=signUp"><i
                    class="fa fa-plus"></i>Add User</a></button>
            <div class="search-container">
                <form method="get" action="${pageContext.request.contextPath}/home">
                    <input type="hidden" name="action" value="manager">
                    <input type="text" placeholder="Search..." name="keyword" value="${requestScope.keyword}">
                    <button type="submit">Search</button>
                </form>
            </div>
        </div>

    </div>
    <form>
        <table class="table table-striped" style="border-top: 1px solid rgb(186,192,195)">
            <thead>
            <tr>
                <th rowspan="2">ID</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=idAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2">User Name</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=userNameAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2" colspan="2">Image</th>
                <th rowspan="2">Full Name</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=fullNameAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2">Phone Number</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=phoneAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2">Email</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=emailAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2">Country</th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=addressAsc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-up"></i></a></th>
                <th rowspan="2" colspan="2">Bio</th>
                <th rowspan="2">Action</th>
            </tr>

            <tr>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=idDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a></th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=userNameDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a>
                </th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=fullNameDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a>
                </th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=phoneDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a>
                </th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=emailDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a>
                </th>
                <th>
                    <a href="${pageContext.request.contextPath}/home?action=manager&sort=addressDesc&keyword=${requestScope.keyword}&recordsPerPage=${requestScope.recordsPerPage}&page=${requestScope.page}"><i
                            class="fa fa-chevron-down"></i></a>
                </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.userList}" var="user">
                <tr>
                    <td colspan="2">${user.getId()}</td>
                    <td colspan="2">${user.getUserName()}</td>
                    <td colspan="2"><img src="${user.getImage()}" class="img-thumbnail zoom" width="150px"
                                         alt="No Image"></td>
                    <td colspan="2">${user.getFullName()}</td>
                    <td colspan="2">${user.getPhone()}</td>
                    <td colspan="2">${user.getEmail()}</td>
                    <c:forEach items="${requestScope.countryList}" var="country">
                        <c:if test="${country.getId() eq user.getIdCountry()}">
                            <td colspan="2">${country.getName()}</td>
                        </c:if>
                    </c:forEach>
                    <td colspan="2">${user.getBio()}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/home?action=edit&id=${user.getId()}"><i
                                class="fa fa-edit"></i></a>
                        <a href="${pageContext.request.contextPath}/home?action=remove&id=${user.getId()}"
                           class="confirmDelete"><i
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
                       href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.page - 1}&recordsPerPage=${requestScope.recordsPerPage}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">previous</a>
                </li>
                <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                    <li class="page-item">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/home?action=manager&page=${i}&recordsPerPage=${requestScope.recordsPerPage}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">${i}</a>
                    </li>
                </c:forEach>
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/home?action=manager&page=${requestScope.page + 1}&recordsPerPage=${requestScope.recordsPerPage}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">Next</a>
                </li>

            </ul>

            <ul class="pagination justify-content-end">
                <li class="page-item page-link">Show number of records:</li>
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=5&page=${requestScope.page}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">5</a>
                </li>
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=10&page=${requestScope.page}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">10</a>
                </li>
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=15&page=${requestScope.page}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">15</a>
                </li>
                <li class="page-item"><a class="page-link"
                                         href="${pageContext.request.contextPath}/home?action=manager&recordsPerPage=50&page=${requestScope.page}&keyword=${requestScope.keyword}&sort=${requestScope.sort}">50</a>
                </li>
            </ul>
        </div>
    </form>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>

<script type="text/javascript">
    var elems = document.getElementsByClassName('confirmDelete');
    var confirmIt = function (e) {
        if (!confirm('Are you sure?')) e.preventDefault();
    };
    for (var i = 0, l = elems.length; i < l; i++) {
        elems[i].addEventListener('click', confirmIt, false);
    }

</script>

</body>
</html>