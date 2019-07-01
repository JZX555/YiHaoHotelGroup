package cn.edu.cqu.yihao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.pojo.Room;
import cn.edu.cqu.yihao.pojo.RoomWithIndent;
import cn.edu.cqu.yihao.service.BookService;
import cn.edu.cqu.yihao.service.IndentService;
import cn.edu.cqu.yihao.service.RoomService;

@Controller
@RequestMapping("/root")
public class RootController {
	@Autowired
	private BookService bookService = null;
	
	@Autowired
	private IndentService indentService = null;
	
	@Autowired
	private RoomService roomService = null;
	
	@RequestMapping("/index")
	public String index(Model model) {
		int isCheckIn = 0;
		int needCheckOut = 0;
		int isBooked = 0;
		
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		isCheckIn = this.indentService.getByTypeandStartDate(2, date).length;
		needCheckOut = this.indentService.getByTypeandEndDate(2, date).length;
		for(int i = 0; i < 5; ++i) {
			isBooked += this.bookService.getByTypeandDate(i, date).length;
		}
		
		model.addAttribute("isCheckIn", isCheckIn);
		model.addAttribute("needCheckOut", needCheckOut);
		model.addAttribute("isBooked", isBooked);
		
		return "root";
	}
	
	@RequestMapping("/checkinList")
	@ResponseBody
	public List<Indent> checkinList() {
		List<Indent> res = new ArrayList<Indent>();
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		
		Indent[] indents = this.indentService.getByTypeandStartDate(1, date);
		for(Indent indent:indents)
			res.add(indent);
		
		return res;
	}
	
	@RequestMapping("/checkoutList")
	@ResponseBody
	public List<Indent> checkoutList() {
		List<Indent> res = new ArrayList<Indent>();
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		
		Indent[] indents = this.indentService.getByTypeandEndDate(1, date);
		for(Indent indent:indents)
			res.add(indent);
		
		return res;
	}
	
	@RequestMapping("/checkin")
	@ResponseBody
	public int checkin(HttpServletRequest request, HttpServletResponse response, Model model) {
		Indent indent = null;
		String indentID = request.getParameter("indentID");
		
		indent = this.indentService.getById(indentID);
		if(indent == null)
			return 0;
		
		if(indent.getIndentType() != 2)
			return 0;
		
		indent.setIndentType(3);
		this.indentService.updateSelect(indent);
		
		return 1;
	}
	
	@RequestMapping("/checkout")
	@ResponseBody
	public int checkout(HttpServletRequest request, HttpServletResponse response, Model model) {
		Indent indent = null;
		String indentID = request.getParameter("indentID");
		
		indent = this.indentService.getById(indentID);
		if(indent == null)
			return 0;
		
		if(indent.getIndentType() != 1)
			return 0;
		
		indent.setIndentType(2);
		this.indentService.updateSelect(indent);
		
		return 1;
	}
	
