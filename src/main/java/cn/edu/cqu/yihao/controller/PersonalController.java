package cn.edu.cqu.yihao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Vip;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.VipService;

@Controller("/Personal")
public class PersonalController {
	
	@Autowired
	private AccountService acService;
	@Autowired
	private VipService vService;
	
	@RequestMapping("/functionchose")
	public String functionchose(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel)
	{
		Account account=acService.getAccountByTel(tel);
		int vip_level=account.getVipLevel();
		Vip vip=vService.getByLevel(vip_level);
		
		String res="";
		String action = req.getParameter("submit"); 
		if(action.equals("个人信息")) {
			model.addAttribute("tel", tel);
			res="/personal_inf";
		}
		if(action.equals("我的订单")) {
			res="/indents/show_indents1";
		}
		if(action.equals("会员中心")) {
			model.addAttribute("vip_level", vip_level);
			model.addAttribute("max_point", account.getMaxpoint());
			model.addAttribute("remain_point", account.getPoint());
			model.addAttribute("discount", vip.getDiscount());
			res="/VIPcenter";
		}
		if(action.equals("注销")) {
			res="forward:/log/logout";
		}
		if(action.equals("预订"))
			res="redirect:/";
		if(action.equals("活动一"))
			res="activity1";
		if(action.equals("活动二"))
			res="activity2";
		return res;
	}
	
	@RequestMapping("/personal_inf")
	public int personal_inf(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel)
	{
		int flag=0;
		String birthday=(String)req.getParameter("birthday");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date Birthday = null;
		try {
			Birthday = sdf1.parse(birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String email=(String)req.getParameter("email"); 
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
	
	
}