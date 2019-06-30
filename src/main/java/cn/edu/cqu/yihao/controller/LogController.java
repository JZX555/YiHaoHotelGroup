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
		Account a = this.accountService.getAccountByTel(tel);
    	if(a != null) {
    		if(a.getPassword().equals(password)) {	
	    	    Cookie telCookie = new Cookie("loginTel", tel);  
	    	    Cookie passwordCookie = new Cookie("loginPassword", password);  
	    	    telCookie.setMaxAge(60 * 60);  
	    	    telCookie.setPath("/");  
	    	    passwordCookie.setMaxAge(60 * 60);  
	    	    passwordCookie.setPath("/");  
	    	    response.addCookie(telCookie);  
	    	    response.addCookie(passwordCookie); 
	    	    
	    	    model.addAttribute("Account", a);
	    		
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
	public String register(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "register";
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
        Cookie cookieUserName = new Cookie("loginUserName", "");  
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
