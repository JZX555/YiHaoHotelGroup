<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh_CN">
<!-- meta data -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
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

<!-- 会员特权样式 -->
<link rel="stylesheet" type="text/css" href="/assets/css/base.css">
<link rel="stylesheet" type="text/css" href="/assets/css/tab.css">


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
						<c:if test="${cookie.loginTel==null}" var="login"
							scope="session">
							<!-- 如果登陆就显示用户信息，如果未登录就显示登陆注册 -->
							<li class="header-top-contact"><a href="/log/login">sign
									in</a></li>
							<li class="header-top-contact"><a href="/log/register">register</a></li>
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
	
	
	
	<section id="home" class="welcome-hero" style="padding-top: 100px;">
	<div class="geren">
		<div class="aui-nav-content-box">
	<div class="aui-nav-list-box">
		<ul>
			<li class="aui-current">
				<a href="#">白银会员</a>
			</li>
			<li>
				<a href="#">黄金会员</a>
			</li>
			<li>
				<a href="#">白金会员</a>
			</li>
			<li>
				<a href="#">黑金会员</a>
			</li>
			
		</ul>
	</div>
	<div class="aui-nav-list-tab">
		<div class="aui-nav-list-item" style="display:block">
			<div class="aui-page-list">
				<div class="aui-page-text" style="text-align: left">
					<h2 style="color:#ffffff">
						白银会员，注册即可成为白银会员</br>
						</br>
						可享受礼遇：</br>
						1、尊享预订九八折优惠</br>
						2、免费水果欢迎</br>
						3、生日祝福</br>
					<h2>	
				</div>
			</div>
		</div>

		<div class="aui-nav-list-item" style="display:none">
			<div class="aui-page-list">
				
				<div class="aui-page-text" style="text-align: left">
					<h2 style="color:#ffffff">
						黄金会员，积分达到10000即可成为黄金会员</br>
						</br>
						可享受礼遇：</br>
                	    1、尊享预订九五折优惠</br>
						2、免费水果欢迎</br>
						3、生日祝福</br>
						4、退房时间延迟至14:00</br>
						5、机场火车站接送服务</br>
					
					</h2>
					
				</div>
			</div>
		</div>
		
		<div class="aui-nav-list-item" style="display:none">
			<div class="aui-page-list">
				
				<div class="aui-page-text" style="text-align: left">
					<h2 style="color:#ffffff">
						白金会员，积分达到30000即可成为白金会员</br>
						</br>
						可享受礼遇：</br>
        	            1、尊享预订九折优惠</br>
						2、免费水果欢迎</br>
						3、生日祝福</br>
						4、退房时间延迟至14:00</br>
						5、机场火车站接送服务</br>
						6、订房免费单份早餐提供</br>
						
					
					</h2>
					
				</div>
			</div>
		</div>

		<div class="aui-nav-list-item" style="display:none">
			<div class="aui-page-list">
				
				<div class="aui-page-text" style="text-align: left">
					<h2 style="color:#ffffff">
						黑金会员，积分达到100000即可成为黑金会员</br>
						</br>
						可享受礼遇：</br>
                      	1、尊享预订八五折优惠</br>
						2、免费水果欢迎</br>
						3、生日祝福</br>
						4、订房免费2份早餐提供</br>
						5、退房时间延迟至14:00</br>
						6、机场火车站接送服务</br>
						7、免费自助午餐提供</br>
					</h2>
					
				</div>
			</div>
		</div>




	</div>




<script type="text/javascript" src="/assets/js/jquery.min.js"></script>
<script type="text/javascript"> 
//tab切换
$(function(){
	$('.aui-nav-list-box ul li').click(function(){
		$(this).addClass('aui-current').siblings().removeClass('aui-current');
		$('.aui-nav-list-tab>div:eq('+$(this).index()+')').show().siblings().hide();
	})
});

//导航浮动
$(function(){
	var _line=parseInt($(window).height()/3);
	$(window).scroll(function(){
		if ($(window).scrollTop()>60) {
			$('.aui-nav-list-box').css({'position':'fixed','top':0})
		}else{
			$('.aui-nav-list-box').css({'position':'','top':''})
		};
	});

});
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

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
