package cn.edu.cqu.yihao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Debit_card;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.Debit_cardService;

@Controller("/pay")
public class PayController {
	
	@Autowired
	private Debit_cardService dbcService;
	@Autowired
	private AccountService acService;
	@RequestMapping("/pay")
	public String chosePay(HttpServletRequest req, Model model) {
		String tel=(String)req.getParameter("tel");
		Account account=acService.getAccountByTel(tel);
		Double  price = Double.parseDouble((String)req.getParameter("price"));
		int need_point=new Double(price).intValue();
		int point=account.getPoint();
		
		String action = req.getParameter("submit");
		
		if(action.equals("积分支付")) {
			model.addAttribute("remain_point", point);
			model.addAttribute("need_point", need_point*10);
			return "point";
		}
		else {
			model.addAttribute("price",price);
			return "debit_card";
		}
		
		
	}
	
	
	@RequestMapping("/debit_card")
	public int debit_cardWay(HttpServletRequest req, Model model) {
		int resflag=0;
		Double  price = Double.parseDouble((String)req.getParameter("price"));
		String tel=(String)req.getParameter("tel");
		String card_id=(String)req.getParameter("card_id");
		int rows=dbcService.sub(card_id,price);
		if(rows==0)
			return resflag;
		else {
			int point=new Double(price).intValue();
			int r=acService.addPoint(tel, point);
			resflag=1;
			return resflag;
		}
	
	}
	@RequestMapping("/point")
	public int pointWay(HttpServletRequest req, Model model) {
		int resflag=0;
		String s=(String)req.getParameter("need_point");
		int need_point=Integer.parseInt(s);
		String tel=(String)req.getParameter("tel");
		int rows=acService.subPoint(tel, need_point);
		if(rows==0)
			return resflag;
		else {
			int r=acService.addPoint(tel, need_point/10);
			resflag=1;
			return resflag;
		}
	}
	

}
