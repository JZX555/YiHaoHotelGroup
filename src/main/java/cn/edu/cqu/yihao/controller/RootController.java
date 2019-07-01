package cn.edu.cqu.yihao.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.service.BookService;
import cn.edu.cqu.yihao.service.IndentService;

@Controller
@RequestMapping("/root")
public class RootController {
	@Autowired
	private BookService bookService = null;
	
	@Autowired
	private IndentService indentService = null;
	
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
	
	
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
}
