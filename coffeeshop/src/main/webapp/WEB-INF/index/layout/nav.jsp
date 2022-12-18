<!-- Navbar Start -->
<div class="container-fluid p-0 nav-bar">
    <nav class="navbar navbar-expand-lg bg-none navbar-dark py-3">
        <a href="${pageContext.request.contextPath}/home?action=home" class="navbar-brand px-lg-4 m-0">
            <h1 class="m-0 display-4 text-uppercase text-white">MT COFFEE SHOP</h1>
        </a>
        <%--        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">--%>
        <%--            <span class="navbar-toggler-icon"></span>--%>
        <%--        </button>--%>
        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <form>
                <div class="navbar-nav ml-auto p-4">
                    <a href="${pageContext.request.contextPath}/home?action=about"
                       class="nav-item nav-link active">About</a>
                    <a href="${pageContext.request.contextPath}/home?action=manager" class="nav-item nav-link">User
                        Manager</a>
                    <a href="${pageContext.request.contextPath}/home?action=login" class="nav-item nav-link"
                       onclick="document.getElementById('id01').style.display='block'; event.preventDefault();">Login</a>
                </div>
            </form>

            <div id="id01" class="modal">

                <form class="modal-content animate" method="post">
                    <div class="imgcontainer">
                        <span onclick="document.getElementById('id01').style.display='none'" class="close"
                              title="Close Modal">&times;</span>
                        <img src="${pageContext.request.contextPath}/coffee/img/img_avatar2.png" alt="Avatar"
                             class="avatar">
                    </div>

                    <div class="container">
                        <label for="userName"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="userName" id="userName" required>

                        <label for="passWord"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="passWord" id="passWord" required>

                        <button type="submit">Login</button>
                        <label><input type="checkbox" checked="checked" name="remember">Remember me</label>
                    </div>

                    <div class="container" style="background-color:#f1f1f1">
                        <div>
                            <button type="button" onclick="document.getElementById('id01').style.display='none'"
                                    class="cancelbtn">Cancel
                            </button>
                        </div>
                        <div style="white-space: pre;">
                            <span class="psw open-button"> Or <a
                                    href="${pageContext.request.contextPath}/home?action=signUp">create new account</a></span><span
                                class="psw">Forgot <a href="${pageContext.request.contextPath}/home?action=forgotPW">password?</a></span>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar End -->