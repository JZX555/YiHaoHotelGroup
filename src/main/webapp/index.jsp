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

#surronding img {
	display: block;
	margin: auto
}

div>p {
	font-size: 18px;
}

div

ul>li {
	text-align: left;
}

li>ul>li {
	text-align: left;
	text-indent: 2em;
}



 .clear { 
     clear: both; 
 }
 
 #room1Introduction{
 	z-index:100;
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
						<c:if test="${cookie.loginTel==null}" var="login" scope="session">
							<!-- 如果登陆就显示用户信息，如果未登录就显示登陆注册 -->
							<li class="header-top-contact"><a href="/log/login">登陆</a></li>
							<li class="header-top-contact"><a href="/log/register">注册</a></li>
						</c:if>

						<c:if test="${!login}">
							<li class="header-top-contact"><a href="/Personal/goIndex">会员中心</a></li>
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
							<li class=" scroll active"><a href="#home">我们的品牌</a></li>
							<li class="scroll"><a href="#roomTypes">房型概览</a></li>
							<li class="scroll"><a href="#surronding">周边精彩</a></li>
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

	<!-- 首页home  -->
	<section id="home" class="welcome-hero">
		<div class="container">
			<div class="welcome-hero-txt">
				<h2>欢迎光临亿豪酒店</h2>
			</div>
			<form action="/user/date" method="post" onsubmit="return check()">
				<div class="welcome-hero-serch-box"
					style="opacity: 0; margin-left: 129px;">

					<div class="welcome-hero-form">
						<div class="single-welcome-hero-form">
							<h3>入住日期</h3>
							<input id="checkInDate" type="date" name="checkInDate" />
						</div>
						<div class="single-welcome-hero-form">
							<h3>离开日期</h3>
							<input id="checkOutDate" type="date" name="checkOutDate">
						</div>

						<button class="welcome-hero-btn" type="submit">
							立即预定 <i data-feather="search"></i>
						</button>
					</div>

				</div>
			</form>
		</div>
	</section>


	<!-- 房型介绍 -->
	<section id="roomTypes" class="explore"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>房型概览</h2>
			</div>
			<!--/.section-header-->
			<div class="row">
				<div class=" col-md-4 col-sm-6 ">

					<div class="single-explore-item roomIntroduction">
						<img alt="" src="/assets/images/roomType/1.jpg"><br>
						<p class="section-header">高级大床房</p>
					</div>

				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item  roomIntroduction">
						<img alt="" src="assets/images/roomType/2.jpg"><br>
						<p class="section-header">高级双人房</p>
					</div>

				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item roomIntroduction">
						<img alt="" src="assets/images/roomType/3.jpg"><br>
						<p class="section-header">行政豪华房</p>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item roomIntroduction">
						<img alt="" src="assets/images/roomType/4.jpg"><br>
						<p class="section-header">行政豪华套房</p>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item roomIntroduction">
						<img alt="" src="assets/images/roomType/5.jpg"><br>
						<p class="section-header">总统套房</p>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6" >
					<div class="single-explore-item roomIntroduction">
						<img alt="" src="assets/images/roomType/0.jpg"><br>
						<p class="section-header">公共区域</p>
					</div>

				</div>


			</div>
		</div>

	</section>

	<!-- 周边精彩-->
	<section id="surronding" class="explore"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>周边精彩</h2>
			</div>
			<!--/.section-header-->
			<div class="row">
				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt="" src="assets/images/surrounding/1.jpg"><br>
						<p class="section-header">道顿堀店大缆车</p>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt="" src="assets/images/surrounding/2.jpg"><br>
						<p class="section-header">环球影城</p>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt="" src="assets/images/surrounding/3.jpg"><br>
						<p class="section-header">国际金融中心</p>
					</div>
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

	<div id="room1Introduction" class="explore Introduction"
		style="padding-top: 50px; display:none; position: fixed; width: 30%; left: 35%; top: 0%; background-color: white; border-radius: 5px; border: 1px solid; padding-top: 0;padding-bottom: 20px;">
		<div class="section-header">
			<img id="introImg" alt="" src="">
			<hr>
			<h2 id="introHeader"></h2>
			<hr>

			<br>
			<div style="display:block;width:300px;margin:auto">
			<div style="float:left;">
				<ul>
					<li>私人浴室</li>
					<li>提供停车场</li>
					<li>浴室为你提供：
						<ul>
							<li>热水浴缸</li>
							<li>淋浴</li>
							<li>浴缸</li>
							<li>吹风机</li>
							<li>浴袍</li>
							<li>免费洗浴用品</li>
						</ul>
					</li>
				</ul>
			</div>
			<div style="float:right">
				<ul>
					<li>客房设施
						<ul>
							<li>电话</li>
							<li>卫星频道</li>
							<li>隔音</li>
							<li>隔音</li>
							<li>高层有电梯直达</li>
							<li>暖气</li>
						</ul>
					</li>
					<li>禁烟/吸烟
						<ul>
							<li>不准吸烟</li>
						</ul>
					</li>
				</ul>
			</div>
			</div><br>
			<div class="clear"></div>
			
		</div><hr>
		<button class="welcome-hero-btn" id="cancel"
				style="margin-left: auto; margin-right: auto;float:none; display:block; width: 170px;
	height: 40px;
	margin: auto;">关闭</button>
	</div>



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
	<script type="text/javascript">
		function check() {
			var checkInDate = new Date($("#checkInDate").val());
			var checkOutDate = new Date($("#checkOutDate").val());
			if (checkInDate == "Invalid Date" || checkOutDate == "Invalid Date") {
				alert("请输入时间");
				return false;
			}
			if (checkInDate.getTime() >= checkOutDate.getTime()) {
				alert("时间输入有误");
				return false;
			} else
				return true;
		}
		$(document).ready(function(){
			$(".roomIntroduction").click(function(){
				$("#introHeader").html($(this).children(".section-header").html());
				$("#introImg").attr("src",$(this).children("img").attr("src"));
				$("#room1Introduction").slideDown();
				
			});
			
			$("#cancel").click(function(){
				$(".Introduction").slideUp();
			})
			
		})
	</script>
</body>
</html>
