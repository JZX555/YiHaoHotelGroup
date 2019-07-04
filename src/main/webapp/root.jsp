<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
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
				<h2>你好管理员</h2>
				<br>
				<%
					Date d = new Date();
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					String now = df.format(d);
				%>
				<h2>
					今天是<%=now%></h2>
				<h2>
					共有
					<c:out value="${isCheckIn}"></c:out>
					人入住
				</h2>
				<h2>
					共有
					<c:out value="${needCheckOut}"></c:out>
					需要退房
				</h2>
				<h2>
					共有
					<c:out value="${isBooked}"></c:out>
					订房
				</h2>
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
				日期：<input type="date" id="checkRoomBegin" name="checkRoomBegin">至 <input
					type="date" name="checkRoomEnd" id="checkRoomEnd"><br> <br>
				房间号：<input id="checkRoomId" type="text" name="checkRoomId"><br>
				<br> <input id="checkRoom" type="submit">

				<hr>
				<div class="displayContent" id="checkRoomContent"></div>
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
					用户电话<input id="checkInTel" type="text"> <input id="checkInBtn" type="submit">
				</form>
				<div class="displayContent" id="checkInContent"></div>
				<br> <br>
				<h2>退房</h2>
				<hr>
				<form>
					房间号码:<input id="checkOutId" type="text"> <input id="checkOutBtn" type="submit">
				</form>
				<div class="displayContent" id="checkOutContent"></div>
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
				<form>
					订单号：<input id="checkIndentId" type="text" /><br> <br> 
					<input id="checkIndentBtn" type="submit"> </input>
				</form>
				<div class="displayContent" id="checkIndentContent" ></div>
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
				入住日期：<input type="date" name="checkin" id="bookBeginDate">至 <input
					type="date" name="checkout" id="bookEndDate"><br> <br>
				房型：<select name="roomType" id="bookRoomType">
					<option value="1">双床房</option>
					<option value="2">大床房</option>
					<option value="3">高级大床房</option>
					<option value="4">豪华套房</option>
					<option value="5">总统套房</option>
				</select><br> <br> 住房策略：<select name="strategyType">
					<option value="0">无早餐</option>
					<option value="1">单早餐</option>
					<option value="2">双早餐</option>

				</select><br> <br> 住客身份证号码：<input id="bookCustomerId" type="text"
					name="id"><br> <br> 
				<input type="submit" id="bookRoomBtn">
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

				日期：<input type="date" id="billBeginDate" />至 <input type="date" id="billEndDate" /><br>
				<input id="billBtn" type="submit" value="查询"> <br>
				<table id="billTable">
					<thead>
						<tr><th>完成订单</th><th>双床房订单</th><th>大床房订单</th><th>高级大床房订单</th></tr>
					</thead>
					<tbody id="billBody1">
						<tr></tr>
					</tbody>
					<thead>
						<tr><th>豪华套房订单</th><th>总统套房订单</th><th>总收入</th><th>无</th></tr>
					</thead>
					<tbody id="billBody2">
						<tr></tr>
					</tbody>
				</table>
			</div>
			<div>
				<input id="detilBtn" type="button" value="查看详情" />
				<div id="detilContent"></div>
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
	
	function formatDate(date) {
		var day = date.getDate();
		var month = date.getMonth() + 1;

		month = (month.toString().length == 1) ? ("0" + month) : month;
		day = (day.toString().length == 1) ? ("0" + day) : day;

		var res = date.getFullYear() + "-" + month + "-" + day;

		return res;
	}

		var roomtype = null;
		$(document).ready(
						function() {

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
							
							$(document).on("click", "#bookRoomBtn", function() {
								alert($("#bookBeginDate").val());
								$.ajax({
									type:"post",
									url:"/root/bookRoom", 
									async:false,
									data:{
										beginDate : $("#bookBeginDate").val(),
										endDate : $("#bookEndDate").val(),
										customerId : $("#bookCustomerId").val(),
										roomType : $("#bookRoomType").val()	
									}, 
									dataType:"json",
									success:function(res) {
										if(res["isCheckIn"] == 1)
											alert("您的身份证不能重复预定");
										else {
											if (res["isSuccess"] == 1) {
												alert("订房成功,房间号为:" + res["roomID"]);
											}
											else
												alert("房间不足，订房失败");
										}
									},
									error:function() {
										alert("订房失败");
									},
								});

							});
							
							$(document).on("click", "#checkInBtn", function() {
								var tel = $("#checkInTel").val();
								if(tel == "") {
									alert("电话不能为空");
									return false;
								}
								$.ajax({
									type:"post",
									url:"/root/checkinList",
									async:false,
									data: {
										tel : tel
									},
									dataType:"json",
									success:function(res) {
										var display = $("#checkInContent");
										display.empty();
										$.each(res, function(i, rwi) {
											var line1 = "<p>订单号：" + rwi.indent.indentId + 
														"    住房日期：" + formatDate(new Date(rwi.indent.startTime)) + 
														" 至 " + formatDate(new Date(rwi.indent.endTime)) + "</p>";
											var line2 = "<p>房间号：" + rwi.indent.roomId + 
														"      预订人电话：" + rwi.indent.tel + 
														"      ￥" + rwi.indent.cost + "          " + rwi.room.roomType + 
														"<input id='checkInVerify' type='button' value='确认入住' data-indent-id='" + 
														rwi.indent.indentId + "' ></input></p><br>";
											display.append(line1, line2);
										});
									},
									error:function() {
										alert("查询失败");
									}
								})

							});

							$(document).on("click", "#checkOutBtn", function() {
								var roomID = $("#checkOutId").val();
								if(roomID == "") {
									alert("房间号不能为空");
									return false;
								}
								$.ajax({
									type:"post",
									url:"/root/checkoutList",
									async:false,
									data: {
										roomID : roomID
									},
									dataType:"json",
									success:function(res) {
										var display = $("#checkOutContent");
										display.empty();
										$.each(res, function(i, rwi) {
											var line1 = "<p>订单号：" + rwi.indent.indentId + 
														"    住房日期：" + formatDate(new Date(rwi.indent.startTime)) + 
														" 至 " + formatDate(new Date(rwi.indent.endTime)) + "</p>";
											var line2 = "<p>房间号：" + rwi.indent.roomId + 
														"      预订人电话：" + rwi.indent.tel + 
														"      ￥" + rwi.indent.cost + "          " + rwi.room.roomType + 
														"<input id='checkOutVerify' type='button' value='确认退房' data-indent-id='" + 
														rwi.indent.indentId + "' ></input></p><br>";
											display.append(line1, line2);
										});
									},
									error:function() {
										alert("查询失败");
									}
								})

							});

							$(document).on("click", "#checkInVerify", function() {
								var indentID = $(this).attr("data-indent-id");
								$.ajax({
									type:"post",
									url:"/root/checkin",
									async:false,
									data:{
										indentID:indentID
									},
									dataType:"json",
									success: function(res) {
										if(res == 1) {
											alert("入住成功");
											$("#checkInBtn").click();
										}
										else
											alert("入住失败");
									},
									error: function() {
										alert("入住失败");
									},
								})
							})

							$(document).on("click", "#checkOutVerify", function() {
								var indentID = $(this).attr("data-indent-id");
								$.ajax({
									type:"post",
									url:"/root/checkout",
									async:false,
									data:{
										indentID:indentID
									},
									dataType:"json",
									success: function(res) {
										if(res == 1) {
											alert("退房成功");
											$("#checkOutBtn").click();
										}
										else
											alert("退房失败");
									},
									error: function() {
										alert("退房失败");
									},
								})
							})

							$(document).on("click", "#checkRoom", function() {
								var roomId = $("#checkRoomId").val();
								$.ajax({
									type:"post",
									url:"/root/checkRoom",
									async:false,
									data:{
										"beginDate" : $("#checkRoomBegin").val(),
										"endDate" : $("#checkRoomEnd").val(),
										"roomID": $("#checkRoomId").val()
									},
									dataType:"json",
									success:function(res) {
										//当订单不存在时，可修改价格和状态
										var display = $("#checkRoomContent");

										display.empty();
										//for( ; bgn <= end; bgn.setDate(bgn.getDate + 1)) {
										$.each(res, function(i, rwi) {
											var flag = 0;
											var setTitle =  "<p>房间号：" + roomId +
															"  日期：" + rwi.date;
											var setData = "<p>房间类型：" + rwi.room.roomType +
														"        房间价格" + rwi.room.price;
											var setPR = "";
											if(rwi.haveIndent == 1) {
												setTitle = setTitle + "(预定日期：" + formatDate(new Date(rwi.indent.startTime)) + 
														",    退房日期：" + formatDate(new Date(rwi.indent.endTime)) + ")</p>";
												setData = setData + "房间状态：不可预定       预定人电话：" + rwi.indent.tel +
															"</p><br>";
											}
											else {
												setTitle = setTitle + "</p>"
												setData = setData + "房间状态：可预定</p>";
												setPR = setPR + "<p>房间价格：<input id='setPrice' type='text' />" + 
														"<input id='setPriceButton' type='button' >修改</input>" +
														"房间状态：<select class='sub_button' name='p'>" + 
														"<option value='canBook'>可预订</option>" + 
														"<option value='cantBook'>不可预定</option>" +
														"<input id='setStatusButton' type='submit' >修改</input>" + 
														"</select></p><br>";
											}

											display.append(setTitle, setData, setPR);
											
										})
										//}
									},
									error:function() {
										alert("查询错误!");
									}
									});
								});

							$(document).on("click", "#setPriceButton", function() {
								var roomId = $("#checkRoomId").val();
								$.ajax({
									type:"post",
									url:"/root/modifyRoomPrice",
									async:false,
									data:{
										curDate : formatDate(new Date()),
										roomID : roomId,
										newPrice : $("#setPrice").val()
									}, 
									dataType:"json",
									success:function(res) {
										alert("修改成功");
									},
									error:function() {
										alert("修改失败");
									},
								});
							});
							

							$(document).on("click", "#setStatusButton", function() {				
								var roomId = $("#checkRoomId").val();
								$.ajax({
									type:"post",
									url:"/root/modifyRoomState", 
									async:false,
									data:{
										curDate : formatDate(new Date()),
										roomID : roomId,
										//newPrice:$("#setPrice").value
									}, 
									dataType:"json",
									success:function(res) {
										alert("修改成功");
									},
									error:function() {
										alert("修改失败");
									},
								});
							})
							
							$(document).on("click", "#checkIndentBtn", function() {
								var indentID = $("#checkIndentId").val();
								$.ajax({
									type:"post",
									url:"/root/checkIndent",
									async:false,
									data:{
										indentID : indentID
									},
									dataType:"json",
									success:function(indent) {
										var display = $("#checkIndentContent");
										display.empty();

										var line1 = "<p>订单号：" + indent.indentId + 
													"    入住时间：" + formatDate(new Date(indent.startTime)) + 
													"    退房时间：" + formatDate(new Date(indent.endTime)) + "</p>";
										var line2 = "<p>预订人电话：" + indent.tel + 
													"        ￥" + indent.cost + 
													"        房间号：" + indent.roomId + 
													"        订单状态：" + indent.indentType + "</p><br>";

										display.append(line1 + line2);
									},
									error:function() {
										alert("查询失败");
									},
								})
							});

							$(document).on("click", "#billBtn", function() {
								var ideal = "";
								$.ajax({
									type:"post",
									url:"/root/getBill", 
									async:false,
									data:{
										beginDate : $("#billBeginDate").val(),
										endDate : $("#billEndDate").val(),
									}, 
									dataType:"json",
									success:function(res) {
										var tbody1 = $("#billBody1");
										var tbody2 = $("#billBody2");									
										tbody1.empty();
										tbody2.empty();
										
										var line1 = "<tr><td>" + res["complete"] + 
													"</td><td>" + res["type1"] + 
													"</td><td>" + res["type2"] +
													"</td><td>" + res["type3"] +
													"</td></tr>";
										var line2 = "<tr><td>" + res["type4"] + 
													"</td><td>" + res["type5"] + 
													"</td><td>" + res["money"] +
													"</td><td>" + " " +
													"</td></tr>";
										
										tbody1.append(line1);
										tbody2.append(line2);		
									},
									error:function() {
										alert("查询失败");
									}
								});
							});

							$(document).on("click", "#detilBtn", function() {
								var ideal = "";
								$.ajax({
									type:"post",
									url:"/root/getDetil", 
									async:false,
									data:{
										beginDate : $("#billBeginDate").val(),
										endDate : $("#billEndDate").val(),
									}, 
									dataType:"json",
									success:function(indents) {
										var display = $("#detilContent")	
										display.empty();

										$.each(indents, function(i, indent) {
											var line1 = "<p>订单号：" + indent.indentId + 
														"    入住时间：" + formatDate(new Date(indent.startTime)) + 
														"    退房时间：" + formatDate(new Date(indent.endTime)) + "</p>";
											var line2 = "<p>预订人电话：" + indent.tel + 
														"        ￥" + indent.cost + 
														"        房间号：" + indent.roomId + 
														"        订单状态：" + indent.indentType + "</p><br>";

											display.append(line1 + line2);	
										});

									},
									error:function() {
										alert("查询失败");
									}
								});
							});

						});
	</script>


</body>
</html>
</html>