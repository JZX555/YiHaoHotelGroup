package cn.edu.cqu.yihao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Vip;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.EmailService;
import cn.edu.cqu.yihao.service.VipService;

@Controller
@RequestMapping("/Personal")
public class PersonalController {
	
	@Autowired
	private AccountService acService;
	@Autowired
	private VipService vService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private VipService vipService;
	
	@RequestMapping("/goIndex")
	public String goIndex(HttpServletRequest request, Model model) {
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		if(tel.equals(""))
			return "redirect:/log/logout";
		
		Account account = this.acService.getAccountByTel(tel);
		int needPoint = 0;
		int maxPoint = account.getMaxpoint();
		int vip = account.getVipLevel() + 1;
		
		if(vip == 1)
			needPoint = 10000 - maxPoint;
		else if(vip == 2)
			needPoint = 30000 - maxPoint;
		else if(vip == 3)
			needPoint = 50000 - maxPoint;
		else if(vip == 4)
			needPoint = 100000 - maxPoint;
		
		model.addAttribute("availPoint", account.getPoint());
		model.addAttribute("maxPoint", maxPoint);
		model.addAttribute("needPoint", needPoint);
		
		return "PersonalCenter";
	}
	
	@RequestMapping("/gouserinfo")
	public String gouserinfo(HttpServletRequest request, Model model)
	{
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		if(tel.equals(""))
			return "redirect:/log/logout";
		
		Account account = this.acService.getAccountByTel(tel);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("tel", tel);
		model.addAttribute("email", account.getEmail());
		System.out.println(format.format(account.getBirthday()));
		model.addAttribute("birthday", format.format(account.getBirthday()));
		
		return "userinfo";
	}
	
	@RequestMapping("/goindents")
	public String goindents(HttpServletRequest request, Model model) {
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		if(tel.equals(""))
			return "redirect:/log/logout";
		
		model.addAttribute("tel", tel);
		return "myindent";
	}
	
	@RequestMapping("/govipcenter")
	public String govipcenter(HttpServletRequest request, Model model) {
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		if(tel.equals(""))
			return "redirect:/log/logout";
		
		Account account=acService.getAccountByTel(tel);
		int vip_level=account.getVipLevel();
		Vip vip=vService.getByLevel(vip_level);
		
		model.addAttribute("vip_level", vip_level);
		model.addAttribute("max_point", account.getMaxpoint());
		model.addAttribute("remain_point", account.getPoint());
		model.addAttribute("discount", vip.getDiscount());
		return "VipRights";
	}
	
	@RequestMapping("/gologout")
	public String gologout() {
		return "forward:/log/logout";
	}
	
	@RequestMapping("/gobook")
	public String gobook() {
		return "redirect:/";
	}
	
	@RequestMapping("/goactivity1")
	public String goactivity1() {
		return "activity1";
	}
	
	@RequestMapping("/goactivity2")
	public String goactivity2() {
		return "activity2";
	}

	@RequestMapping("/personal_inf")
	@ResponseBody
	public int personal_inf(HttpServletRequest request, Model model) {
		int flag=0;
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		String birthday=(String)request.getParameter("birthday");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date Birthday = null;
		try {
			Birthday = sdf1.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String email=(String)request.getParameter("email"); 
		Account account = new Account();
		account.setTel(tel);
		account.setEmail(email);
		account.setBirthday(Birthday);
		int r=acService.updateSelect(account);
		if(r==1) {
			flag=1;
		}
		return flag;
	}
	
	@RequestMapping("/goEmail")
	public String validateEmail(HttpServletRequest request, Model model) {
		System.out.println("goEmail");
		String email = request.getParameter("email");
		model.addAttribute("email", email);
		
		return "changecode";
	}
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		
		String code = this.emailService.getValCode(6);
		String msg = "您的验证码为：" + code;
		this.emailService.sendEmail(email, msg);
		
		return code;
	}
	
	@RequestMapping("/goChangePassword")
	public String goChangePassword(HttpServletRequest request, Model model) {	
		return "changecode2";
	}
	
	@RequestMapping("/changePassword")
	@ResponseBody
	public int changePassword(HttpServletRequest request, Model model) {
		int flag = 0;
		String tel = "";
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie:cookies) {
			if(cookie.getName().equals("loginTel")) {
				tel = cookie.getValue();
				break;
			}
		}
		
		Account account = new Account();
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		if(tel.equals(""))
			flag = -1;
		else {
			Account old = this.acService.getAccountByTel(tel);
			if(old.getPassword().equals(oldPassword)) {
				account.setTel(tel);
				account.setPassword(newPassword);
				
				flag = this.acService.updateSelect(account);
			}
			else
				flag = -1;
		}
		
		return flag;
	}
}
