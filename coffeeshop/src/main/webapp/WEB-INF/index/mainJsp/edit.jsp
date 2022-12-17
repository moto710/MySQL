<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
</head>
<body>
<!-- Navbar Start -->
<jsp:include page="/WEB-INF/index/layout/nav.jsp"></jsp:include>
<!-- Navbar End -->

<!-- Carousel Start -->
<jsp:include page="/WEB-INF/index/layout/carousel.jsp"></jsp:include>
<!-- Carousel End -->

<c:if test="${requestScope.msg ne null}">
    <script>
        let msg = '<%= ((String) request.getAttribute("msg")) %>';
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

<div class="container">
    <h2>Edit your information</h2>
    <form class="was-validated" method="post">
        <div class="form-group" hidden>
            <input type="text" class="form-control" value="${requestScope.user.getId()}" name="id" required>
        </div>
        <div class="form-group">
            <label for="userName">Username:</label>
            <input type="text" class="form-control" id="userName" value="${requestScope.user.getUserName()}" name="userName" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" value="${requestScope.user.getEmail()}" name="email" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="passWord">Password:</label>
            <input type="password" class="form-control" id="passWord" value="${requestScope.user.getPassWord()}" name="passWord" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="rePassWord">Re-Enter Password:</label>
            <input type="password" class="form-control" id="rePassWord" value="${requestScope.user.getPassWord()}" name="rePassWord" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" class="form-control" id="fullName" value="${requestScope.user.getFullName()}" name="fullName" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phone" value="${requestScope.user.getPhone()}" name="phone" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div><div class="form-group">
        <label for="address">Address:</label>
        <input type="text" class="form-control" id="address" value="${requestScope.user.getAddress()}" name="address" required>
        <div class="valid-feedback">Valid.</div>
        <div class="invalid-feedback">Please fill out this field.</div>
    </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> Are you sure to edit your information?
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
</body>
</html>