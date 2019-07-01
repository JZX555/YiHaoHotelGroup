package cn.edu.cqu.yihao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Debit_card;
import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.Debit_cardService;
import cn.edu.cqu.yihao.service.IndentService;

@Controller("/pay")
public class PayController {
	
	@Autowired
	private Debit_cardService dbcService;
	@Autowired
	private AccountService acService;
	@Autowired
	private IndentService inService;
	
	@RequestMapping("/choose")
	public String choosePay(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {
		Account account=acService.getAccountByTel(tel);
		Double  price = Double.parseDouble((String)req.getParameter("price"));//获得价格
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
	public int debit_cardWay(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {
		int resflag=0;
		Double  price = Double.parseDouble((String)req.getParameter("price"));//需要支付的价格
		String indent_id=(String)req.getParameter("indent_id");
		Indent indent= new Indent();
		indent.setIndentId(indent_id);		
		Account account=acService.getAccountByTel(tel);
		
		String card_id=(String)req.getParameter("card_id");
		int rows=dbcService.sub(card_id,price); //信用卡减钱
		if(rows==0) { //支付失败
			indent.setIndentType(0);
			inService.updateSelect(indent);
			return resflag;}
		else {  //支付成功
			indent.setIndentType(1);//更新支付状态
			inService.updateSelect(indent);
			
			int point=new Double(price).intValue();
			int r=acService.addPoint(tel, point); //增加积分
			int curpoint=account.getMaxpoint();  //更新会员等级
			if(curpoint<10000)
				acService.setVipLevel(tel,0);
			else if(curpoint>=10000 && curpoint<30000)
				acService.setVipLevel(tel,1);
			else if(curpoint>=30000 && curpoint<100000)
				acService.setVipLevel(tel,2);
			else
				acService.setVipLevel(tel,3);
			resflag=1;
			return resflag;
		}
	
	}
	@RequestMapping("/point")
	public int pointWay(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {
		int resflag=0;
		String s=(String)req.getParameter("need_point"); //need_point是十倍的price
		int need_point=Integer.parseInt(s);
		Account account=acService.getAccountByTel(tel);
		String indent_id=(String)req.getParameter("indent_id");
		Indent indent= new Indent();
		indent.setIndentId(indent_id);
		
		int rows=acService.subPoint(tel, need_point); //减积分
		if(rows==0) {//支付失败
			indent.setIndentType(0);
			inService.updateSelect(indent);
			return resflag;}
		else {
			indent.setIndentType(1);  //更新支付状态
			inService.updateSelect(indent);
			int r=acService.addPoint(tel, need_point/10);
			int curpoint=account.getMaxpoint();  //修改会员等级
			if(curpoint<10000)
				acService.setVipLevel(tel,0);
			else if(curpoint>=10000 && curpoint<30000)
				acService.setVipLevel(tel,1);
			else if(curpoint>=30000 && curpoint<100000)
				acService.setVipLevel(tel,2);
			else
				acService.setVipLevel(tel,3);
			resflag=1;
			return resflag;
		}
	}
	

}

