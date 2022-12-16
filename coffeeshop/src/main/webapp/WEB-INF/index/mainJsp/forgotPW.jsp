<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MT Coffee Shop</title>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
</head>
<body>
<!-- Navbar Start -->
<jsp:include page="/WEB-INF/index/layout/nav.jsp"></jsp:include>
<!-- Navbar End -->

<!-- Carousel Start -->
<jsp:include page="/WEB-INF/index/layout/carousel.jsp"></jsp:include>
<!-- Carousel End -->

<div class="container">
    <h2>Fill this form to restore your password</h2>
    <form class="was-validated" method="post">
        <c:if test="${requestScope.pw != null}">
            <script>
                let pw = '<%= request.getAttribute("pw")%>';
                Swal.fire({
                    title: 'Your password:',
                    text: pw,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
            </script>
        </c:if>
        <c:if test="${requestScope.pw == null && requestScope.method == 'POST'}">
            <script>
                let message = `Can't find your account, try again!`;
                Swal.fire({
                    title: message,
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })
            </script>
        </c:if>
        <div class="form-group">
            <label for="userName">Username:</label>
            <input type="text" class="form-control" id="userName" placeholder="Enter Username" name="userName" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" required>
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> Please check this captcha
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this captcha to continue.</div>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Get Password</button>
    </form>
</div>

<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>
</body>
</html>
