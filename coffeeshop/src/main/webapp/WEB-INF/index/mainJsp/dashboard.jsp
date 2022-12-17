<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MT Coffee Shop</title>
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
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
        <h2 class="col-4">Your Order</h2>
        <button type="button" class="btn col-2">Add product <i class="fa fa-plus"></i></button>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>John</td>
            <td>
                <div class="dropdown">
                    <span>Choose your product</span>
                    <div class="dropdown-content">
                        <p>Hello World!</p>
                        <p>Hello World!</p>
                        <p>Hello World!</p>
                    </div>
                </div>
            </td>
            <td>john@example.com</td>
            <td>John</td>
            <td>Doe</td>
            <td>john@example.com</td>
        </tr>
        </tbody>
    </table>
</div>


<!-- Footer Start -->
<jsp:include page="/WEB-INF/index/layout/footer.jsp"></jsp:include>
<!-- Footer End -->

<!-- Back to Top -->
<jsp:include page="/WEB-INF/index/layout/backToTop.jsp"></jsp:include>
</body>
</html>