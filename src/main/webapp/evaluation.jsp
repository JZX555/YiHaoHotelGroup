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
<!-- 评价 -->
<script type="text/javascript" src="/assets/js/jquery-1.8.0.min.js"></script>
<style>
body, li, p, ul {
	margin: 0;
	padding: 0;
	font: 12px/1 Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
}

ul, li, ol {
	list-style: none;
}
/* 重置文本格式元素 */
a {
	text-decoration: none;
	cursor: pointer;
	color: #333333;
	font-size: 14px;
}

a:hover {
	text-decoration: none;
}

.clearfix::after {
	display: block;
	content: '';
	height: 0;
	overflow: hidden;
	clear: both;
}
/*星星样式*/
.content {
	width: 600px;
	margin: 0 auto;
	padding-top: 20px;
}

.title {
	font-size: 14px;
	background: #dfdfdf;
	padding: 10px;
	margin-bottom: 10px;
}

.block {
	width: 100%;
	margin: 0 0 20px 0;
	padding-top: 10px;
	padding-left: 50px;
	line-height: 21px;
}

.block .star_score {
	float: left;
}

.star_list {
	height: 21px;
	margin: 50px;
	line-height: 21px;
}

.block p, .block .attitude {
	padding-left: 20px;
	line-height: 21px;
	display: inline-block;
}

.block p span {
	color: #C00;
	font-size: 16px;
	font-family: Georgia, "Times New Roman", Times, serif;
}

.star_score {
	background: url(/assets/images/evaluation/stark2.png);
	width: 160px;
	height: 21px;
	position: relative;
}

.star_score a {
	height: 21px;
	display: block;
	text-indent: -999em;
	position: absolute;
	left: 0;
}

.star_score a:hover {
	background: url(/assets/images/evaluation/stars2.png);
	left: 0;
}

.star_score a.clibg {
	background: url(/assets/images/evaluation/stars2.png);
	left: 0;
}

#starttwo .star_score {
	background: url(/assets/images/evaluation/starky.png);
}

#starttwo .star_score a:hover {
	background: url(/assets/images/evaluation/starsy.png);
	left: 0;
}

#starttwo .star_score a.clibg {
	background: url(/assets/images/evaluation/starsy.png);
	left: 0;
}
/*星星样式*/
.show_number {
	padding-left: 50px;
	padding-top: 20px;
}

.show_number li {
	width: 240px;
	border: 1px solid #ccc;
	padding: 10px;
	margin-right: 5px;
	margin-bottom: 20px;
}

.atar_Show {
	background: url(/assets/images/evaluation/stark2.png);
	width: 160px;
	height: 21px;
	position: relative;
	float: left;
}

.atar_Show p {
	background: url(/assets/images/evaluation/stars2.png);
	left: 0;
	height: 21px;
	width: 134px;
}

.show_number li span {
	display: inline-block;
	line-height: 21px;
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
							<li class=" scroll active"><a href="#home">评分</a></li>
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
		<div class="content">
			<p class="title" style="text-align: left">订单评价</p>
			<p class="title" style="text-align: left">评分越高代表您对本次入住体验的评价越好</p>
			<div id="startone" class="block clearfix" style="padding-left: 0px;">

				<div class="star_score" style="text-align: left;"></div>
				<p style="float: left; color: #ffffff;">
					您的评分：<span id="fenshu" class="fenshu"></span> 分
				</p>
				<!--  <div class="attitude"></div> -->
			</div>
			<div>
				<h3 style="color: #ffffff; text-align: left;">入住评价：</h3>
				<br /> <br />
			</div>
			<form action="/indents/addComment" method="post">
				<input type="hidden" name="indent_id" value="${indent_id}">
				<input id="score" type="hidden" name="score">
				<textarea id="comment" rows="20" cols="75" name="comment"
					placeholder="卫生、网络、服务、设施...请对我们进行表扬或提建议，我们将认真查看您的入住感受，为了在以后给您带来更好的体验"
					style="width: 602px;"></textarea>
				<input class="input" type="submit" value="确认提交" id="submit"
					style="margin-top: 5px; width: 64px; height: 24px;">
			</form>
			<div>
				<h3 style="text-align: left; color: #ffffff; margin-top: 10px;">
					<ol>
						<li>禁止发布商业用途的联系信息，禁止发布含有外部链接（URL）的内容，禁止发布任何促销广告及无意义的灌水性内容。</li>
						<li>点评必须是入住本人原创且是入住本人的真实入住体验，不允许发布谣言、道听途说等传闻内容；抄袭酒店简介及其他用户的点评，将不予发表，不得从其他网站转载内容，版权责任由点评人自行承担。</li>
						<li>点评不含有违法、歧视等内容，涉及法律纠纷如丢失贵重物品、伤残、死亡等内容将不予展示。</li>
					</ol>
				</h3>
			</div>

			<script type="text/javascript" src="/assets/js/startScore.js"></script>
			<script>
				scoreFun($("#startone"))
				scoreFun($("#starttwo"), {
					fen_d : 22,//每一个a的宽度
					ScoreGrade : 5
				//a的个数 10或者
				})
			</script>

			<script>
				//显示分数
				$(".show_number li p").each(
						function(index, element) {
							var num = $(this).attr("tip");
							var www = num * 2 * 16;//
							$(this).css("width", www);
							$(this).parent(".atar_Show").siblings("span").text(
									num + "分");
						});
			</script>

			<script>
			$("#comment").mouseleave(function(){
			    $("#score").val($("#fenshu").text());});
			</script>
		</div>

		<div
			style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">

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
		  
		
	
	</script>


</body>
</html>
