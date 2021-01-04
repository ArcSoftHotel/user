<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.RoomDAO,model.Room" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hotel</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="assets/css/gijgo.css">
            <link rel="stylesheet" href="assets/css/slicknav.css">
            <link rel="stylesheet" href="assets/css/animate.min.css">
            <link rel="stylesheet" href="assets/css/magnific-popup.css">
            <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="assets/css/themify-icons.css">
            <link rel="stylesheet" href="assets/css/slick.css">
            <link rel="stylesheet" href="assets/css/nice-select.css">
            <link rel="stylesheet" href="assets/css/style.css">
            <link rel="stylesheet" href="assets/css/responsive.css">
   </head>

   <body>
       
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <strong>Hotel</b>
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->

    <header>
        <!-- Header Start -->
       <div class="header-area header-sticky">
            <div class="main-header ">
                <div class="container">
                    <div class="row align-items-center">
                        <!-- logo -->
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo">
                               <a href="index.jsp"><h1 data-animation="fadeInUp" data-delay=".4s">虹软酒店</h1></a>
                            </div>
                        </div>
                    <div class="col-xl-8 col-lg-8">
                            <!-- main-menu -->
                            <div class="main-menu f-right d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">                                                                                                                                     
                                        <li><a href="index.jsp">主页</a></li>
                                        <li><a href="about.jsp">关于</a></li>
                                        <li><a href="services.jsp">服务</a>
                                            <ul class="submenu">
                                                <li><a href="User_ShoppingCart.jsp">饮食</a></li>
                                                <li><a href="sport.jsp">健身房</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="room.jsp">预约</a>                                           
                                        </li>
                                        <li><a href="contact.jsp">联系</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>             
                        <div class="col-xl-2 col-lg-2">
                            <!-- header-btn -->
                       		<div class="header-btn" style="text-align:center;">
                               <a href="#" ><img alt="头像" src="assets/img/blog/author.png"></a> 
                       		</div>
                       		<div class="header-btn">
                                <a href="#" class="btn btn1 d-none d-lg-block ">个人中心</a>
                            </div>		                         
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    <main>

        <!-- slider Area Start-->
        <div class="slider-area">
            <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/servicespage_hero.jpg" >
                <div class="container">
                    <div class="row ">
                        <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                            <div class="hero-caption">
                                <span>健身</span>
                                <h2>我们的健身设施</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
		<%
			String mess = (String)session.getAttribute("message");
			if(mess==null||"".equals(mess)){}
			else{
		%>
		<script type="text/javascript">alert("<%=mess %>");</script>
		<%
			session.setAttribute("message","");
			} 
		%>
         <!-- Booking Room Start-->
        <div class="booking-area">
            <div class="container">
               <div class="row ">
               <div class="col-12">
                <form action="SportServlet" method="post">
                <div class="booking-wrap d-flex justify-content-between align-items-center">
                 
                    <!-- select in date -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span>预约日期:</span>
                        </div>                    
                        <div class="boking-datepicker">
                            <input type="date" name="sportdate" value="2020-12-01" />
                        </div>
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span>预计开始时间:</span>
                        </div>
                       <div class="boking-datepicker">
                          <input type="time" name="sporttimestart" value="12:59" />
                        </div>
                       
                   </div>
                   
                   <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span>预计结束时间:</span>
                        </div>
                       <div class="boking-datepicker">
                          <input type="time" name="sporttimeend" value="12:59" />
                        </div>
                       
                   </div>
                    <!-- Single Select Box -->
                    <div class="single-select-box mb-30">
                        <!-- select out date -->
                        <div class="boking-tittle">
                            <span>收费标准:</span>
                        </div>
                       <div class="boking-datepicker">
                          <span>¥50/小时 <strong style="color:red;">VIP</strong>¥20/小时</span>
                        </div>
                       (不足半小时不计入，大于半小时按一小时计算)
                   </div>
                    <div class="single-select-box pt-45 mb-30">
                        <input type="submit" class="btn select-btn" value="预约">
                   </div>
               		

                </div>
            </form>
               </div>
               </div>
            </div>
        </div>
        <!-- Booking Room End--> 
        
		<!-- Testimonial Start -->
        <div class="testimonial-area testimonial-padding">
            <div class="container">
               <div class="row justify-content-center">
                    <div class="col-xl-9 col-lg-9 col-md-9">
                        <div class="h1-testimonial-active">
                            <!-- Single Testimonial -->
                            <div class="single-testimonial pt-65">
                                <!-- Testimonial tittle -->
                              	<img src="assets/img/service/sport1.jpeg" style="width:850px;height:500px;" alt="">
                            </div>
                            <!-- Single Testimonial -->
                            <div class="single-testimonial  pt-65">
                               <img src="assets/img/service/sport2.jpeg" style="width:850px;height:500px;" alt="">
                            </div>
                            <div class="single-testimonial  pt-65">
                               <img src="assets/img/service/sport3.jpeg" style="width:850px;height:500px;" alt="">
                            </div>
                        </div>
                    </div>
               </div>
            </div>
        </div>
        <!-- Testimonial End -->
        

        <!-- Gallery img Start-->
        <div class="gallery-area fix">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-md-12">
                        <div class="gallery-active owl-carousel">
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery1.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery2.jpg" alt=""></a>
                            </div>
                            <div class="gallery-img">
                                <a href="#"><img src="assets/img/gallery/gallery3.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Gallery img End-->
    </main>
   <footer>
       <!-- Footer Start-->
       <div class="footer-area black-bg footer-padding">
           <div class="container">
               <div class="row d-flex justify-content-between">
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                      <div class="single-footer-caption mb-30">
                         <!-- logo -->
                         <div class="footer-logo">
                           <a href="index.html"><h3 style="color:white">虹软酒店</h3></a>
                         </div>
                         <div class="footer-social footer-social2">
                             <a href="#"><i class="fab fa-facebook-f"></i></a>
                             <a href="#"><i class="fab fa-twitter"></i></a>
                             <a href="#"><i class="fas fa-globe"></i></a>
                             <a href="#"><i class="fab fa-behance"></i></a>
                         </div>
                         <div class="footer-pera">
                              <p></p>
                         </div>
                      </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-3 col-sm-5">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h4>链接</h4>
                               <ul>
                                   <li><a href="#">关于我们</a></li>
                                   <li><a href="#">酒店房间</a></li>
                                   <li><a href="#">酒店照片</a></li>
                                   <li><a href="#">游泳池</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h4>联系我们</h4>
                               <ul>
                                   <li><a href="#">电话: 123 456 789</a></li>
                                   <li><a href="#">123@zjut.edu.cn</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-4  col-sm-5">
                       <div class="single-footer-caption mb-30">
                           <div class="footer-tittle">
                               <h4>酒店位置</h4>
                               <ul>
                                   <li><a href="#">西湖街,</a></li>
                                   <li><a href="#">10086号</a></li>
                               </ul>
                               <!-- Form -->
                                <div class="footer-form" >
                                    <div id="mc_embed_signup">
                                        <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                        method="get" class="subscribe_form relative mail_part">
                                            <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"
                                            class="placeholder hide-on-focus" onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = ' Email Address '">
                                            <div class="form-icon">
                                              <button type="submit" name="submit" id="newsletter-submit"
                                              class="email_icon newsletter-submit button-contactForm"><img src="assets/img/logo/form-iocn.jpg" alt=""></button>
                                            </div>
                                            <div class="mt-10 info"></div>
                                        </form>
                                    </div>
                                </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <!-- Footer End-->
   </footer>
   
	<!-- JS here -->
	
		<!-- All JS Custom Plugins Link Here here -->
        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
		
		<!-- Jquery, Popper, Bootstrap -->
		<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
		<script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
    </body>
</html>