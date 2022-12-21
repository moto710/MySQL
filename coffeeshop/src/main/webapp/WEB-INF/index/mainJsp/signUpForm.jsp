<%@ page import="com.coffeeshop.model.User" %>
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

<c:if test="${sessionScope.message ne null}">
    <script>
        let msg = '<%= session.getAttribute("message") %>';
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



<c:if test="${requestScope.user ne null}">
    <script>
        let name = '<%= ((User) request.getAttribute("user")).getFullName() %>';
        Swal.fire({
            title: 'Welcome ' + name,
            text: 'to coffee world',
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
    <h2>Sign Up</h2>
    <form class="was-validated" method="post">
        <div class="form-group">
            <label for="userName">Username:</label>
            <input type="text" class="form-control" id="userName" placeholder="Enter Username" name="userName" required
                   value="${requestScope.user.getUserName()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" class="form-control" id="email" placeholder="Enter Email" name="email" required
                   value="${requestScope.user.getEmail()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="passWord">Password:</label>
            <input type="password" class="form-control" id="passWord" placeholder="Enter Password" name="passWord"
                   required value="${requestScope.user.getPassWord()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="rePassWord">Re-Enter Password:</label>
            <input type="password" class="form-control" id="rePassWord" placeholder="Re-Enter Password"
                   name="rePassWord" required value="${requestScope.user.getPassWord()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" class="form-control" id="fullName" placeholder="Enter Your Full Name" name="fullName"
                   required value="${requestScope.user.getFullName()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" required
                   value="${requestScope.user.getPhone()}">
            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div>
            <label for="idCountry">Select Your Country:</label>
            <select id="idCountry" name="idCountry" onchange="handleCountryCreate()">
                <c:forEach items="${requestScope.countryList}" var="country">
                    <option value="${country.getId()}">${country.getName()}</option>
                </c:forEach>
                <option value="-1">Don't have your country??? Add now!</option>
            </select>

            <div class="valid-feedback">Valid.</div>
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>

        <div class="form-group">
            <label for="image">Your Image:</label>
            <input type="text" class="form-control" id="image" placeholder="Your Image Link (Optional)" name="image"
                   value="${requestScope.user.getImage()}">
        </div>
        <div class="form-group">
            <label for="bio">Your Short Bio (Optional):</label>
            <textarea class="form-control" id="bio" name="bio" value="${requestScope.user.getBio()}"
                      rows="3"></textarea>
        </div>
        <div class="form-group form-check">
            <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember" required> Are you human?
                <div class="valid-feedback">Valid.</div>
                <div class="invalid-feedback">Check this captcha to continue.</div>
            </label>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
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