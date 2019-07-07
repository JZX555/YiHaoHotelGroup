package cn.edu.cqu.yihao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.cqu.yihao.service.*;
import cn.edu.cqu.yihao.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private BookService bookservice;
	@Autowired
	private RoomService roomservice;
	@Autowired
	private AccountService accountservice;
	@Autowired
	private VipService vipservice;
	@Autowired
	private IndentService indentservice;
	@Autowired
	private AccountService acService;
	private static String lastIdentId;

	@RequestMapping("/query")
	public String query(HttpServletRequest request, HttpServletResponse response, Model model)
	{

		return "query";
	}

	@RequestMapping("/changepassword")
	public String change(HttpServletRequest request, Model model)
	{
		String oldpw = (String) request.getParameter("oldpw");// 获得输入的新旧密码
		String newpw = (String) request.getParameter("newpw");
		String tel = (String) request.getParameter("tel");
		int rows = acService.changePassword(tel, oldpw, newpw);// 修改密码

		return "forward:/";// 返回首页
	}

	// -------------------------------------------------------------------------------------
	// 用户选择入住和退房时间->用户点击预订
	@RequestMapping(value = "/date", method = RequestMethod.POST)
	public synchronized String getRoom(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ParseException
	{
		// 接收两个用户输入，入住时间和退房时间
		String checkInDate = request.getParameter("checkInDate");// 接收入住时间
		String checkOutDate = request.getParameter("checkOutDate"); // 接收退房时间
		// 判断入住日期是否小于等于退房日期，如果大于，返回初始页面并设置错误参数
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date utilCheckInDate = sdf.parse(checkInDate);
		java.util.Date utilCheckOutDate = sdf.parse(checkOutDate);
		if (utilCheckInDate.compareTo(utilCheckOutDate) > 0)
		{
			model.addAttribute("{errorInfo", "您填写的入住时间大于了退房时间。");
			return "forward:/error.jsp";
		} else
		{
			// 计算不同房型的可用房间数
			int resultLength1 = bookservice.getAvailRoomBetween(1, checkInDate, checkOutDate).length;
			int resultLength2 = bookservice.getAvailRoomBetween(2, checkInDate, checkOutDate).length;
			int resultLength3 = bookservice.getAvailRoomBetween(3, checkInDate, checkOutDate).length;
			int resultLength4 = bookservice.getAvailRoomBetween(4, checkInDate, checkOutDate).length;
			int resultLength5 = bookservice.getAvailRoomBetween(5, checkInDate, checkOutDate).length;
			// 返回各种类型的房间数量
			model.addAttribute("roomtype1", resultLength1);
			model.addAttribute("roomtype2", resultLength2);
			model.addAttribute("roomtype3", resultLength3);
			model.addAttribute("roomtype4", resultLength4);
			model.addAttribute("roomtype5", resultLength5);
			model.addAttribute("checkInDate", checkInDate);
			model.addAttribute("checkOutDate", checkOutDate);
			// 返回到一个选择房型的页面
			return "roomtype";
		}
	}

	// 用户选择入住和退房时间->用户点击预订->用户选择房型->用户点击预订->用户选择订房策略->用户点击预订->用户填写个人信息->用户点击确定
	@RequestMapping(value = "/ready", method = RequestMethod.POST)
	public synchronized String PayByDebitCard(HttpServletRequest request, HttpServletResponse response, Model model,
			@CookieValue("loginTel") String tel) throws ParseException
	{
		// 接收七个用户输入，入住时间(checkInDate)和退房时间(checkOutDate)，房型(roomType)，订房策略(strategyType)，住户姓名(customerName)，住户身份证号(customerId)，账户电话号码(tel)
		String checkInDate = (String) request.getParameter("checkInDate");// 接收入住时间
		String checkOutDate = (String) request.getParameter("checkOutDate");// 接收退房时间
		int roomType = Integer.parseInt((String) request.getParameter("roomType"));// 接收房型
		int strategyType = Integer.parseInt((String) request.getParameter("strategyType"));// 接收订房策略
		String customerName = (String) request.getParameter("customerName");// 接收住户姓名
		String customerId = (String) request.getParameter("customerId");// 接收住户身份证号
		// String tel = (String) request.getParameter("tel");// 接收账户电话号码
		Result result = new Result();
		result = Work(checkInDate, checkOutDate, roomType, strategyType, customerName, customerId, tel);
		if (result.flag == 0)
		{
			model.addAttribute("{errorInfo", "信息过期，该房型已不可用。");
			return "forward:/error.jsp";
		} else
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilCheckInDate = sdf.parse(checkInDate);
			java.sql.Date sqlCheckInDate = new java.sql.Date(utilCheckInDate.getTime());
			java.util.Date utilCheckOutDate = sdf.parse(checkOutDate);
			java.sql.Date sqlCheckOutDate = new java.sql.Date(utilCheckOutDate.getTime());
			int flag = 1;
			Indent indents[] = indentservice.getByCustomerId(customerId);
			for (Indent temp : indents)
			{
				java.sql.Date sqlStartDate = new java.sql.Date(temp.getStartTime().getTime());
				java.sql.Date sqlEndDate = new java.sql.Date(temp.getEndTime().getTime());
				if (sqlCheckInDate.compareTo(sqlEndDate) > 0 || sqlCheckOutDate.compareTo(sqlStartDate) < 0)
				{
					continue;
				} else
				{
					flag = 0;
					break;
				}
			}
			if (flag == 1)
			{
				model.addAttribute("result", result);
				System.out.println("indentId" + result.currentIndentId + "checkInDatecost" + result.checkInDate
						+ "checkOutDatecost" + result.checkOutDate + "roomType" + result.roomType + "customerName"
						+ result.customerName + "customerId" + result.customerId + "price" + result.price + "vipLevel"
						+ result.vipLevel + "discount" + result.discount + "cost" + result.cost);
				System.out.println("返回到支付界面");
				// 返回到支付界面
				return "/payment";
			} else
			{
				model.addAttribute("errorInf", "该身份证不能预订。原因：在所选时间段内已有该身份证的预订。");
				return "forward:/error.jsp";
			}
		}
	}

	public int toPrice(int type)
	{
		switch (type)
		{
		case 0:
			return (0);
		case 1:
			return (100);
		case 2:
			return (198);
		default:
			return (0);
		}
	}

	public synchronized Result Work(String checkInDate, String checkOutDate, int roomType, int strategyType,
			String customerName, String customerId, String tel) throws ParseException
	{
		// 计算该房型是否有剩余的房间
		int roomFlag = bookservice.getAvailRoomBetween(roomType, checkInDate, checkOutDate).length;
		if (roomFlag == 0)
		{
			// 返回提示预订失败的页面（原因是该房型可用预订数为零）
			Result result = new Result();
			result.flag = 0;
			return result;
		} else
		{
			// 计算原价
			System.out.println("checkInDate" + checkInDate + "  checkOutDate" + checkOutDate + "  roomType" + roomType
					+ "  strategyType" + strategyType + "  customerName" + customerName + "  customerId" + customerId
					+ "  tel" + tel);
			int perPrice = roomservice.getPriceByType(roomType) + toPrice(strategyType);
			System.out.println("price=" + perPrice);
			// 随机选择一个该房型下的可用房间的room_id(即选择该房间)
			String Room[] = bookservice.getAvailRoomBetween(roomType, checkInDate, checkOutDate);
			Random random = new Random();
			int subscript = random.nextInt(Room.length);
			String currentRoomId = Room[subscript];
			// 在book表中加入相关记录（即锁下该房间）
			int dateCount = 0;
			Book book = new Book();
			book.setTel(tel);
			book.setRoomId(currentRoomId);
			book.setIsBooked(1);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = sdf1.parse(checkInDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			book.setBookdate(sqlDate);
			int bookRow = bookservice.addBook(book);
			dateCount++;
			Calendar cld = Calendar.getInstance();
			cld.setTime(utilDate);
			cld.add(Calendar.DATE, 1);
			utilDate = cld.getTime();
			while (!sqlDate.toString().equals(checkOutDate))
			{
				sqlDate = new java.sql.Date(utilDate.getTime());
				book.setBookdate(sqlDate);
				bookRow = bookservice.addBook(book);
				dateCount++;
				cld.setTime(utilDate);
				cld.add(Calendar.DATE, 1);
				utilDate = cld.getTime();
			}
			System.out.println("book插入完成");
			// 创建订单
			Indent indent = new Indent();
			// 生成并设置indent_id
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
			String strDate = sdf2.format(new Date()).toString();
			String tail = String.valueOf(100 + random.nextInt(900));
			String currentIndentId = strDate.concat(tail);
			while (currentIndentId.equals(lastIdentId))
			{
				strDate = sdf2.format(new Date()).toString();
				tail = String.valueOf(100 + random.nextInt(900));
				currentIndentId = strDate.concat(tail);
			}
			lastIdentId = currentIndentId;
			indent.setIndentId(currentIndentId);
			// 设置tel,start_time,end_time,room_id,indent_type,customer_id,pay_type
			indent.setTel(tel);
			java.util.Date utilStartDate = sdf1.parse(checkInDate);
			java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
			indent.setStartTime(sqlStartDate);
			java.util.Date utilEndDate = sdf1.parse(checkOutDate);
			java.sql.Date sqlEndDate = new java.sql.Date(utilEndDate.getTime());
			indent.setEndTime(sqlEndDate);
			indent.setRoomId(currentRoomId);
			indent.setIndentType(0);
			indent.setCustomerId(customerId);
			indent.setPayType(0);
			indent.setPayType(0);
			// 通过price计算并设置cost
			Account currentAccount = accountservice.getAccountByTel(tel);
			int vipLevel = currentAccount.getVipLevel();// 获取VIP等级
			Vip currentVip = vipservice.getByLevel(vipLevel);
			float discount = currentVip.getDiscount();// 获取该等级对应的折扣
			double cost = perPrice * dateCount * discount;
			indent.setCost(cost);
			// 此时记录的所有属性都设置完毕，可以插入indent表中
			int indentRow = indentservice.addIndent(indent);
			System.out.println("indentId:" + indent.getIndentId() + "tel:" + indent.getTel() + "startTime:"
					+ indent.getStartTime() + "endTime:" + indent.getEndTime() + "roomId:" + indent.getRoomId()
					+ "indentType:" + indent.getIndentType() + "customerId:" + indent.getCustomerId() + "tel:"
					+ indent.getTel() + "payType:" + indent.getPayType());
			Result result = new Result();
			result.currentIndentId = currentIndentId;// 传回订单号
			result.checkInDate = checkInDate;// 传回入住时间
			result.checkOutDate = checkOutDate;// 传回退房时间
			result.roomType = roomType;// 传回房间类型
			result.customerName = customerName;// 传回住户姓名
			result.customerId = customerId;// 传回身份证号
			result.price = perPrice * dateCount;// 传回原价
			result.vipLevel = vipLevel;// 传回VIP等级
			result.discount = discount;// 传回折扣
			result.cost = cost;// 传回折后价
			return result;
		}

	}
}
