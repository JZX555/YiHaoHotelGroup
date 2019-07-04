<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录-亿豪酒店</title>
<link href="/assets/Wopop_files/style_log.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/assets/Wopop_files/style.css">
<link rel="stylesheet" type="text/css" href="/assets/Wopop_files/userpanel.css">
<link rel="stylesheet" type="text/css" href="/assets/Wopop_files/jquery.ui.all.css">
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

if(${flag}==1){
	alert("账号或者密码错误");
}
	
</script>
<div class="login_m">
<div class="login_logo"><img src="/assets/Wopop_files/4.png" width="196" height="46"></div>
<div class="login_boder">

<div class="login_padding" id="login_model">


  <form action="validate" method="post" onsubmit="return isLeagel(this);">
  
  
  <h2>用户名</h2>
  <label>
    <input type="text" name="tel" id="username" class="txt_input txt_input2" onfocus="if (value ==&#39;手机号/邮箱&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;手机号/邮箱&#39;}" value="手机号/邮箱">
  </label>
  <h2>密码</h2>
  <label>
    <input type="password" name="password" id="userpwd" class="txt_input" onfocus="if (value ==&#39;******&#39;){value =&#39;&#39;}" onblur="if (value ==&#39;&#39;){value=&#39;******&#39;}" value="******">
  </label>
  <p class="forgot"><a id="iforget" href="javascript:void(0);">忘记密码?</a></p>
  <div class="rem_sub">
    <div class="rem_sub_l">
        <select class="sub_button" name="p">
            <option value="user">用户</option>
            <option value="manager">管理员</option>
        </select>
      <input type="submit" class="sub_button"  value="登 录" style="opacity: 0.7;" >
      <input type="submit" class="sub_button"  value="注 册" style="opacity: 0.7;">
    </div>
  </div>
  </form>
  </div>
  </div>
  </div>
  
  
   


<div id="forget_model" class="login_padding" style="display:none">
<br>

   <h1>Forgot password</h1>
   <br>
   <div class="forget_model_h2">(Please enter your registered email below and the system will automatically reset users’ password and send it to user’s registered email address.)</div>
    <label>
    <input type="text" id="usrmail" class="txt_input txt_input2">
   </label>

 
  <div class="rem_sub">
    <label>
     <input type="submit" class="sub_buttons" name="button" id="Retrievenow" value="Retrieve now" style="opacity: 0.7;">
     　　　
     <input type="submit" class="sub_button" name="button" id="denglou" value="Return" style="opacity: 0.7;">　　
    
    </label>
  </div>
</div>

</body></html>