<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/20
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>用户登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/particles/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>

<div id="wrapper">
    <nav class="switch_nav">
        <a href="User_Face_Login.jsp" id="switch_signup" class="switch_btn">人脸登录</a>
        <a href="User_Login.jsp" id="switch_login" class="switch_btn on">账号登录</a>
        <div class="switch_bottom" id="switch_bottom"></div>
    </nav>
    <div id="login">
        <form method="post" action="UserLogin">
            <ul class="group_input">
                <li>
                    <input type="text" class="mobile required" name="username" id="username" placeholder="用户名"/>
                </li>
                <li>
                    <input type="password" class="psd required" name="password" id="password" placeholder="密码"/>
                </li>
            </ul>
            <div class="states">
                <span class="right"><a href="javascript:;"><a href="Admin_login.jsp">切换至管理员登录</a></a></span>
            </div>
            <button type="submit" class="submit_btn" id="btnSubmit">登录</button>
        </form>

    </div>
    <div class="footer">
        <a href="#">HotelBook System</a>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/libs/jquery-1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/sweetalert2/sweetalert2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/particles.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/libs/particles/js/app.js"></script>
<script>
    var count_particles, stats, update;
    stats = new Stats;
    stats.setMode(0);
    stats.domElement.style.position = 'absolute';
    stats.domElement.style.left = '0px';
    stats.domElement.style.top = '0px';
    document.body.appendChild(stats.domElement);
    count_particles = document.querySelector('.js-count-particles');
    update = function () {
        stats.begin();
        stats.end();
        if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
            count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
        }
        requestAnimationFrame(update);
    };
    requestAnimationFrame(update);
</script>
</body>
</html>
