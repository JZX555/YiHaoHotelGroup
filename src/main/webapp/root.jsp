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
							<li class="header-top-contact"><a href="/log/goregister">注册</a></li>
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
						<a class="navbar-brand" href="/index.jsp">root<span>user</span></a>

					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=""><a id="home" class="active" href="#">首页</a></li>
							<li class=""><a id="checkin-out" href="#">入住登记/退房</a></li>
							<li class=""><a id="status-view-change" href="#">房间状态查看/改变</a></li>
							<li class=""><a id="order-query" href="#">订单查询</a></li>
							<li class=""><a id="reservation" href="#">门市订房</a></li>
							<li class=""><a id="account-inquiry" href="#">流水账查询</a></li>
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
	<section id="home-view" class="welcome-hero rootview">
		<div class="container">
			<div class="welcome-hero-txt">
				<h2>你好管理员xxxxx</h2>
				<br>
				<h2>今天是xx月xx日</h2>
				<h2>共有x人入住</h2>
			</div>
		</div>
	</section>


	<!-- 房间状态改变 -->
	<section id="status-view-change-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>房间状态</h2>
				<hr>
				<form>
					日期：<input type="date" name="checkin">至 <input type="date"
						name="checkout"><br> <br> 房间号：<input type="text"
						name="rootnumber"><br> <br> <input type="submit">
				</form>
			</div>

		</div>
	</section>

	<!-- 周边精彩-->
	<section id="checkin-out-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>入住登记</h2>
				<hr>
				<form>
					用户电话<input type="text" name="tel"> <input type="submit">
				</form>
				<br> <br>
				<h2>退房</h2>
				<hr>
				<form action="">
					房间号码:<input type="text" name="number"> <input type="submit">
				</form>
			</div>
		</div>

		</div>

	</section>

	<!-- 订单查询 -->
	<section id="order-query-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>订单查询</h2>
				<form action="">
					订单号：<input type="text"><br> <br> <input
						type="submit">
				</form>
			</div>
			<!-- <!--/.section-header
			<div class="row">
				<div class=" col-md-4 col-sm-6">
					<a href="#"> 跳转
						<div class="single-explore-item">
							<img alt="" src="assets/images/surrounding/1.jpg"><br>
							<p class="section-header">xxx</p>
						</div>
					</a>
				</div>

				<div class=" col-md-4 col-sm-6">
					<a href="#"> 跳转
						<div class="single-explore-item">
							<img alt="" src="assets/images/surrounding/2.jpg"><br>
							<p class="section-header">xxx</p>
						</div>
					</a>
				</div>

				<div class=" col-md-4 col-sm-6">
					<a href="#"> 跳转
						<div class="single-explore-item">
							<img alt="" src="assets/images/surrounding/3.jpg"><br>
							<p class="section-header">xxx</p>
						</div>
					</a>
				</div> -->

		</div>

	</section>


	<!-- 门市订房 -->
	<section id="reservation-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>门市订房</h2>
				<form>
					入住日期：<input type="date" name="checkin">至 <input type="date"
						name="checkout"><br> <br> 房型：<select
						name="roomType">
						<option value="1">双床房</option>
						<option value="2">大床房</option>
						<option value="3">高级大床房</option>
						<option value="4">豪华套房</option>
						<option value="5">总统套房</option>
					</select><br>
					<br> 住房策略：<select name="strategyType">
						<option value="0">无早餐</option>
						<option value="1">单早餐</option>
						<option value="2">双早餐</option>

					</select><br><br>
					
					住客身份证号码：<input type="text" name="id"><br>
					<br>
					
					<input type="submit">
					
				</form>
			</div>
		</div>

	</section>

	</section>

	<!-- 流水账查询 -->

	<section id="account-inquiry-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>流水账查询</h2>
				<form>
					日期：<input type="date">至
					<input type="date"><br>
					<input type="submit" value="查询">
				</form>
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

	<script type="text/javascript">
		var roomtype = null;
		$(document).ready(function() {

			$(".rootview").hide();
			$("#home-view").show();

			$(".book").click(function() {
				$("#roomType").val(roomtype);
				$("#strategyType").val(this.value);
				$("#breakfast").slideUp();
				$("#information").slideDown();
			});
			$("#home").click(function() {
				$(".rootview").hide();
				$("#home-view").show();
			})
			$("#checkin-out").click(function() {
				$(".rootview").hide();
				$("#checkin-out-view").fadeIn();
			})
			$("#status-view-change").click(function() {
				$(".rootview").hide();
				$("#status-view-change-view").fadeIn();
			})
			$("#order-query").click(function() {
				$(".rootview").hide();
				$("#order-query-view").fadeIn();
			})
			$("#reservation").click(function() {
				$(".rootview").hide();
				$("#reservation-view").fadeIn();
			})
			$("#account-inquiry").click(function() {
				$(".rootview").hide();
				$("#account-inquiry-view").fadeIn();
			})

		});
	</script>


</body>
</html>
</html>