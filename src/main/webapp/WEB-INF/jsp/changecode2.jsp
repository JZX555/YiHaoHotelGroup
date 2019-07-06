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
h1{/*派生*/
				font-size: 40px;
			    font-weight: 300;}
			 form{padding: 20px 0;}
			 form input{border: 1px solid #FFF;
			 width: 220px;
			 padding: 10px 15px;
			 display: block;
			 margin: 0 auto 10px auto;
			 border-radius: 30px;/*圆角*/
			font-size: 18px;
			font-weight: 300;
			text-align: center;
			 }
			 form button{
			 	background: white;
			 	border: 0;
			 	padding: 10px 15px;
			 	color: green;
			 	 border-radius: 8px;
			 	 width: 250px;
			 	font-size: 16px;
			 }
			 form button:hover{
			 	background:#CCC; /*鼠标移动上去按钮颜色变灰色*/
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
							<li class="header-top-contact"><a href="/log/goregister">register</a></li>
						</c:if>

						<c:if test="${!login}">
							<li class="header-top-contact"><a href="#">会员中心</a></li>
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
							<li class="scroll"><a href="#roomTypes">房间类型</a></li>
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
	
	
	
	<section id="home" class="welcome-hero" >
		<div class="context">
			<div class="container">
				<h1 style="margin-top: 100px;">修改密码</h1>
				<form action="" method="get">
					<input type="password"  id="oldpass" placeholder="请输入旧密码" />
					<input type="password" id="newpass" name="newpass" placeholder="请输入新密码" />
					<div>
						<input type="password" id="newpass2" name="newpass" placeholder="请重新输入新密码" />
						<span id='passValidSpan' style='color:red'></span>
					</div>
					<button type="button" id="changePassword">确定修改</button>	
					<input type="hidden" id="validFlag" value="0" />
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
		$(document).ready(function() {
			$("#newpass2").blur(function() {
				if($("#newpass").val()!=$("#newpass2").val()){
					$("#passValidSpan").empty();
					$("#passValidSpan").append("密码不一致");
					$("#validFlag").attr("value", "0");
				}
				else{
					$("#passValidSpan").empty();
					$("#validFlag").attr("value", "1");
				}
			});

			$(document).on("click", "#changePassword", function() {
				if($("#validFlag").val() == "1") {
					$.ajax({
						type:"post",
						url:"/Personal/changePassword",
						async:false,
						dataType:"json",
						data:{
							oldPassword:$("#oldpass").val(),
							newPassword:$("#newpass").val(),
						},
						success:function(res) {
							if(res == 1)
								alert("修改成功");
							if(res == -1)
								alert("旧密码输入错误");
							if(res == 0)
								alert("修改失败");
						},
						error:function() {
							alert("修改失败");
						},
					});
				}
			});
		});
		</script>


</body>
</html>
