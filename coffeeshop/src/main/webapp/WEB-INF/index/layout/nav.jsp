<!-- Navbar Start -->
<div class="container-fluid p-0 nav-bar">
    <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
        <a href="${pageContext.request.contextPath}/home?action=home" class="navbar-brand px-lg-4 m-0">
            <h3 class="m-0 display-4 text-uppercase text-white">MT COFFEE SHOP</h3>
        </a>
        <div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
            <form>
                <div class="navbar-nav ml-auto p-4">
                    <a href="${pageContext.request.contextPath}/home?action=about"
                       class="nav-item nav-link active">About</a>
                    <a href="${pageContext.request.contextPath}/home?action=manager" class="nav-item nav-link">User
                        Manager</a>
                    <a href="${pageContext.request.contextPath}/login" class="nav-item nav-link">Login</a>
                </div>
            </form>
        </div>
    </nav>
</div>
<!-- Navbar End -->