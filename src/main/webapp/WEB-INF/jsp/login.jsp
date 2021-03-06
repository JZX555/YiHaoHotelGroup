<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>登录-亿豪酒店</title>
	<link href="/assets/Wopop_files/style_log.css" rel="stylesheet"
		type="text/css">
		<link rel="stylesheet" type="text/css"
			href="/assets/Wopop_files/style.css">
			<link rel="stylesheet" type="text/css"
				href="/assets/Wopop_files/userpanel.css">
				<link rel="stylesheet" type="text/css"
					href="/assets/Wopop_files/jquery.ui.all.css">
					
	<style>


/*------------// Overall //------------------*/
body{font:12px/180% Arial,Helvetica,Verdana; }
body.login{ background:url(/assets/Wopop_files/login_bgx.png);}
table,td{font:12px/180% Arial, "宋体",Helvetica, sans-serif,Verdana; color:#58595b;}
table{border-collapse:collapse; border-spacing:0; empty-cells:show; }
th, td { border-collapse:collapse; }
A:link{text-decoration:none; color:#58595b;}
A:visited{text-decoration:none; color:#58595b;}
A:hover{text-decoration:none; color:#206fd5;}
img{ border:0; }
div,p,img,ul,li,form,input,label,span,dl,dt,dd,h1,h2,h3,h4,h5,h6{margin:0;padding:0;}
input[type="reset"]::-moz-focus-inner, input[type="button"]::-moz-focus-inner, input[type="submit"]::-moz-focus-inner, input[type="file"] > input[type="button"]::-moz-focus-inner{   border:none;padding:0 } 
ol,ul,li{list-style-type:none;}
.overz{ overflow:auto; zoom:1; overflow-x:hidden; overflow-y:hidden;}
.dspn{ display:none;}
a{blr:expression(this.onFocus=this.blur())} /*for IE*/
a{outline:none;} /*for Firefox*/
html{-webkit-text-size-adjust:none;}
/*------------// layout //------------------*/
#box{ width:100%; margin:0 auto;}
.top_bg{ background:url(../images/main_bg.jpg) no-repeat center top; height:634px;}
.top{ width:1000px; margin:0 auto;}
.header{ padding-top:22px; height:46px;}
#logo{ float:left;}
#nav{ float:right; margin-right:24px; padding-top:12px;}
#nav ul li{ float:left; width:55px; height:20px; margin-right:8px; line-height:20px; text-align:center; font-size:13px;}
#nav ul li a{ display:block; color:#656565;  height:20px;}
#nav ul li a:hover{ background:url(../images/site_bg.png) no-repeat; color:#FFF;}
#nav ul li.local a{background:url(../images/site_bg.png) no-repeat; color:#FFF; }
.top_bg_c{ background:url(../images/top_bg.gif);}
.main_area{ margin-top:45px;}
.index_left{ width:520px; float:left; }
.index_right{ width:412px; float:right; margin-right:26px; padding-top:23px;}
.free_website_font{ padding-top:7px;}
.free_website_font .title{ margin-bottom:12px;}
.free_website_font .intro{ font-family:Tahoma; width:300px; margin-left:124px; line-height:24px; margin-bottom:20px;}
.site_link{ padding-left:120px;}
.site_link a{ display:block; }
.site_link a.star_now{ background:url(../images/site_bg.png) no-repeat 0 -20px; height:92px; width:296px; margin-bottom:17px;}
.site_link a.star_now:hover{ background-position:0 -112px; }
.site_link a.templates{ background:url(../images/site_bg.png) no-repeat 0 -205px; height:88px; width:296px; margin-bottom:24px;}
.site_link a.templates:hover{ background-position:0 -294px; }
.system_description{ padding-left:124px; font-size:11px;}
.system_description .sys_des_left{ float:left; }
.system_description .sys_des_right{ float:right; text-align:right;}
.system_description p{ margin-bottom:5px;}
.main_web{ padding:27px 26px 0 26px; width:1000px; margin:0 auto;}
.template_list_left{ float:left; width:842px; padding-left:5px;}
.template_list_category{ float:right; width:115px;}
.color_bar{ font-size:12px; height:20px; line-height:20px; margin-bottom:24px;}
.color_bar h2{ float:left; font-size:12px; margin-right:5px;}
.color_bar .color_link{ float:left;}
.color_bar a{ display:inline-block; width:44px; float:left; text-align:center; margin-right:5px;}
.color_bar a:hover{ background:url(../images/site_bg.png) no-repeat -55px 0; color:#FFF;}
.color_bahover{background:url(../images/site_bg.png) no-repeat -55px 0; color:#FFF;}
.template_list_element{ width:155px; height:155px; float:left; margin-right:55px; margin-bottom:26px;}
.template_list_element a{ display:block;  background:url(../images/site_bg.png) no-repeat 0 -541px; padding:5px;}
.template_list_element a:hover{ background-position:0 -386px;}
.template_list_category{ text-align:right;}
.template_list_category h2{ color:#FFF; font-size:12px; background: url(../images/site_bg.png) no-repeat -155px -386px; height:26px; line-height:26px; padding-right:10px; margin-bottom:5px;}
.template_list_category ul li{ height:26px; line-height:26px; }
.template_list_category ul li a,.template_list_category ul li a:visited{ color:#7f7f7f;}
.template_list_category ul li a:hover{color:#206fd5;background:url(../images/site_bg.png) no-repeat -155px -665px; }
.template_list_category ul li a{ width:auto;display:block; height:26px; padding-right:3px;}
.template_list_category ul li.local a{background: url(../images/site_bg.png) no-repeat -155px -386px; height:26px; line-height:26px; color:#FFF;}
.template_list_category ul li.local a:visited{color:#FFF;}
.page_s{ text-align:center; clear:both; height:19px; margin-bottom:40px; margin-right:45px;}
.page_s a{ display:inline-block; background:url(../images/site_bg.png) no-repeat -118px 0; width:19px; height:19px; }
.page_s a.local{background:url(../images/site_bg.png) no-repeat -99px 0;}
.footer{ clear:both; height:150px;}
.f_left{ float:left; font-size:10px;}
.f_left .copyright{ text-transform:uppercase; margin-bottom:3px;}
.language_bar,.follow_icon,.facebook_icon{ float:left;}
.follow_icon,.facebook_icon{ padding-top:2px;}
.follow_icon{ margin-right:8px;}
.follow_icon a{ display:block; width:60px; height:20px; background:url(../images/site_bg.png) no-repeat -155px -461px; }
.facebook_icon a{ display:block; width:81px; height:20px; background:url(../images/site_bg.png) no-repeat -155px -441px; }
.language_bar{ width:80px; margin-right:5px;}
.f_link_language a.login-in{  background: url("../images/site_bg.png") no-repeat scroll -168px 0 transparent; display: block; float: left; height: 19px;line-height: 18px; margin-right: 5px;margin-top: 2px;text-indent: 18px;width: 63px;}
.f_link_language a.login-in,.f_link_language a.login-in:visited{ color:#FFFFFF;}
.f_link_language a.login-in:hover{ color:#FFF; background-position:-231px 0;}
.lang_bar_m{ background:url(../images/site_bg.png) no-repeat -156px -413px; width:80px; height:27px; z-index:100; position:absolute; overflow:hidden;}
.lang_bar_m div{ width:57px; text-align:center; float:left; margin-left:4px; }
.lang_bar_m a{ display:block; width:15px; height:19px; margin:2px 4px 0 0; _margin:0; margin-top:2px; overflow:hidden; float:right; background:url(../images/site_bg.png) no-repeat -151px 0;}
.lang_drop_down{ position:relative; height:107px;}
.lang_d_d_hidden{ background:url(../images/second_language.png) no-repeat; height:82px; margin-top:0px; padding-top:25px; }
.lang_drop_down a{ display:block; text-align:center; width:70px; margin:0 auto; height:20px; line-height:20px; margin-bottom:5px; font-size:12px; overflow:hidden;}
.lang_drop_down a:hover{ background:#68a1ea; color:#FFF;}


.f_right{ float:right; text-align:right; font-size:10px; text-transform:uppercase; color:#afafaf;}
/*------------// About //------------------*/
#about_content{  background:url(../images/about_bg.png) right top no-repeat; }
.about_top h2{ margin-bottom:10px;}
.about_top_intro{ width:608px; font-size:15px; line-height:170%; text-align:justify;text-justify:inter-ideograph; margin-bottom:32px;}
.about_top h3{ margin-bottom:46px;}
.about_c{ text-align:justify;text-justify:inter-ideograph;}
#contact_content{}
#contact_content h2{  margin-bottom:32px;}
.contact_left{ float:left; width:326px; padding-top:20px;}
.contact_right{ float:right; width:448px;}
.contact_font{ font-size:13px; line-height:200%; margin-bottom:30px;}
.contact_font span{ color:#2f7ad9;}
.contact_icon a{ display: inline-block; width:45px; height:45px; margin-right:15px;}
.contact_icon a.fackbook{ background:url(../images/site_bg.png) no-repeat -155px -481px; }
.contact_icon a.fackbook:hover{ background:url(../images/site_bg.png) no-repeat -200px -481px; }
.contact_icon a.twitter{ background:url(../images/site_bg.png) no-repeat -155px -526px; }
.contact_icon a.twitter:hover{ background:url(../images/site_bg.png) no-repeat -200px -526px; }
.contact_icon a.google{ background:url(../images/site_bg.png) no-repeat -155px -571px; }
.contact_icon a.google:hover{ background:url(../images/site_bg.png) no-repeat -200px -571px; }
.contact_icon a.mail{ background:url(../images/site_bg.png) no-repeat -155px -616px; }
.contact_icon a.mail:hover{ background:url(../images/site_bg.png) no-repeat -200px -616px; }
.contact_right h4{ font-size:13px; font-weight:normal; margin-bottom:5px; }
.contact_right input.txt_input{ border:1px solid #bbb; background:url(../images/site_bg.png) 0 -696px repeat-x; height:32px; margin-bottom:5px; width:359px; line-height:32px; padding:0 5px; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px;  }
.contact_right input.txt_input:focus{ transition:border linear .2s,box-shadow linear .2s; -moz-transition:border linear .2s,-moz-box-shadow linear .2s; -webkit-transition:border linear .2s,-webkit-box-shadow linear .2s; outline:none;border-color:rgba(173,173,173.75); box-shadow:0 0 8px rgba(173,173,173,.5); -moz-box-shadow:0 0 8px rgba(173,173,173,.5); -webkit-box-shadow:0 0 8px rgba(173,173,173,3); border:1px solid #7cccec;}
.contact_right textarea.text_area{ border:1px solid #bbb; background:url(../images/site_bg.png) 0 -728px repeat-x; height:112px; overflow:auto; margin-bottom:10px; line-height:32px; width:429px; padding:5px; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; }
.contact_right textarea.text_area:focus{ transition:border linear .2s,box-shadow linear .2s; -moz-transition:border linear .2s,-moz-box-shadow linear .2s; -webkit-transition:border linear .2s,-webkit-box-shadow linear .2s; outline:none;border-color:rgba(173,173,173.75); box-shadow:0 0 8px rgba(173,173,173,.5); -moz-box-shadow:0 0 8px rgba(173,173,173,.5); -webkit-box-shadow:0 0 8px rgba(173,173,173,3); border:1px solid #7cccec;}
.contact_right input.sub_mit{ width:150px; height:29px; border:none; background:url(../images/site_bg.png) 0 -850px no-repeat; }
.contact_right input.sub_mit:hover{ background:url(../images/site_bg.png) 0 -879px no-repeat; cursor:pointer;}
/*--login--*/
.login_m{ width:403px; margin:0 auto; height:375px; margin-top:98px; /*position: absolute;left:50%;top:50%;margin-left:-202px;margin-top:-188px;*/}
.login_logo{ text-align:center; margin-bottom:25px;}
.login_boder{ background: url(login_m_bg.png) no-repeat; height:302px; overflow:hidden;}
.login_padding{ padding:28px 47px 20px 47px ;}
.login_boder h2{ color:#4f5d80; text-transform:uppercase; font-size:12px; font-weight:normal; margin-bottom:11px;}
.forget_model_h2{color:#4f5d80; font-size:12px; font-weight:normal; margin-bottom:11px;}

.login_boder input.txt_input{ width:295px; height:36px; border:1px solid #cad2db; background:url(../images/txt_input_bg.gif) no-repeat;  padding:0 5px; -moz-border-radius:5px; -webkit-border-radius:5px; border-radius:5px; line-height:36px; margin-bottom:10px; font-size:14px; color:#717171; font-family:Arial;}
.login_boder input.txt_input2{ margin-bottom:20px;}
.login_boder input.txt_input:focus{ transition:border linear .2s,box-shadow linear .2s; -moz-transition:border linear .2s,-moz-box-shadow linear .2s; -webkit-transition:border linear .2s,-webkit-box-shadow linear .2s; outline:none;border-color:rgba(173,173,173.75); box-shadow:0 0 8px rgba(173,173,173,.5); -moz-box-shadow:0 0 8px rgba(173,173,173,.5); -webkit-box-shadow:0 0 8px rgba(173,173,173,3); border:1px solid #6192c8;}
.login_boder p.forgot{ font-size:11px;  text-align:right; margin-bottom:15px;}
.login_boder p.forgot a,.login_boder p.forgot a:visited{color:#8c8e91;}
.login_boder p.forgot a:hover{color:#206fd5;}
.rem_sub input.sub_button{ float:right; width:78px; height:32px; background:url(button1.png) no-repeat; border-radius:10px;  padding-bottom:2px; font-size:12px; font-weight:bold;margin-left: 2px; }
.rem_sub select.sub_button{ float:left; width:58px; height:32px;}
/*.rem_sub input.sub_button_1{ float:right; width:122px; height:32px; background:url(site_bg.png) no-repeat -153px -850px; border:none; color:#FFF; padding-bottom:2px; font-size:14px; font-weight:bold;}*/
.rem_sub input.sub_buttons{ float:left; width:122px;  height:32px; background:url(site_bg.png) no-repeat -153px -850px; border:none; color:#FFF; padding-bottom:2px; font-size:14px; font-weight:bold;}
.rem_sub input.sub_buttons:hover{ background-position:-153px -882px; cursor:pointer;}

/*.rem_sub input.sub_button_1:hover{ background-position:-33px -882px; cursor:pointer;}*/
.rem_sub input.sub_button:hover{ background-position:-153px -882px; cursor:pointer;}
.rem_sub .rem_sub_l{  font-size:12px; height:33px; line-height:33px;}
.rem_sub input#checkbox{ margin-right:5px; vertical-align:middle;}
/*dali*/
.focusBox{height:513px;}
.focusContentBox{height:100%}
.focusContent{width:1000px;float:left}

/* CSS Document */


h1, h2, h3, h4, h5, h6 { font-family: "microsoft yahei", Arial, Helvetica, sans-serif; font-size:18px; font-weight:normal; margin:0; padding:0; }
ol, ul, li, div, p, dl, dt, dd { list-style:none; padding:0; text-justify:inter-ideograph; font-size:12px; font-family:Arial, Helvetica, sans-serif;
	margin:0px;
}
a, img, table, td, tr { border:none; }
.clear { clear:both; }
/* a { color:#ff3800 ;text-decoration:none}*/
a { color:#2D2D2D ;text-decoration:none}
a:hover { text-decoration:none }
input, select, textarea { font-family:Arial, Helvetica, sans-serif; padding:1px;}
a { blr:expression(this.onFocus=this.blur())
} /*for IE*/
a { outline:none; } /*for Firefox*/
/* 头部 */
#header { margin:0 auto; width:992px; z-index:2; position:relative;}
#logo_zh { background:url(../images/Logo_zh.gif) no-repeat center center; width:310px; height:100px; float:left; cursor:pointer; }

#logo_en { background:url(../images/Logo_en.gif) no-repeat center center; width:310px; height:100px; float:left; cursor:pointer; }

#logo { background:url(../images/Logo.gif) no-repeat center center; width:310px; height:100px; float:left; cursor:pointer; }

#login {float: right;}

#language { margin: 30px 0 0 -460px; color:#000; position:absolute;}
#language img,.language img{ vertical-align:middle; margin: 0 3px 2px 0 ;}
.copyrights{text-indent:-9999px;height:0;line-height:0;font-size:0;overflow:hidden;}
.language:hover{ color:#333;}
#log { float:left; }
#log input { background:#fff; border:solid 1px #d4d4d4; width:88px; height:17px; vertical-align: middle; }
.sub_login { width:69px; text-align:center; height:22px; line-height:22px; color:#fff !important; text-decoration:none; font-weight:bold; margin-left:20px; background:url(../images/bg.gif) no-repeat; border:none; margin-right:0px !important; }
#forget { padding-top:20px; color:#c4c4c4; text-align:right; }
#forget input { vertical-align: middle; margin-right:10px; }
#forget a { color:#797979; text-decoration:none; }

.s_money{ border:1px solid #ccc; margin-left:5px;}
/*#content{background:#fff url(../images/content_bg.gif) repeat-x; height:500px; width:980px; margin:0 auto; border:1px solid #fff; -moz-box-shadow:1px 1px 5px #ccc;-webkit-box-shadow:1px 1px 5px #ccc;box-shadow:1px 1px 5px #ccc;}*/

/* 主体 */
#content { background:url(../images/content_bg1.gif) repeat-y; width:992px; margin:0 auto; overflow:hidden; z-index:1; }
#content1{background: url(../images/content_bg2.gif) repeat-x scroll 0 0 transparent; margin: 0 7px;overflow: hidden;padding-bottom: 8px;}
#top { background:url(../images/top_bg.gif) no-repeat; }
#menu { padding:14px 0 50px 14px; }
#nav1 { width:558px; overflow:hidden; float:left; }
#nav { text-align:left; background:url(../images/nav_bg.gif) repeat-x; border-left:solid 1px #167cb7; border-top:solid 1px #157ab3; height:46px; width:578px; overflow:hidden; }
#nav ul li { float:left; background:url(../images/nav_li_bg.gif) no-repeat right; }
#nav ul li a { font-family:"microsoft yahei", Arial, Helvetica, sans-serif; font-size:14px; color:#fff; text-decoration:none; padding:0 17px; line-height:45px; display:block; margin-top:-1px; height:46px;}
#nav ul li a[id='zh'] { font-family:"microsoft yahei", Arial, Helvetica, sans-serif; font-size:14px; color:#fff; text-decoration:none; padding:0 17px; line-height:45px; display:block; margin-top:-1px; height:46px;}
#nav ul li a[id='en'] { font-family:"microsoft yahei", Arial, Helvetica, sans-serif; font-size:14px; color:#fff; text-decoration:none; padding-left:15px;padding-right:18px; line-height:45px; display:block; margin-top:-1px; height:46px;}

#nav ul li:hover { background:#08578e; }
.quick_web { float:left; margin-left:10px; background:url(../images/quick_sub.jpg) no-repeat 0 -0px; width:194px; height:49px; }
.quick_web:hover { background:url(../images/quick_sub.jpg) no-repeat 0 -49px; }
.quick_web_zh { float:left; margin-left:10px; background:url(../images/quick_sub_zh.jpg) no-repeat 0 -0px; width:194px; height:49px; }
.quick_web_zh:hover { background:url(../images/quick_sub_zh.jpg) no-repeat 0 -49px; }
.quick_web_en { float:left; margin-left:10px; background:url(../images/quick_sub_en.jpg) no-repeat 0 -0px; width:194px; height:49px; }
.quick_web_en:hover { background:url(../images/quick_sub_en.jpg) no-repeat 0 -49px; }
.quick_shop { float:left; margin-left:8px; background:url(../images/quick_sub.jpg) no-repeat -200px 0px; width:194px; height:49px; }
.quick_shop:hover { background:url(../images/quick_sub.jpg) no-repeat -200px -49px; }
.quick_shop_zh { float:left; margin-left:8px; background:url(../images/quick_sub_zh.jpg) no-repeat -200px 0px; width:194px; height:49px; }
.quick_shop_zh:hover { background:url(../images/quick_sub_zh.jpg) no-repeat -200px -49px; }
.quick_shop_en { float:left; margin-left:8px; background:url(../images/quick_sub_en.jpg) no-repeat -200px 0px; width:194px; height:49px; }
.quick_shop_en:hover { background:url(../images/quick_sub_en.jpg) no-repeat -200px -49px; }
/* BANNER */	
	#js { pwidth:100%; overflow:hidden; background:url(../images/content_bg1.gif) repeat-y center top; _background:url(../images/content_bg6.gif) repeat-y center top; }
#op { width:992px; margin:0 auto; }
/*#c01 { text-align:center; background:url(../images/banner_web.jpg) no-repeat center center; height:247px; z-index:100px; display:block; }
#c02 { text-align:center; background:url(../images/banner_shop.jpg) no-repeat center center; height:247px; z-index:100px; }*/
.web { background:url(../images/bg.gif) no-repeat 0 -151px; height:188px; width:418px; padding:8px 20px; float:left; margin-left:29px; _display:inline; }
.web h1 { color:#445e84; font-size:20px; height:60px; line-height:40px; background:url(../images/icon.gif) no-repeat 0 -70px; text-indent:40px; }
.web h2 { color:#696969; font-size:14px; line-height:30px; padding-bottom:5px; }
.sub_web { background:url(../images/sub_bg.jpg) no-repeat -0px 0px; width:185px; height:60px; display:block; display:block; position:relative; left:-3px;}
.sub_web:hover { background:url(../images/sub_bg.jpg) no-repeat -0px -60px; }
.sub_web_zh { background:url(../images/sub_bg_zh.jpg) no-repeat -0px 0px; width:185px; height:60px; display:block; display:block; position:relative; left:-3px;}
.sub_web_zh:hover { background:url(../images/sub_bg_zh.jpg) no-repeat -0px -60px; }
.sub_web_en { background:url(../images/sub_bg_en.jpg) no-repeat -0px 0px; width:185px; height:60px; display:block; display:block; position:relative; left:-3px;}
.sub_web_en:hover { background:url(../images/sub_bg_en.jpg) no-repeat -0px -60px; }
.shop { background:url(../images/bg.gif) no-repeat 0 -365px; height:188px; width:418px; padding:8px 20px; float:left; margin-left:18px; }
.shop h1 { color:#445e84; font-size:20px; height:60px; line-height:40px; background:url(../images/icon.gif) no-repeat 0 -120px; text-indent:40px; }
.shop h2 { color:#696969; font-size:14px; line-height:30px; padding-bottom:5px; }
.sub_shop { background:url(../images/sub_bg.jpg) no-repeat -190px -0px; width:185px; height:60px; display:block; position:relative; left:-3px;}
.sub_shop:hover { background:url(../images/sub_bg.jpg) no-repeat -190px -60px; }
.sub_shop_zh { background:url(../images/sub_bg_zh.jpg) no-repeat -190px -0px; width:185px; height:60px; display:block; position:relative; left:-3px;}
.sub_shop_zh:hover { background:url(../images/sub_bg_zh.jpg) no-repeat -190px -60px; }
.sub_shop_en { background:url(../images/sub_bg_en.jpg) no-repeat -190px -0px; width:185px; height:60px; display:block; position:relative; left:-3px;}
.sub_shop_en:hover { background:url(../images/sub_bg_en.jpg) no-repeat -190px -60px; }
.hidden { display:none; }
/* 服务 */
#server { padding:45px 0 20px 0; margin:0 30px; overflow:hidden; width:1100px;}
#server_l{ background:url(../images/server_l.gif) no-repeat;}
#server_l dl{padding-left:130px; height:67px; margin-bottom:20px;}
#server_l dt{ color:#445e84; font-size:18px;font-family:"microsoft yahei"; line-height:18px; padding-bottom:15px;}
#server_l dd{ line-height:20px;}
#server_r,#server_l{ float:left; width:450px; overflow:hidden;}
#server_r{ padding-left:30px;}
#server h1 { font-size:18px; color:#445e84;  border-bottom: solid 1px #ededed; line-height:18px; padding-bottom:22px; text-indent:15px;}
#server_con { padding-left:3px;}
#server_con ul { width:600px; overflow:hidden; padding-top:10px;}
#server_con li { font-size:14px; color:#646464; background:url(../images/icon.gif) no-repeat 0 13px; line-height:41px; float:left; text-indent:25px; width:242px; }
#server_con .ts { font-size:14px; font-weight:bold; color:#5a6472; background:url(../images/icon.gif) no-repeat 1px -25px; text-indent:25px; line-height:40px; }
/* 底部 */		
	#footer { width:972px; margin:0 auto; line-height:24px; background:url(../images/footer_bg.gif) no-repeat center top; padding:5px 10px; }
#footer span { }
#footer span a { }
/* 选择模板 */	

	#temp_more { height:602px; border:solid 1px #fff; margin:0 auto; background:#fff; }
#temp_more .top { background:url(../images/more_h1.gif) repeat-x; height:65px; }
#temp_more .close { background:url(../images/temp_more_bg.gif) no-repeat 0px -70px; display:block; float:right; height:28px; width:28px; position:relative; margin:-47px 15px 0px 0px; }
#temp_more p { font-size:20px; color:#626262; line-height:65px; background:url(../images/temp_more_bg.gif) no-repeat 15px 10px; text-indent:65px; font-family: "microsoft yahei"; }
#temp_more .tem { padding:0px 20px; }
#temp_more .tem li { display: inline; float: left; margin: 30px 17px 0 17px; }
#temp_more .tem li span { background: url(../images/temp_more_bg.gif) no-repeat scroll 0 -128px transparent; color: #FFFFFF; display: block; height: 27px; line-height: 23px; text-align: center; width: 145px; }
#temp_more .tem li span a { color:#fff; text-decoration:none; }
#temp_more .page { text-align:center; margin-top:40px; }
#temp_more .page a { text-decoration:none; color:#626262; padding:5px 10px; }
#temp_more .page a:hover { background:#34baff; color:#fff; }
#ibanner { height:450px; }
ul#output li { position: absolute; height: 240px; z-index:1;}
.bg_btn_con{border-top: 1px solid #DCDCDC;margin: 0 auto;padding: 20px;text-align: center;width: 912px;}
.bg_btn { background: url("../images/btn_bng.gif") repeat-x scroll 0 0 transparent; border: medium none; color: #FFFFFF; cursor: pointer; height: 24px; line-height: 22px; text-align: center; width: 108px; }
.bg_btn_new { background: url("../images/btn_bng.gif") repeat-x scroll 0 0 transparent; border: medium none; color: #FFFFFF; cursor: pointer; height: 24px; line-height: 22px; text-align: center; width: 108px; padding:5px 10px; margin-right:5px;}
#button2, #button4 { margin-left: 32px; }
#tinybox { position:absolute; display:none; background:#ffffff url(../images/preload.gif) no-repeat 50% 50%; border:10px solid #e3e3e3; z-index:2000; }
#tinymask { position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500; }
#tinycontent { background:#ffffff; font-size:1.1em; }

.p_info_error { padding:10px; height:200px; background:url(../images/error.png) no-repeat 50px 70px;  font-family:microsoft yahei; font-size:16px; padding:100px 0 0 200px; line-height:40px;}
.p_info_right { height:150px; background:url(../images/right.png) no-repeat 50px 70px;  font-family:microsoft yahei; font-size:16px; padding:100px 0 0 200px; line-height:40px;}



/*-----Demo Styles IMPORTANT - YOU CAN REMOVE THE FOLLOWING STYLES WHEN USING IN YOUR PROJECTS -----*/



/*-----Position and hide the dropdown-----*/

.drop { display:none;  z-index:10000000; -webkit-box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .4); -moz-box-shadow:  0 2px 4px 0 rgba(0, 0, 0, .4); box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .4); background:#f4f4f4;left: 60px; position:absolute; top: 36px; width:324px; z-index:1000;*left:63px;*top: 38px; }
/*-----Dropdown form element-----*/

#loform { border:solid 1px #fff; width:340px;background: #f4f4f4; clear:both; -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2); -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .2); box-shadow: 0 1px 2px rgba(0, 0, 0, .2); margin-top:6px; }
.required{ background:url(../images/input_bgnew.gif) no-repeat; border:solid 1px #d7d7d7; padding:5px 0px; width:210px; *width:200px;}
.drop P{ line-height:40px;}
.remember{padding:0px 0 0 56px; line-height:40px;}
.remember input{vertical-align: middle; }
.log_bottom{background:url(../images/login_bottom.gif) no-repeat; height:50px; line-height:50px;}
.log_bottom a{ width:160px; display:block; float:left; text-align:center; text-decoration:none; color:#666; text-indent:30px;}
.log_bottom a:hover{ color:#999;}
/*-----Signin link-----*/
#login1{ margin:-1px 0 0 140px;}
.signin {background:url(../images/login_sub.gif) no-repeat; width:69px; height:22px; color:#fff;  text-decoration:none; display:inline-block;text-align:center; line-height:22px;}
/*-----Signin clicked state-----*/

.signinclick {  background:#f4f4f4; width:69px; height:22px; color:#FF3800;  text-decoration:none; display:inline-block;text-align:center; line-height:22px; box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .4);}
/*-----Submit Button-----*/

.subin1 {background:url(../images/login_sub.gif); border:none; color:#fff; width:69px; height:22px; margin:10px 0 0 203px; cursor:pointer; }
.regbtn {background:url(../images/reg_button.gif) no-repeat; width:69px; height:22px; color:#fff; text-decoration:none; display:inline-block; text-align:center; line-height:22px; margin-left:5px;}

/*-----Inputs-----
#login_jasons{ height:100px;}
.language_s{left: 650px;
    position: relative;
    top: -74px;
    width:100px;}

.ch{ font-size:12px; width:120px; display:inline-block; padding:10px 0 0 10px; line-height:30px;cursor:pointer;}
.ch_hover{ background:url(/images/languagetop.png) no-repeat; color:#fff; display: inline-block;cursor:pointer;}
.select_langhover{ background:url(/images/languagebtm.png) bottom; color:#fff;}
.select_lang{display:none; width:114px; padding:0 0 10px 10px;}
.select_lang li{ line-height:30px;cursor:pointer;}
.select_lang li:hover{ color:#ccc; cursor:pointer;}
.language_s img{ padding-right:5px; position:relative; top:1px;}
.l_jt{ position:relative; right:-10px; top:-1px !important;}


#longed_jason{float: right;margin: 40px 0 0 558px;position: absolute;width: 431px;}

.language_s_jason{left: 454px;position: relative;top: -72px;width: 100px;}

.language_s_jason img{ padding-right:5px; position:relative; top:1px;}

#tw,#en,#zh{cursor: pointer;display: inline-block;font-size: 12px;line-height: 30px;padding: 10px 0 0 10px; }
.ullogines li{padding :10px 0 0 20px !important;}
.ul_jason li{padding :10px 0 0 20px !important;}
*/
.cnzz a{ color:#e7e7e7} 
.qipaoclass{ background: url("../userhome/ot5lst/images/bo.png") no-repeat scroll 0 0 transparent;
	height:80px;
    color: Black;
    font-family: Tahoma;
    font-size: 12px;    
    padding: 0 19px;
    position:absolute;
    display: inline-block;
    padding-bottom:10px;
    margin:30px 0px 0px -10px;
	margin:30px 0px 0px -10px \9\0;
	margin:30px 0px 0px -390px \9;
    }
    
	@-moz-document url-prefix()
	{.qipaoclass { margin:30px 0px 0px -390px }}

    .qipaoclass p { line-height: 24px;
    margin-top: 16px;}
    .tst{ float:left; height:33px;}
	
	
	</style>
</head>

<body class="login" mycollectionplug="bind">

	<script type="text/javascript">
function isLeagel(form)

{	
    if(form.tel.value == "手机号/邮箱")
    {
         alert("ID不能为空");
         return false;
    }
    if(form.password.value == "******")
    {
         alert("密码不能为空");
         return false;
    }
    return true;
}

function goRegister() {
	window.location.href = "/log/register";
}

if(${flag==1}){
	alert("账号或者密码错误");
}	
</script>
	<div class="login_m">
		<div class="login_logo">
			<img src="/assets/Wopop_files/4.png" width="196" height="46">
		</div>
		<div class="login_boder" style="background:url(/assets/Wopop_files/login_m_bg.png)">

			<div class="login_padding" id="login_model">


				<form action="validate" method="post"
					onsubmit="return isLeagel(this);">


					<h2>用户名</h2>
					<label> <input type="text" name="tel" id="username"
						class="txt_input txt_input2"
						onfocus="if (value ==&#39;手机号/邮箱&#39;){value =&#39;&#39;}"
						onblur="if (value ==&#39;&#39;){value=&#39;手机号/邮箱&#39;}"
						value="手机号/邮箱"></label>
					<h2>密码</h2>
					<label> <input type="password" name="password" id="userpwd"
						class="txt_input"
						onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}"
						onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}"
						value="******"></label>
					<p class="forgot">
						<a id="iforget" href="javascript:void(0);">忘记密码?</a>
					</p>
					<div class="rem_sub">
						<div class="rem_sub_l">
							<select class="sub_button" name="p">
								<option value="user">用户</option>
								<option value="manager">管理员</option>
							</select> <input type="submit" class="sub_button" value="登 录"
								style="opacity: 0.7;"> <input type="button"
								class="sub_button" value="注 册" style="opacity: 0.7;" onclick="goRegister();">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>





	<div id="forget_model" class="login_padding" style="display: none">
		<br>

			<h1>Forgot password</h1> <br>
				<div class="forget_model_h2">(Please enter your registered
					email below and the system will automatically reset users’ password
					and send it to user’s registered email address.)</div> <label> <input
					type="text" id="usrmail" class="txt_input txt_input2"></label>


				<div class="rem_sub">
					<label> <input type="submit" class="sub_buttons"
						name="button" id="Retrievenow" value="Retrieve now"
						style="opacity: 0.7;"> <input type="submit"
							class="sub_button" name="button" id="denglou" value="Return"
							style="opacity: 0.7;"></label>
				</div>
	</div>

</body>
</html>