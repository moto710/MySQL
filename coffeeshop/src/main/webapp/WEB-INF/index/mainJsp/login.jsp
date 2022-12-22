<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <jsp:include page="/WEB-INF/index/layout/head.jsp"></jsp:include>
    <style>
        .col-6{
            margin: auto;
        }
    </style>
</head>
<body>

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

<div class="container">
    <form class="modal-content animate" method="post">
        <div  class="col-6">
            <div class="imgcontainer">
                <a href="${pageContext.request.contextPath}/home"><i class="fa fa-times close"></i></a>
                <img src="${pageContext.request.contextPath}/coffee/img/img_avatar2.png" alt="Avatar"
                     class="avatar">
            </div>
            <form method="post" action="${pageContext.request.contextPath}/home">
                <input hidden name="action" value="login">
                <label for="userName"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="userName" id="userName" required>

                <label for="passWord"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="passWord" id="passWord" required>

                <button type="submit">Login</button>
                <label><input type="checkbox" checked="checked" name="remember">Remember me</label>
            </form>
            <div class="d-flex justify-content-between">
                <div>
                    <a href="${pageContext.request.contextPath}/home">
                        <button type="button" class="cancelbtn">Cancel</button>
                    </a>
                </div>
                <div style="white-space: pre;">
                            <span class="psw open-button"> Or <a
                                    href="${pageContext.request.contextPath}/home?action=signUp">create new account</a></span><span
                        class="psw">Forgot <a
                        href="${pageContext.request.contextPath}/home?action=forgotPW">password?</a></span>
                </div>
            </div>
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
