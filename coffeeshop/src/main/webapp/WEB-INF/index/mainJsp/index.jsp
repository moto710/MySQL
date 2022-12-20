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

<!-- About Start -->
<jsp:include page="/WEB-INF/index/layout/about.jsp"></jsp:include>
<!-- About End -->

<c:if test="${requestScope.messageLogin ne null}">
    <h1>${requestScope.messageLogin}</h1>
    <script>
        let message = '<c:out value="${requestScope.messageLogin}" />';
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

<!-- Service Start -->
<jsp:include page="/WEB-INF/index/layout/service.jsp"></jsp:include>
<!-- Service End -->

<!-- Offer Start -->
<jsp:include page="/WEB-INF/index/layout/offer.jsp"></jsp:include>
<!-- Offer End -->

<!-- Menu Start -->
<jsp:include page="/WEB-INF/index/layout/menu.jsp"></jsp:include>
<!-- Menu End -->

<!-- Reservation Start -->
<jsp:include page="/WEB-INF/index/layout/reservation.jsp"></jsp:include>
<!-- Reservation End -->

<!-- Testimonial Start -->
<jsp:include page="/WEB-INF/index/layout/testimonial.jsp"></jsp:include>
<!-- Testimonial End -->

<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>
</body>
</html>
