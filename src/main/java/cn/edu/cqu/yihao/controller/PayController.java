package cn.edu.cqu.yihao.controller;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Debit_card;
import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.pojo.Vip;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.Debit_cardService;
import cn.edu.cqu.yihao.service.IndentService;
import cn.edu.cqu.yihao.service.VipService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private Debit_cardService dbcService;
	@Autowired
	private AccountService acService;
	@Autowired
	private IndentService inService;
	@Autowired
	private VipService vService;
	
	
	@RequestMapping("/choose")
	public String choosePay(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {	
		String res="";
		String action = req.getParameter("submit"); 
		String indent_id=(String)req.getParameter("indent_id");  //需要传给我indent_id,price,cost
		Double  price = Double.parseDouble((String)req.getParameter("price"));
		System.out.println("获得price"+price);
		Double  cost = Double.parseDouble((String)req.getParameter("cost"));//需要支付的价格
		System.out.println("获得cost"+cost);
		if(action.equals("积分支付")) { 
			
			
			Account account=acService.getAccountByTel(tel);
			int  need_point = cost.intValue();//需要的积分是折扣价的十倍
			System.out.println("获得cost"+need_point);
			int point=account.getPoint();   //剩余积分
			model.addAttribute("remain_point", point); //传给下一个页面remain_point，need_point，indent_id,price
			model.addAttribute("need_point", need_point*10);
			model.addAttribute("indent_id", indent_id); 
			model.addAttribute("price", price); 
			res="pointpayment";
		}
		if(action.equals("银行卡支付")){  //需要传给下一个页面cost，price，indent_id
			model.addAttribute("cost",cost);
			model.addAttribute("price", price);
			model.addAttribute("indent_id", indent_id);
			res="cardpayment";
		}	
		return res;
	}
	
	public double double2(String s) {
		DecimalFormat df = new DecimalFormat("#.00");
		Double  tmp = Double.parseDouble(s);
		Double  res = Double.parseDouble(df.format(tmp));
		return res;
	}
	@RequestMapping("/debit_card")
	public int debit_cardWay(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {
		int resflag=0;
		
		//Double  dcost = Double.parseDouble((String)req.getParameter("cost"));//需要支付的价格
		Double  cost = double2((String)req.getParameter("cost"));

		//Double  dprice = Double.parseDouble((String)req.getParameter("price"));//获得原价
		Double  price = double2((String)req.getParameter("price"));
		
		String indent_id=(String)req.getParameter("indent_id");//需要订单号
		Indent indent= new Indent();
		indent.setIndentId(indent_id);		
		Account account=acService.getAccountByTel(tel);
		
		String card_id=(String)req.getParameter("card_id"); //需要卡号
		int rows=dbcService.sub(card_id,cost); //信用卡减钱
		if(rows==0) { //支付失败
			indent.setIndentType(0);
			inService.updateSelect(indent);
			return resflag;}
		else {  //支付成功
			indent.setIndentType(1);//更新支付状态
			indent.setPayType(1); //更新支付方式
			inService.updateSelect(indent);
			
			int point=new Double(price).intValue();
			int r=acService.addPoint(tel, point); //增加maxpoint
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
	public int pointWay(HttpServletRequest req,@CookieValue("loginTel") String tel) {
		int resflag=0;
		
		String s=(String)req.getParameter("need_point"); 	
		//double dneed_point=Double.parseDouble(s);//need_point是十倍的cost
		//int need_point=(int)dneed_point;
		int need_point=Integer.parseInt(s.trim());
		System.out.println("获得need_point22 "+need_point);
		//double dprice = Double.parseDouble( (String)req.getParameter("price") ); //获得原价
		//int price=(int)dprice;
		String s1=(String)req.getParameter("price"); 
		System.out.println("获得s1 "+s1);
		double dprice = Double.valueOf(s1); //获得原价
		System.out.println("获得price22 "+dprice);
		int price=(int)dprice;
		System.out.println("获得price33 "+price);
		Account account=acService.getAccountByTel(tel);
		String indent_id=(String)req.getParameter("indent_id");
		Indent indent= new Indent();
		indent.setIndentId(indent_id);
		
		int rows=acService.subPoint(tel, need_point); //减积分
		if(rows==0) {//支付失败
			indent.setIndentType(0);
			inService.updateSelect(indent);
			}
		else {
			indent.setIndentType(1);  //更新支付状态
			indent.setPayType(2);//更新支付方式
			inService.updateSelect(indent);
			int r=acService.addPoint(tel, price); //增加maxpoint
			int curpoint=account.getMaxpoint();  //修改会员等级
			changeViplevel(curpoint,tel);
			resflag=1;
			
		}
		return resflag;
	}
	public void changeViplevel(int curpoint,String tel) {
		if(curpoint<10000)
			acService.setVipLevel(tel,0);
		else if(curpoint>=10000 && curpoint<30000)
			acService.setVipLevel(tel,1);
		else if(curpoint>=30000 && curpoint<100000)
			acService.setVipLevel(tel,2);
		else
			acService.setVipLevel(tel,3);
	}
	@RequestMapping("/refund")
	public String refund( @RequestParam("pay_type")Integer pay_type) {
		String res="";
		
		if(pay_type==1) {
			res= "forward:/refunnbyDB";
		}
		else if(pay_type==2) {
			res="forward:/refunnbyP";
		}
		return res;
	}
	@RequestMapping("/refunnbyDB")
	public int  refunnbyDB(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {
		int flag=0;
		String card_id=(String)req.getParameter("card_id"); 
		//String password=(String)req.getParameter("password");
		Double  cost =double2((String)req.getParameter("cost")); //获得花费价格
	
		String indent_id=(String)req.getParameter("indent_id");
		
		Account account=acService.getAccountByTel(tel); //求原价
		int vip_level=account.getVipLevel();
		Vip vip=vService.getByLevel(vip_level);
		double discount=vip.getDiscount();
		double dprice=(double)cost/discount;
		
		int price=(int)dprice;
		
		
		Debit_card db_card=dbcService.getByID(card_id);
		Indent indent= new Indent();
		indent.setIndentId(indent_id);

		
		if(db_card != null) {
			dbcService.add(card_id, cost);//卡上余额增加
			indent.setIndentType(5);//更改订单状态
			inService.updateSelect(indent);
			int r=acService.addPoint(tel, -price);//修改积分
			int curpoint=account.getMaxpoint();  //修改会员等级
			changeViplevel(curpoint,tel);
			flag=1;
		}
		return flag;
	}
	
	@RequestMapping("/refunnbyP")
	
	public int  refunnbyP(HttpServletRequest req, Model model,@CookieValue("loginTel") String tel) {//减去原价对应的积分，加上折扣价对应的积分
		int flag=0;
		Double  dcost = Double.parseDouble((String)req.getParameter("cost"));
		int cost=dcost.intValue();
		//int  price = Integer.parseInt((String)req.getParameter("price"));
		String indent_id=(String)req.getParameter("indent_id");
		Account account=acService.getAccountByTel(tel);
		int vip_level=account.getVipLevel();
		Vip vip=vService.getByLevel(vip_level);
		double discount=vip.getDiscount();
		double dprice=(double)cost/discount;
		int price=(int)dprice;
		Indent indent= new Indent();
		indent.setIndentId(indent_id);
		indent.setIndentType(5);// 更改订单状态
		inService.updateSelect(indent);
		
		int r1 = acService.addPoint(tel, -price);// 减积分
		int r2 = acService.subPoint(tel, -cost * 10);// 加积分
		
		
		int curpoint = account.getMaxpoint(); // 修改会员等级
		changeViplevel(curpoint, tel);
		
		if(r1==1 && r2==1)
			flag=1;
		return flag;  
	}

}

