package cn.edu.cqu.yihao.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.PageData;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.pojo.IndentWithPost;
import cn.edu.cqu.yihao.pojo.Post;
import cn.edu.cqu.yihao.pojo.BookKey;
import cn.edu.cqu.yihao.service.AccountService;
import cn.edu.cqu.yihao.service.BookService;
import cn.edu.cqu.yihao.service.IndentService;
import cn.edu.cqu.yihao.service.PostService;

@Controller
@RequestMapping("/indents")
public class IndentController {
	
	@Autowired
	private PostService pService;
	@Autowired
	private IndentService inService;
	@Autowired
	private AccountService acService;
	@Autowired
	private BookService bookservice;
	
	@RequestMapping("/show_indents1")  
	@ResponseBody
	public List<IndentWithPost> show_indents1(HttpServletRequest request,Model model,@CookieValue("loginTel") String tel) {//我的订单 页面
		Account account = acService.getAccountByTel(tel);  //显示已付款订单
		Indent[] paid_indents = inService.getByTypeandTel(1, tel);
		Indent[] checkin_indents =inService.getByTypeandTel(2, tel);
		List<IndentWithPost> default_indents = new ArrayList<>();
		for(int i =0;i<paid_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(paid_indents[i]);
			String indent_id=paid_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		for(int i =0;i<checkin_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(checkin_indents[i]);
			String indent_id=checkin_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		
		return default_indents;	
	}
	@RequestMapping("/show_indents2")  
	@ResponseBody
	public List<IndentWithPost> show_indents2(HttpServletRequest request,Model model,@CookieValue("loginTel") String tel) {//我的订单 页面
		Account account = acService.getAccountByTel(tel);  //显示已完成订单
		Indent[] finished_indents = inService.getByTypeandTel(3, tel);
		List<IndentWithPost> default_indents = new ArrayList<>();
		for(int i =0;i<finished_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(finished_indents[i]);
			String indent_id=finished_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		return default_indents;	
	}
	@RequestMapping("/show_indents3")  
	@ResponseBody
	public List<IndentWithPost> show_indents3(HttpServletRequest request,Model model,@CookieValue("loginTel") String tel) {//我的订单 页面
		Account account = acService.getAccountByTel(tel);  //显示未付款订单
		Indent[] notpay_indents = inService.getByTypeandTel(0, tel);
		List<IndentWithPost> default_indents = new ArrayList<>();

		for(int i =0;i<notpay_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(notpay_indents[i]);
			String indent_id=notpay_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		return default_indents;	
	}
	@RequestMapping("/show_indents4")  
	@ResponseBody
	public List<IndentWithPost> show_indents4(HttpServletRequest request,Model model,@CookieValue("loginTel") String tel) {//我的订单 页面
		Account account = acService.getAccountByTel(tel);  //显示已完成和已退款订单
		Indent[] fail_indents = inService.getByTypeandTel(4, tel);
		Indent[] refund_indents =inService.getByTypeandTel(5, tel);
		List<IndentWithPost> default_indents = new ArrayList<>();
		for(int i =0;i<fail_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(fail_indents[i]);
			String indent_id=fail_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		for(int i =0;i<refund_indents.length;i++ ) {
			IndentWithPost iwp=new IndentWithPost();
			iwp.setIndent(refund_indents[i]);
			String indent_id=refund_indents[i].getIndentId();
			Post post=pService.getById(indent_id);
			if(post!=null) {
				iwp.setPost(post);
				iwp.setHavePost(1);
			}
			
			default_indents.add(iwp);
		}
		return default_indents;	
	}
	
	@RequestMapping(value="/addComment",method=RequestMethod.GET)
	public String addCommentj(HttpServletRequest request, Model model) {
		model.addAttribute("indent_id",(String)request.getParameter("indent_id"));
		return "addComment";
	}
	

	@RequestMapping(value="/addComment",method=RequestMethod.POST)//添加评价
	
	public String addComment(HttpServletRequest request, Model model) {
		String result = null;
		String indent_id=(String)request.getParameter("indent_id");//需要传给我indent_id,score,comment
		Double score=Double.parseDouble((String)request.getParameter("score"));
		String comment=(String)request.getParameter("comment");
		int res=pService.addPost(indent_id, score, comment);//更新该条订单对应的Post结构
		if(res==1)
			result = "forward:/Personal/goindents";
		
//		Indent indent=inService.getById(indent_id); 
//		Post post=pService.getById(indent_id);
//		IndentWithPost iwp=new IndentWithPost();
//		iwp.setIndent(indent);
//		iwp.setPost(post);
//		iwp.setHavePost(1);
			
		return result;
	}
	
	
	@RequestMapping("/showComment")//查看评价
	public String changeComment(HttpServletRequest request, Model model) {
		String indent_id=(String)request.getParameter("indent_id");//需要订单号
		Post p=pService.getById(indent_id);
		model.addAttribute("score",p.getSocre());
		model.addAttribute("comment", p.getComment());
		
		return "showComment";		
	}
	
	
	@RequestMapping("/cancelIndent")
	@ResponseBody
	public int cancelIndent(HttpServletRequest request, Model model) throws ParseException
	{
		
			Map<String,String> map = new HashMap<String,String>();
			String indentId=(String)request.getParameter("indentId");
			String checkInDate=(String)request.getParameter("checkInDate");
			String checkOutDate=(String)request.getParameter("checkOutDate");
			//在删除订单前通过indent.indent_id获取indnet.tel
			String tel=inService.getById(indentId).getTel();
			//在删除订单前通过indent.indent_id获取indnet.room_id
			String roomId=inService.getById(indentId).getRoomId();
			//从indent里删除记录
			int indentRow=inService.dropIndent(indentId);
			//从book里删除记录
			BookKey bookkey=new BookKey();
			bookkey.setTel(tel);
			bookkey.setRoomId(roomId);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = sdf1.parse(checkInDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			bookkey.setBookdate(sqlDate);
			int bookRow = bookservice.dropBook(bookkey);
			Calendar cld = Calendar.getInstance();
			cld.setTime(utilDate);
			cld.add(Calendar.DATE, 1);
			utilDate = cld.getTime();
			while (!sqlDate.toString().equals(checkOutDate))
			{
				sqlDate = new java.sql.Date(utilDate.getTime());
				bookkey.setBookdate(sqlDate);
				bookRow = bookservice.dropBook(bookkey);
				cld.setTime(utilDate);
				cld.add(Calendar.DATE, 1);
				utilDate = cld.getTime();
			}
			//返回所需值
			
			map.put("indentId", indentId);
			map.put("checkInDate", checkInDate);
			map.put("checkOutDate", checkOutDate);
			return 1;
		
		
	}
}