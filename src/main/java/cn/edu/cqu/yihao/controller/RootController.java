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
	
	@RequestMapping("/checkin")
	@ResponseBody
	public List<Indent> checkin() {
		List<Indent> res = new ArrayList<Indent>();
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		
		Indent[] indents = this.indentService.getByTypeandStartDate(1, date);
		for(Indent indent:indents)
			res.add(indent);
		
		return res;
	}
	
	@RequestMapping("/checkout")
	@ResponseBody
	public List<Indent> checkout() {
		List<Indent> res = new ArrayList<Indent>();
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
		String date = ft.format(dNow);
		
		
		Indent[] indents = this.indentService.getByTypeandEndDate(1, date);
		for(Indent indent:indents)
			res.add(indent);
		
		return res;
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
        
        res.setRoom(room);
        res.setDate(curDate);
        
        if(indent != null) {
        	res.setHaveIndent(1);
        	res.setIndent(indent);
        }	
        
		return res;
	}
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
}
