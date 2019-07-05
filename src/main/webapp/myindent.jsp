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
					<div class="collapse navbar-collapse menu-ui-design"
						id="navbar-menu">
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown"
							data-out="fadeOutUp">
							<li class=""><a id="payed" href="#">已付款</a></li>
							<li class=""><a id="finished" href="#">已完成</a></li>
							<li class=""><a id="unpay" href="#">未付款</a></li>
							<li class=""><a id="refund" href="#">已退款/取消</a></li>
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

	<section id="content" class="explore rootview"
		style="padding-left: 25px; padding-right: 25px;">
		<div class="explore-content">
			<div class="section-header">
				<table id="indentlist">
					<thead>
					</thead>
					<tbody>
					</tbody>

				</table>
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
	
	<div id="cardPayDisplay" class="explore"
		style="display: none; position: fixed; width: 90%; left: 5%; top: 10%; background-color: white; border-radius: 5px; border: 1px solid; padding-top: 0">
		<div class="section-header">
			<form action="/pay/refundByDB" method="post">
				<input type="text" name="card_id" placeholder="请输入银行卡号码"><br>
				<input type="hidden" id="card_cost" name="cost"> 
				<input type="hidden" id="card_indent_id" name="indent_id">  
				<input type="submit" value="确定退款 ">
			</form>
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
		$(document).ready(function() {
			var cost = null;
			var indent_id = null
			$("#payed").click(function() {
				$("table>thead").html("<tr><th>订单号</th><th>预定日期</th><th>预定人电话</th><th>价格</th><th>退款</th></tr>")
				var tbody= $("table > tbody").empty();
				$.post("/indents/show_indents1", function(data) {
					
					$.each(data,function(i,item){
						var tr = $("<tr/>");
						var indentId = $("<td/>").html(item.indent.indentId);
						var bookDate = $("<td/>").html(item.indent.startTime);
						var tel = $("<td/>").html(item.indent.customerId);
						var price = $("<td/>").html(item.indent.cost);
						var button = $("<td/>");
						if(item.indent.payType==1){
							button.html("<button class='cardRefund'>退款</button>")
						}else{
							button.html("<button class='pointRefund'>退积分</button>")
						}
						button.attr({"indent_id":item.indent.indentId,"cost":item.indent.cost});
						
						tr.append(indentId,bookDate,tel,price,button).appendTo(tbody);
			})

				}, "json");

			})
			//退款
			//银行卡退款
			$(".cardRefund").click(function () {
				#("#cardPayDisplay").show();
				$("#card_cost").val($(this).attr("cost"));
				$("#card_indent_id").val($(this).attr("indent_id"))
			});
			
			$(".pointRefund").click(function(){
				$.post("/pay/refundByP",
						  {
						    cost:$(this).attr("cost"),
						    indent_id:$(this).attr("indent_id")
						  },
						  function(data){
						    alert("退款成功，你当前还有"+data+"分");
						  },"json");
			})
			
			$("#finished").click(function() {
				$("table>thead").html("<tr><th>订单号</th><th>预定日期</th>th>退房日期</th><th>预定人电话</th><th>价格</th><th>评价</th></tr>")
				$.post("/indents/show_indents2", function(data) {
					var tbody= $("table > tbody").empty();
					$.each(data,function(i,item){
						var tr = $("<tr/>");
						var indentId = $("<td/>").html(item.indent.indentId);
						var bookDate = $("<td/>").html(item.indent.startTime);
						var endDate = $("<td/>").html(item.indent.endTime);
						var tel = $("<td/>").html(item.indent.customerId);
						var price = $("<td/>").html(item.indent.cost);
						var button = null;
						if(item.havePost == 0){
							button = $("<td/>").html("<form action='/indents/addComment'><input type='hidden' name='indent_id' value="+item.indent.indentId+"><input type='submit' value='去评价'></form>");
						}
						else{
							button = $("<td/>").html("<form action='/indents/showComment'><input type='hidden' name='indent_id' value="+item.indent.indentId+"><input type='submit' value='查看评价'></form>");
						}
						
						
						tr.append(indentId,bookDate,endDate,tel,price,button).appendTo(tbody);
			})

				}, "json");

			})
			
			
			
			$("#unpay").click(function() {
				$("table>thead").html("<tr><th>订单号</th><th>预定人电话</th><th>价格</th><th>评价</th></tr>")
				$.post("/indents/show_indents3", function(data) {
					var tbody= $("table > tbody").empty();
					$.each(data,function(i,item){
						var tr = $("<tr/>");
						var indentId = $("<td/>").html(item.indent.indentId);
						var tel = $("<td/>").html(item.indent.customerId);
						var price = $("<td/>").html(item.indent.cost);
						var button = $("<td/>").html("去支付");
						
						tr.append(indentId,bookDate,endDate,tel,price,button).appendTo(tbody);
			})

				}, "json");

			})
			
			
			
			$("#refund").click(function() {
				$("table>thead").html("<tr><th>订单号</th><th>预定日期</th><th>退房日期</th><th>预定人电话</th><th>价格</th><th>评价</th></tr>")
				$.post("/indents/show_indents4", function(data) {
					var tbody= $("table > tbody").empty();
					$.each(data,function(i,item){
						var tr = $("<tr/>");
						var indentId = $("<td/>").html(item.indent.indentId);
						var bookDate = $("<td/>").html(item.indent.startTime);
						var refundDate = $("<td/>").html(item.indent.endTime);
						var tel = $("<td/>").html(item.indent.customerId);
						var price = $("<td/>").html(item.indent.cost);
						var button = $("<td/>").html("已完成");
						
						tr.append(indentId,bookDate,endDate,tel,price,button).appendTo(tbody);
			})

				}, "json");

			})
			

		})
	</script>


</body>
</html>