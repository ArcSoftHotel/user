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

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    
  <!-- CSS here -->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/css/gijgo.css">
  <link rel="stylesheet" href="assets/css/slicknav.css">
  <link rel="stylesheet" href="assets/css/animate.min.css">
  <link rel="stylesheet" href="assets/css/magnific-popup.css">
  <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
  <link rel="stylesheet" href="assets/css/themify-icons.css">
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
       <!-- slider Area Start-->
       <div class="slider-area">
        <div class="single-slider hero-overly slider-height2 d-flex align-items-center" data-background="assets/img/hero/contact_hero.jpg" >
            <div class="container">
                <div class="row ">
                    <div class="col-md-11 offset-xl-1 offset-lg-1 offset-md-1">
                        <div class="hero-caption">
                            <span>酒店</span>
                            <h2>房间信息</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
    <%
    	Room room = (Room) session.getAttribute("room");
   	  	String pic = "assets/img/rooms/"+room.getPic()+".jpg";
    %>
    <!--================Blog Area =================-->
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                            <div class="blog_item_img">
                                <img class="card-img rounded-0" src="<%=pic %>" alt="" style="width:700px;">
                                
                            </div>
							
                            <div class="blog_details">
                                <a class="d-inline-block" href="#">
                                    <h2><%=room.getType() %></h2>
                                </a>
                                <p>房间介绍....</p>
                                <ul class="blog-info-link">
                                    <li><i class="fa fa-user"></i>¥<%=room.getPrice() %>/晚</li>
                                </ul>
                                 
                            </div>
                           
                        </article>
						<div style="width:300px;text-align:center;">
                        <a class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    href="OrderRoomServlet?id=<%=room.getRoomid() %>">预定</a>
                        </div>           

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='搜索房间'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = '搜索房间'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">搜索</button>
                            </form>
                        </aside>

                        

                        <aside class="single_sidebar_widget popular_post_widget">
                            <a href="room.jsp"><h3 class="widget_title">更多房间</h3></a>
                            
                           <% 
                        	RoomDAO roomdao = new RoomDAO(); 
					   		ArrayList<Room> rl = roomdao.GetAllRooms();
					   		int i=0;
					   		for(Room rooms:rl){
					   			if(i==3) break;
					   			else if(rooms.getRoomid()==room.getRoomid()) continue;
					   			else{
					   				i++;
						   			String pics = "assets/img/rooms/"+rooms.getPic()+".jpg";
							%> 
                            <div class="media post_item" >
                                <a href="RoomDetail?id=<%=rooms.getRoomid() %>"><img src="<%=pics %>" alt="<%=rooms.getRoomid() %>" style="width:100px;"></a>
                                <div class="media-body">
                                    
                                        <h3><%=rooms.getType() %></h3>
                                    
                                    <p>¥ <%=rooms.getPrice() %> / 晚</p>
                                </div>
                            </div>
                          <%} }%>   
                            
                        </aside>                         


                        <aside class="single_sidebar_widget newsletter_widget">
                            <h4 class="widget_title">选择房间</h4>

                            <form action="#">
                                <div class="form-group">
                                	<p>房间类型</p>
                                    <div class="default-select" id="default-select"> 
                                                                      
										<select>
											<option value="普通单人房">普通单人房</option>
											<option value="普通双人房">普通双人房</option>
											<option value="豪华单人房">豪华单人房</option>
											<option value="豪华双人房">豪华双人房</option>
										</select>
									</div>	
									<p>房间价格</p> 
									<div class="default-select" id="default-select"> 
                                    
										<select>
											<option value="1">¥150以下</option>
											<option value="2">¥150~¥250</option>
											<option value="3">¥250以上</option>
										</select>
									</div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">查看</button>
                            </form>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

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
		
		<!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
		<script src="./assets/js/jquery.sticky.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
        //     icons: {
        //      rightIcon: '<span class="fa fa-caret-down"></span>'
        //  }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
        var timepicker = $('#timepicker').timepicker({
         format: 'HH.MM'
     });
    </script>
</body>
</html>