	@RequestMapping("/checkRoom")
	@ResponseBody
	public List<RoomWithIndent> checkRoom(HttpServletRequest request, HttpServletResponse response, Model model) {
		List<RoomWithIndent> res = new ArrayList<RoomWithIndent>();
		
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String roomID = request.getParameter("roomID");
		Room room = this.roomService.getById(roomID);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date begin = dateFormat.parse(beginDate);
			Date end = dateFormat.parse(endDate);
			
			Calendar tempStart = Calendar.getInstance();
			Calendar tempEnd = Calendar.getInstance();
			tempStart.setTime(begin);
			tempEnd.setTime(end);
			tempEnd.add(Calendar.DATE, +1);
			
			while (tempStart.before(tempEnd)) {
				RoomWithIndent rwi = new RoomWithIndent();
				String curDate = dateFormat.format(tempStart.getTime());
				
                Indent indent = this.indentService.getByRoomandOneDate(roomID, curDate);
				
                rwi.setRoom(room);
                rwi.setDate(curDate);
                
                if(indent != null) {
                	rwi.setHaveIndent(1);
                	rwi.setIndent(indent);
                }
				
                res.add(rwi);
                
                tempStart.add(Calendar.DAY_OF_YEAR, 1);
            }

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	@RequestMapping("/modifyRoomPrice")
	@ResponseBody
	public RoomWithIndent modifyRoomPrice(HttpServletRequest request, HttpServletResponse response, Model model) {
		RoomWithIndent res = null;
		
		String curDate = request.getParameter("curDate");
		String roomID = request.getParameter("roomID");
		int newPrice = Integer.parseInt(request.getParameter("newPrice"));
		
		Room room = this.roomService.getById(roomID);
        Indent indent = this.indentService.getByRoomandOneDate(roomID, curDate);
		
        room.setPrice(newPrice);
        
        this.roomService.updateSelect(room);
        
        res.setRoom(room);
        res.setDate(curDate);
        
        if(indent != null) {
        	res.setHaveIndent(1);
        	res.setIndent(indent);
        }	
        
		return res;
	}
	
	@RequestMapping("/modifyRoomState")
	@ResponseBody
	public RoomWithIndent modifyRoomState(HttpServletRequest request, HttpServletResponse response, Model model) {
		RoomWithIndent res = null;
		
		String curDate = request.getParameter("curDate");
		String roomID = request.getParameter("roomID");
		
		Room room = this.roomService.getById(roomID);
        Indent indent = this.indentService.getByRoomandOneDate(roomID, curDate);
        
        Book book = new Book();
        try {
        	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			book.setBookdate(dateFormat.parse(curDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
        book.setRoomId(roomID);
        book.setTel("123456789");
        book.setIsBooked(1);
        
        this.bookService.addBook(book);
        
        res.setRoom(room);
        res.setDate(curDate);
        
        if(indent != null) {
        	res.setHaveIndent(1);
        	res.setIndent(indent);
        }	
        
		return res;
	}
	
	@RequestMapping("/checkIndent")
	@ResponseBody
	public Indent checkIndent(HttpServletRequest request, HttpServletResponse response, Model model) {
		Indent res = null;
		String id = request.getParameter("indentID");
		
		res = this.indentService.getById(id);
		
		return res;
	}
	
	@RequestMapping("/bookRoom")
	@ResponseBody
	public Map<String, String> bookRoom(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map res = new HashMap<String, String>();
		
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String customerId = request.getParameter("customerId");
		int roomType = Integer.parseInt(request.getParameter("roomType"));
		
		String[] rooms = this.bookService.getAvailRoomBetween(roomType, beginDate, endDate);
		
		
		if(rooms.length == 0) {
			res.put("isSuccess", "0");
		}
		else {		
			Indent indent = new Indent();
			Book book = new Book();
			Random random = new Random();
			
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
	        String dateID = sdf.format(new Date()).toString();
	        String tailID = String.valueOf(100+random.nextInt(900));
			String indentId = dateID.concat(tailID);
			
			indent.setTel("123456789");
			indent.setCustomerId(customerId);
			indent.setIndentId(indentId);
			indent.setRoomId(rooms[0]);
			indent.setCost(Double.valueOf(this.roomService.getById(rooms[0]).getPrice()));
			indent.setIndentType(1);
			
			book.setRoomId(rooms[0]);
			book.setIsBooked(1);
			book.setTel("123456789");
			try {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				indent.setStartTime(dateFormat.parse(beginDate));
				indent.setEndTime(dateFormat.parse(endDate));
				book.setBookdate(dateFormat.parse(beginDate));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			this.bookService.addBook(book);
			
			res.put("isSuccess", "1");
			res.put("roomID", rooms[0]);
		}
		
		return res;
	}
	
	@RequestMapping("getBill")
	@ResponseBody
	public Map<String, Integer> getBill(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String, Integer> res = new HashMap<String, Integer>();
		
		
		
		return res;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
}
