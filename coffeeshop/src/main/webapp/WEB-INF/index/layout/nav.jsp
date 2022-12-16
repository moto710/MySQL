<!-- Navbar Start -->
<div class="container-fluid p-0 nav-bar">
    <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
        <a href="${pageContext.request.contextPath}/home?action=home" class="navbar-brand px-lg-4 m-0">
            <h1 class="m-0 display-4 text-uppercase text-white">MT COFFEE SHOP</h1>
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav ml-auto p-4">
                <a href="${pageContext.request.contextPath}/home?action=home" class="nav-item nav-link">Home</a>
                <a href="${pageContext.request.contextPath}/home?action=about"
                   class="nav-item nav-link active">About</a>
                <a href="${pageContext.request.contextPath}/home?action=service" class="nav-item nav-link">Service</a>
                <a href="${pageContext.request.contextPath}/home?action=menu" class="nav-item nav-link">Menu</a>
                <div class="nav-item dropdown">
                    <a href="${pageContext.request.contextPath}/home?action=page" class="nav-link dropdown-toggle"
                       data-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu text-capitalize">
                        <a href="${pageContext.request.contextPath}/home?action=reservation" class="dropdown-item">Reservation</a>
                        <a href="${pageContext.request.contextPath}/home?action=testimonial" class="dropdown-item">Testimonial</a>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/home?action=contact" class="nav-item nav-link">Contact</a>
                <a href="${pageContext.request.contextPath}/home?action=login" class="nav-item nav-link"
                   onclick="document.getElementById('id01').style.display='block'; event.preventDefault();">Login</a>
            </div>
            <div id="id01" class="modal">

                <form class="modal-content animate" method="post">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id01').style.display='none'" class="close"
                              title="Close Modal">&times;</span>
                        <img src="${pageContext.request.contextPath}/coffee/img/img_avatar2.png" alt="Avatar"
                             class="avatar">
                    </div>

                    <div class="container">
                        <label for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="uname" id="uname" required>

                        <label for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

                        <button type="submit">Login</button>
                        <label>
                            <input type="checkbox" checked="checked" name="remember"> Remember me
                        </label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <div>
                            <button type="button" onclick="document.getElementById('id01').style.display='none'"
                                     class="cancelbtn">Cancel
                        </button>
                        </div>
                        <div style="white-space: pre;">
                            <span class="psw open-button"> Or <a href="${pageContext.request.contextPath}/home?action=signUp">create new account</a></span><span class="psw">Forgot <a href="${pageContext.request.contextPath}/home?action=forgotPW">password?</a></span>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->