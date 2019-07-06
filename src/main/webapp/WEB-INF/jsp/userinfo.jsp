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
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=" scroll active"><a href="/#">返回</a></li><!-- 返回会员中心 -->

						</ul>
						<!--/.nav -->
					</div>

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
				<h2>个人中心</h2>
			</div>
			<form action="#" method="post">
				<div class="welcome-hero-serch-box"
					style="opacity: 0; margin-left: 129px; display: block;">

					<div class="welcome-hero-form" style="margin-top: 5px;">
						<div class="single-welcome-hero-form" style="width: 100%;">
							<h3>电话号码</h3>
							<input type="text" name="tel" id="tel" placeholder="${tel}">
							<span></span>
						</div>
					</div>
					<div class="welcome-hero-form" style="margin-top: 5px;">
						<div class="single-welcome-hero-form" style="width: 100%;">
							<h3>生日</h3>
							<input type="date" name="birthday" id="birthday" placeholder="${birthday}">
						</div>
					</div>
					<div class="welcome-hero-form" style="margin-top: 5px;">
						<div class="single-welcome-hero-form" style="width: 100%;">
							<h3>电子邮件</h3>
							<input type="password" name="email" id="email" placeholder="${email}">
						</div>
					</div>
					
					<button class="welcome-hero-btn" type="submit" style="margin-top:15px;" id="changeInfo">
							修改信息
					</button>
					<button class="welcome-hero-btn" type="submit" style="margin-top:15px;" id="changePassword">
							修改密码
					</button>
				</div>
			</form>
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
		$(document).ready(function() {
			$("#email").blur(function() {
				var email = $("#email").val();
				if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
					$(this).after("<span style='color:red'>用户名不存在</span>");
				}
			});

			$(document).on("click", "#changeInfo", function() {
				var tel = $("#tel").val();
				var email = $("#email").val();
				var birthday = $("#birthday").val();
				if(tel == "") {
					alert("电话不能为空");
					return false;
				}
				if(email == "") {
					alert("邮箱不能为空");
					return false;
				}
				if(birthday == "") {
					alert("生日不能为空");
					return false;
				}
				if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
					alert("邮箱格式错误");
					return false;
				}
				$.ajax({
					type:"post",
					url:"/Personal/personal_inf",
					async:false,
					data:{
						birthday:birthday,
						tel:tel,
						email:email
					},
					dataType:"json",
					success:function(res) {
						if(res == 0) {
							alert("修改失败");
						if(res == 1)
							alert("修改成功");
						}
					},
					error: function() {
						alert("修改失败，请联系客服");
					},
				});
			});
			
			$(document).on("click", "#changePassword", function() {
				var email = $("#email").val();
				if(email == "") {
					alert("邮箱不能为空");
					return false;
				}
				$.ajax({
					type:"post",
					url:"/Personal/goEmail",
					async=true,
					data:{
						email:email,
					},
					dataType:"json",
					success:function(res) {
						window.location.href = res;
					},
					error:function() {
						alert("跳转失败");
					}
				});
			});
		});
	</script>


</body>
</html>