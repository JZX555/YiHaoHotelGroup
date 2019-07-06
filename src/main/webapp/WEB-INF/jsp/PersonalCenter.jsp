<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh_CN">
<!-- meta data -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!--font-family-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- title of site -->
<title>亿豪酒店</title>

<!-- For favicon png -->
<link rel="shortcut icon" type="image/icon" href="/assets/logo/logo.PNG" />

<!--font-awesome.min.css-->
<link rel="stylesheet" href="/assets/css/font-awesome.min.css">

<!--linear icon css-->
<link rel="stylesheet" href="/assets/css/linearicons.css">

<!--animate.css-->
<link rel="stylesheet" href="/assets/css/animate.css">

<!--flaticon.css-->
<link rel="stylesheet" href="/assets/css/flaticon.css">

<!--slick.css-->
<link rel="stylesheet" href="/assets/css/slick.css">
<link rel="stylesheet" href="/assets/css/slick-theme.css">

<!--bootstrap.min.css-->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css">

<!-- bootsnav -->
<link rel="stylesheet" href="/assets/css/bootsnav.css">

<!--style.css-->
<link rel="stylesheet" href="/assets/css/style.css">

<!--responsive.css-->
<link r el="stylesheet" href="/assets/css/responsive.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

<style>
#roomType {
	padding-left: 50px;
}
</style>
<style type="text/css">
		
		#welcome{
			height: 40px;
			width:100px;
			margin-left:23%;
			
		}
		.manage{
			padding: 2px;
			width:200px;
    		height:200px;
     		margin-left:14%; 

		}
		.ha{
			background: url("/assets/images/personalcenter/button.png");
			
			display: inline-block;
			width: 94px;
			height: 98px;
			line-height: 98px;
			text-align: center;
			border-radius:20px;
		}
		.vip{
			background: url("/assets/images/personalcenter/login_m_bg.png");
			background: rgba(0, 0, 0, 0.5);
			padding: 20px;
			height: 260px;
			width:282px;
			/* margin-left: 3.6%; */
			border-radius:20px;
		}
		p{
			text-align: center;
			height:5px;
		}
		 .geren{
		width:282px;
		height:520px;
		background:url("/assets/images/personalcenter/2.png");
		/* filter:alpha(Opacity=60);-moz-opacity:0.6;opacity: 0.7; */
		background: rgba(0, 0, 0, 0.5);
		margin-left:27%;
		border-radius:20px;
		
		} 
		.person{
		float:left;
		display: inline-block;
		
		}
		a>img{
		opacity: 0.7;
		}
	</style>

</head>
<body>
	<!--顶部选择及用户区域-->
	<header id="header-top" class="header-top" style="height: 3em">
		<ul>
			<li class="head-responsive-right pull-right">
				<div class="header-top-right">
					<ul>
					
						<!-- 判断登陆状态 -->
						<c:if test="${cookie.loginTel==null}" var="login"
							scope="session">
							<!-- 如果登陆就显示用户信息，如果未登录就显示登陆注册 -->
							<li class="header-top-contact"><a href="/log/login">sign
									in</a></li>
							<li class="header-top-contact"><a href="/log/register">register</a></li>
						</c:if>

						<c:if test="${!login}">
							<li class="header-top-contact"><a href="#">会员中心</a></li>
							<li class="header-top-contact"><a href="/log/logout">注销</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>

	</header>
	<!--/.header-top-->

	<section class="top-area">
		<div class="header-area">
			<!-- Start Navigation -->
			<nav
				class="navbar navbar-default bootsnav  navbar-sticky navbar-scrollspy"
				data-minus-value-desktop="70" data-minus-value-mobile="55"
				data-speed="1000">

				<div class="container">

					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navbar-menu">
							<i class="fa fa-bars"></i>
						</button>
						<a class="navbar-brand" href="/index.jsp">Yihao<span>Hotel</span></a>

					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=" scroll active"><a href="#home">用户中心</a></li>
						</ul>
						<!--/.nav -->
					</div>
					<!-- /.navbar-collapse -->


				</div>
				<!--/.container-->
			</nav>
			<!--/nav-->
			<!-- End Navigation -->
		</div>
		<!--/.header-area-->
		<div class="clearfix"></div>
	</section>
	
	
	
	<section id="home" class="welcome-hero" style="padding-top: 100px;">
	<div>
		

	<div class="geren person">
		<div id="welcome" style="padding-top: 10px; margin-bottom: 10px;" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cookie.loginTel.value}</br>
			欢迎您，
		</div>
		<div class ="manage" style="margin-bottom: 10px;">
			<div class="ha"><a href="/">个人信息</a></div>
			<div class="ha"><a href="/">我的订单</a></div>
		</br>
			<div class="ha"><a href="/">会员中心</a></div>
			<div class="ha"><a href="/">注销</a></div>
		</div>
		<div class="vip" >
			<img src="/assets/images/personalcenter/1.png">
				<p>您有
				<c:out value="${availPoint}"></c:out>	
				可用积分</p></br>
				<p>您已累计
				<c:out value="${maxPoint}"></c:out>
				积分</p></br>
				<p>距离升级下一等级会员还需
				<c:out value="${needPoint}"></c:out>
				积分</p></br>
				<p>会员特权请点击会员中心进行查看</p></br>
		</div>
		</div>
		<div class="person">
			<div style="width: 520px;height: 290px;margin-left: 100px;">
				<a href="/">
					<img src="/assets/images/personalcenter/activity1.png" style="border-radius: 10px;">
				</a>
			</div>
			<div style="width: 520px;height: 260px;margin-left: 100px;">
				<a href="/">
					<img src="/assets/images/personalcenter/activity2.png" style="margin-top: 10px;border-radius: 10px;">
				</a>
			</div>
		</div>
	</div>
	</section>
	



	<footer id="footer" class="footer">
		<div class="container">
			<div class="hm-footer-copyright">
				<div class="row">
					<div class="col-sm-5">
						<p style="text-align: center">&copy;copyright. designed and
							developed by 亿豪</p>
						<!--/p-->
					</div>
				</div>

			</div>
			<!--/.hm-footer-copyright-->
		</div>
		<!--/.container-->

	</footer>
	<!--/.footer-->



	<script src="/assets/js/jquery.js"></script>

	<!--modernizr.min.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>

	<!--bootstrap.min.js-->
	<script src="/assets/js/bootstrap.min.js"></script>

	<!-- bootsnav js -->
	<script src="/assets/js/bootsnav.js"></script>

	<!--feather.min.js-->
	<script src="/assets/js/feather.min.js"></script>

	<!-- counter js -->
	<script src="/assets/js/jquery.counterup.min.js"></script>
	<script src="/assets/js/waypoints.min.js"></script>

	<!--slick.min.js-->
	<script src="/assets/js/slick.min.js"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

	<!--Custom JS-->
	<script src="/assets/js/custom.js"></script>


</body>
</html>
