package cn.edu.cqu.yihao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.service.AccountService;

@Controller
@RequestMapping("/log")
public class LogController {
	@Autowired
	AccountService accountService = null;
	
	/**
	 * 登录转发
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request,Model model) {
    	String telCookie = null;
    	String passwordCookie = null;
    	
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null) {
    		for (Cookie cookie : cookies) {
    			// 得到cookie的用户名
    	        if (cookie.getName().equals("loginTel"))
    	        	telCookie = cookie.getValue(); 

    	        // 得到cookie的密码
    	        if (cookie.getName().equals("loginPassword"))
    	        	passwordCookie = cookie.getValue(); 

    		}
    		if (telCookie != null && passwordCookie != null) {
    			Account account = accountService.getAccountByTel(telCookie);
    			if(account != null && account.getPassword().equals(passwordCookie)) {
    				model.addAttribute("account", account);
    				return "redirect:/user/showUser";
    			}
    		}
    	}
		
		return "login";
	}
	
	/**
	 * 用户验证
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/validate")
	public String validate(@RequestParam("tel")String tel, @RequestParam("password")String password, HttpServletResponse response, Model model) {
		Account account = this.accountService.getAccountByTel(tel);
    	if(account != null) {
    		if(account.getPassword().equals(password)) {	
	    	    Cookie telCookie = new Cookie("loginTel", tel);  
	    	    Cookie passwordCookie = new Cookie("loginPassword", password);  
	    	    telCookie.setMaxAge(60 * 60);  
	    	    telCookie.setPath("/");  
	    	    passwordCookie.setMaxAge(60 * 60);  
	    	    passwordCookie.setPath("/");  
	    	    response.addCookie(telCookie);  
	    	    response.addCookie(passwordCookie); 
	    	    
	    	    model.addAttribute("Account", account);
	    		
	    		return "redirect:/index.jsp";
	    	}
    	}
    	
    	model.addAttribute("flag", 1);
    	return "login";	
	}
	
	/**
	 * 用户注册
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/register")
	public String register(String tel, String email, String password, Model model) {
		Account account = new Account();
		account.setTel(tel);
		account.setEmail(email);
		account.setPassword(password);
		
		accountService.insertAccount(account);
		
		return "register";
	}
	
	@RequestMapping("/checkTel")
	public int checkTel(String tel) {
		int flag = 0;
		if(accountService.getAccountByTel(tel) != null)
			flag = 1;
		return flag;
	}
	
	/**
	 * 用户注销
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
        //删除登录cookie  
        Cookie cookieUserName = new Cookie("loginTel", "");  
        Cookie cookiePassword = new Cookie("loginPassword", "");  
        cookieUserName.setMaxAge(0);  
        cookieUserName.setPath("/");  
        cookiePassword.setMaxAge(0);  
        cookiePassword.setPath("/");  
        response.addCookie(cookieUserName);  
        response.addCookie(cookiePassword);  
        
		return "redirect:/";
	}
}
