package cn.edu.cqu.yihao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.edu.cqu.yihao.service.*;
import cn.edu.cqu.yihao.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private BookService bookservice; 

	@RequestMapping("/query")
	public String query(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "query";
	}
	
	//-------------------------------------------------------------------------------------
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	public String getRoom(HttpServletRequest request, HttpServletResponse response, Model model)//用户选择入住和退房时间->用户点击预订
	{
		//接收两个用户输入，入住时间和退房时间
		String checkInDate = request.getParameter("checkInDate");//接收入住时间
		String checkOutDate = request.getParameter("checkOutDate");	//接收退房时间
		//计算不同房型的可用房间数
		int resultLength1=bookservice.getAvailRoomBetween(1, checkInDate, checkOutDate).length;
		int resultLength2=bookservice.getAvailRoomBetween(2, checkInDate, checkOutDate).length;
		int resultLength3=bookservice.getAvailRoomBetween(3, checkInDate, checkOutDate).length;
		int resultLength4=bookservice.getAvailRoomBetween(4, checkInDate, checkOutDate).length;
		int resultLength5=bookservice.getAvailRoomBetween(5, checkInDate, checkOutDate).length;
		//返回各种类型的房间数量
		model.addAttribute("roomtype1", resultLength1);
		model.addAttribute("roomtype2", resultLength2);
		model.addAttribute("roomtype3", resultLength3);
		model.addAttribute("roomtype4", resultLength4);
		model.addAttribute("roomtype5", resultLength5);	
		//返回到一个选择房型的页面
		return "选择房型的页面";
	}
	@RequestMapping(value = "/everythingisready", method = RequestMethod.POST)//用户选择入住和退房时间->用户点击预订->用户选择房型->用户点击预订->用户选择订房策略->用户点击预订
	public String readyBook(HttpServletRequest request, HttpServletResponse response, Model model)
	{
		//接收四个用户输入，入住时间(checkInDate)和退房时间(checkOutDate)，房型(roomType)，订房策略(strategyType1-3)
		String checkInDate = request.getParameter("checkInDate");//接收入住时间
		String checkOutDate = request.getParameter("checkOutDate");//接收退房时间
		String roomType=request.getParameter("roomType");//接收房型
		int strategyType=Integer.parseInt(request.getParameter("strategyType"));//接收订房策略
		//计算该房型是否有剩余的房间
		int roomFlag=bookservice.getAvailRoomBetween(Integer.parseInt(roomType), checkInDate, checkOutDate).length;
		if(roomFlag==0)
		{
			//返回提示预订失败的页面（原因是该房型可用预订数为零）
			return "fail";
		}
		else
		{
			int price=bookservice.getPriceByType(roomType)+toPrice(strategyType);
			//返回待支付金额
			model.addAttribute("price",price);
			//生成订单id
			int indentId;
			//返回到支付界面
			return "/pay/choose";
		}
	}
	public int toPrice(int type)
	{
		switch(type)
		{
			case 1:
				return (0);
			case 2:
				return (100);
			case 3:
				return (198);
			default:
				return (0);
		}				
	}
}
