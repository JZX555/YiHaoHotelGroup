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

.book-button {
	width: 170px;
	height: 40px;
	margin: auto;
	
}
.breakfast{
	border: none;
    max-width: 100%;
    height: 300;
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
							<li class="scroll"><a href="#roomTypes">房型选择</a></li>
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


	<!-- 房型介绍 -->
	<section id="roomTypes" class="explore"
		style="padding-left: 50px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>房型选择</h2>
			</div>
			<!--/.section-header-->
			<div class="row">
				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt=""
							src="/assets/images/roomType/1.jpg"><br>
						<p class="section-header">高级大床房</p>
						<c:if test="${roomtype1!=0}">
							<button
								class="welcome-hero-btn book-button select-breakfast-button"
								value="1">
								立即预定 <i data-feather="search"></i>
							</button>
						</c:if>
						<c:if test="${roomtype1==0}">
							<div class="welcome-hero-btn book-button">
								无余房<i data-feather="search"></i>
							</div>
						</c:if>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt=""
							src="/assets/images/roomType/2.jpg"><br>
						<p class="section-header">高级双人房</p>
						<c:if test="${roomtype2!=0}">
							<button
								class="welcome-hero-btn book-button select-breakfast-button"
								value="2">
								立即预定 <i data-feather="search"></i>
							</button>
						</c:if>
						<c:if test="${roomtype2==0}">
							<div class="welcome-hero-btn book-button">
								无余房<i data-feather="search"></i>
							</div>
						</c:if>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt=""
							src="/assets/images/roomType/3.jpg"><br>
						<p class="section-header">行政豪华房</p>
						<c:if test="${roomtype3!=0}">
							<button
								class="welcome-hero-btn book-button select-breakfast-button"
								value="3">
								立即预定 <i data-feather="search"></i>
							</button>
						</c:if>
						<c:if test="${roomtype3==0}">
							<div class="welcome-hero-btn book-button">
								无余房<i data-feather="search"></i>
							</div>
						</c:if>
					</div>
				</div>

				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt=""
							src="/assets/images/roomType/4.jpg"><br>
						<p class="section-header">行政豪华套房</p>
						<c:if test="${roomtype4!=0}">
							<button
								class="welcome-hero-btn book-button select-breakfast-button"
								value="4">
								立即预定 <i data-feather="search"></i>
							</button>
						</c:if>
						<c:if test="${roomtype4==0}">
							<div class="welcome-hero-btn book-button">
								无余房<i data-feather="search"></i>
							</div>
						</c:if>
					</div>
				</div>


				<div class=" col-md-4 col-sm-6">
					<div class="single-explore-item">
						<img alt=""
							src="/assets/images/roomType/5.jpg"><br>
						<p class="section-header">总统套房</p>
						<c:if test="${roomtype5!=0}">
							<button
								class="welcome-hero-btn book-button select-breakfast-button"
								value="5">
								立即预定 <i data-feather="search"></i>
							</button>
						</c:if>

						<c:if test="${roomtype5==0}">
							<div class="welcome-hero-btn book-button">
								无余房<i data-feather="search"></i>
							</div>
						</c:if>
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
	<div id="breakfast" class="explore"
		style="display: none; position: fixed; width: 90%; left: 5%; top: 15%; background-color: white; border-radius: 5px; border: 1px solid; padding-top: 10px">
		<div class="explore-content">
			<div class="section-header">
				<h2>选择早餐类型</h2>
			</div>
			<div class="section-header">
				<div class="row">
					<div class=" col-md-4 col-sm-6">
						<div class="single-explore-item">
							<img alt=""
								src="/assets/images/roomType/6.jpg" class="breakfast"><br>
							<p class="section-header">无早餐</p>
							<button value="0" class="welcome-hero-btn book"
								style="width: 170px; height: 40px; margin: auto;">
								立即预定 <i data-feather="search"></i>
							</button>
						</div>
					</div>
					<div class=" col-md-4 col-sm-6">
						<div class="single-explore-item">
							<img alt=""
								src="/assets/images/roomType/7.jpg" class="breakfast"><br>
							<p class="section-header">单早</p>
							<button value="1" class="welcome-hero-btn book"
								style="width: 170px; height: 40px; margin: auto;">
								立即预定 <i data-feather="search"></i>
							</button>
						</div>
					</div>
					<div class=" col-md-4 col-sm-6">
						<div class="single-explore-item">
							<img alt=""
								src="/assets/images/roomType/8.jpg" class="breakfast"><br>
							<p class="section-header">双早</p>
							<button value="2" class="welcome-hero-btn book"
								style="width: 170px; height: 40px; margin: auto;">
								立即预定 <i data-feather="search"></i>
							</button>
						</div>
					</div>

					<button id="cancle" class="welcome-hero-btn cancle"
						style="width: 170px; height: 40px; margin: auto;">
						取消 <i data-feather="search"></i>
					</button>
				</div>
			</div>
		</div>



	</div>

	<div id="information" class="explore"
		style="display: none; position: fixed; width: 40%; left: 30%; top: 15%; background-color: white; border-radius: 5px; border: 1px solid; padding-top: 5%">
		<div class="section-header">
			<h2>请输入以下信息</h2>
			<hr>
			<form action="/user/ready" method="post">
				<input type="text" name="customerName" placeholder="姓名"><br>
				<input type="text" name="customerId" placeholder="身份证号"><br>
				<input type="hidden" name="tel" placeholder="电话号码"
					value="${cookie.loginTel.value}"><br> <input
					type="hidden" id="roomType" name="roomType"> <input
					type="hidden" id="strategyType" name="strategyType"> <input
					type="hidden" name="checkInDate" value="${checkInDate}"> <input
					type="hidden" name="checkOutDate" value="${checkOutDate}">
				<br> <br>
				<button value="2" class="welcome-hero-btn"
					style="width: 170px; height: 40px; margin: auto">
					预定 <i data-feather="search"></i>
				</button>
				
				
			</form>
			<button id="cancle" class="welcome-hero-btn cancle book-button"
						style="width: 170px; height: 40px; margin: auto;">
						取消 <i data-feather="search"></i>
					</button>
		</div>

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
		var roomtype = null;
		$(document).on("click", "#cancle", function() {
			$("#breakfast").fadeOut();
			$("#information").slideUp();
		})
		$(document).ready(function() {

			$(".select-breakfast-button").click(function() {
				$(".roomtype").val(this.value)
				roomtype = this.value;
				$("#breakfast").slideDown();
			});

			$(".book").click(function() {
				$("#roomType").val(roomtype);
				$("#strategyType").val(this.value);
				$("#breakfast").slideUp();
				$("#information").slideDown();
			});

		});
	</script>
</body>
</html>
