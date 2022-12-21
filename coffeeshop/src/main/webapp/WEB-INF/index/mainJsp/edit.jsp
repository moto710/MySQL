<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
    <style>


        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #3e8e41;
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
        let msg = '<%= ((String) request.getAttribute("message")) %>';
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

<c:if test="${requestScope.errors ne null}">
    <div class="alert alert-danger container" role="alert">
        <ul>
            <c:forEach items="${requestScope.errors}" var="error">
                <li>${error}</li>
            </c:forEach>
        </ul>
    </div>
</c:if>
<%--<c:if test="${requestScope.errors ne null}">--%>
<%--    <div class="alert alert-danger" role="alert">--%>
<%--        <ul>--%>
<%--            <c:forEach items="${requestScope.errors}" var="error">--%>
<%--                <li>${error}</li>--%>
<%--            </c:forEach>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</c:if>--%>

<div class="container">
    <h2>Edit your information</h2>
    <form class="was-validated" method="post">
        <div class="form-group" hidden>
            <input type="text" class="form-control" value="${requestScope.user.getId()}" name="id">
        </div>
        <div class="form-group">
            <label for="userName">Username:</label>
            <input type="text" class="form-control" id="userName" value="${requestScope.user.getUserName()}${requestScope.userName}"
                   name="userName" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" value="${requestScope.user.getEmail()}${requestScope.email}" name="email"
                   required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="passWord">Password:</label>
            <input type="password" class="form-control" id="passWord" value="${requestScope.user.getPassWord()}${requestScope.passWord}"
                   name="passWord" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="rePassWord">Re-Enter Password:</label>
            <input type="password" class="form-control" id="rePassWord" value="${requestScope.user.getPassWord()}${requestScope.rePassWord}"
                   name="rePassWord" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" class="form-control" id="fullName" value="${requestScope.user.getFullName()}${requestScope.fullName}"
                   name="fullName" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phone" value="${requestScope.user.getPhone()}${requestScope.phone}" name="phone"
                   required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>


        <div>
            <label for="idCountry">Select Your Country:</label>
            <select id="idCountry" name="idCountry" onchange="handleCountryCreate()">
                <c:forEach items="${requestScope.countryList}" var="country">
                    <option value="${country.getId()}"<c:if
                            test="${country.getId() eq requestScope.user.getIdCountry() || requestScope.idCountry eq country.getId()}">
                        selected
                    </c:if>
                    >${country.getName()}</option>
                </c:forEach>
                <option value="-1">Don't have your country??? Add now!</option>
            </select>

            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="image">Your Image:</label>
            <input type="text" class="form-control" id="image" placeholder="Your Image Link (Optional)"
                   name="image"
                   value="${requestScope.user.getImage()}${requestScope.image}">
        </div>
        <div class="form-group">
            <label for="bio">Your Short Bio (Optional):</label>
            <textarea class="form-control" id="bio" name="bio" value="${requestScope.user.getBio()}${requestScope.bio}"
                      rows="3"></textarea>
        </div>

        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> Are you sure to edit your
                information?
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this captcha to confirm!</div>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">OK</button>
    </form>
</div>

<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>

<script>
    function handleCountryCreate() {
        if (document.getElementById("idCountry").value == -1) {
            window.open("/country?addCountry=add", "_blank");
        }
    }
</script>
</body>
</html>