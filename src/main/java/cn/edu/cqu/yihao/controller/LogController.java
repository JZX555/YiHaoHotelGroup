package cn.edu.cqu.yihao.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/log")
public class LogController {
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
	public String validate(HttpServletRequest request,Model model) {
		
		return "redirect:/";
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
		
		return "redirect:/";
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
