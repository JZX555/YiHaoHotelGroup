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
						<a class="navbar-brand" href="/index.jsp">yi<span>hao</span></a>

					</div>
					<!--/.navbar-header-->
					<!-- End Header Navigation -->

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=""><a id="home" class="active" href="#">支付方式</a></li>
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

	<!-- 房间状态改变 -->
	<section id="status-view-change-view" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<h2>支付方式选择</h2>
				<hr>
				<h2>
					订单号：
					<c:out value="${result.currentIndentId }"></c:out>
				</h2>
				<h2>
					原价：
					<c:out value="${result.price }"></c:out>
					元
				</h2>
				<h2>
					您是尊贵的
					<span id="vipLevel"></span>
					会员，享
					<c:out value="${result.discount }" />
					折，需支付：
				</h2>
				<br>

				<h2>
					<c:out value="${result.cost }" />
					元
				</h2>
				<h2><c:out value="${result.checkInDate }" /></h2>
				<h2><c:out value="${result.checkOutDate }" /></h2>
				<form action="/pay/choose" method="post">
					<input name="submit" type="hidden" value="银行卡支付"> <input
						name="indent_id" type="hidden" value="${result.currentIndentId }">
					<input name="price" type="hidden" value="${result.price }">
					<input name="cost" type="hidden" value="${result.cost }">
					<button class="welcome-hero-btn" style="display: inline-block;">银行卡支付
					</button>
				</form>

				<form action="/pay/choose" method="post">
					<input name="submit" type="hidden" value="积分支付"> <input
						name="indent_id" type="hidden" value="${result.currentIndentId }">
					<input name="price" type="hidden" value="${result.price }">
					<input name="cost" type="hidden" value="${result.cost }">
					<button class="welcome-hero-btn" style="display: inline-block;">
						积分支付
					</button>
				</form>
				
				<button class="welcome-hero-btn" style="display: inline-block;"><a id="returnIndex" style="color:white" href="/">返回首页
					</a></button>
					
					
				<button id="cancleIndent" class="welcome-hero-btn" style="display: inline-block;">取消订单</button>
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
		$(document).ready(function(){
			
			var vipLevel = ${result.vipLevel};
			var vipName = null;
			switch(vipLevel){
			case 0:
				vipName = "白银";
				break;
			case 1:
				vipName = "黄金";
				break;
			case 2:
				vipName = "铂金";
				break;
			case 3:
				vipName = "黑金";
				break;
			}
			$("#vipLevel").html(vipName);
			
			
			$("#cancleIndent").on("click",function(){
				$.post("/indents/cancelIndent",{
					indentId: "${result.currentIndentId }",
					checkInDate:"${result.checkInDate }",
					checkOutDate:"${result.checkOutDate }"
				},function(result){
					if(result==1){
						alert("订单取消成功");
						location.href ="/";
					}
				},"json");
			});
			
			
			
			
		})
		
	</script>

</body>
</html>
</html>