<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/12/20
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/particles/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
</head>
<body>
<!-- particles.js container -->
<div id="particles-js"></div>

<div id="wrapper">
    <nav class="switch_nav">
        <a href="User_Face_Register.jsp" id="switch_signup" class="switch_btn">人脸注册</a>
        <a href="User_Register.jsp" id="switch_login" class="switch_btn on">账号注册</a>
        <div class="switch_bottom" id="switch_bottom"></div>
    </nav>
    <div id="register">
        <form method="post" action="UserRegister">
            <ul class="group_input">
                <li>
                    <input type="text" class="mobile required" name="username" id="username" placeholder="请输入您的用户名" />
                </li>
                <li>
                    <input type="password" class="psd required" name="password" id="password" placeholder="请输入您的密码" />
                </li>
                <li>
                    <input type="password" class="psd required" name="repassword" id="repassword" placeholder="请确认您的密码" />
                </li>
                <li>
                    <input type="text" class="psd required" name="name" id="name" placeholder="请输入您的姓名" />
                </li>
                <li>
                    <input name="document_number" id="document_number" type="text" placeholder="请输入证件号">
                </li>
                <li>
                    <input type="text" class="psd required" name="phone" id="phone" placeholder="请输入您的联系方式" />
                </li>
            </ul>
            <button  type="submit" class="submit_btn" id="btnSubmit">注册</button>
            <button  type="reset" class="submit_btn" id="btnRet">重置</button>
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
    update = function() {
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
