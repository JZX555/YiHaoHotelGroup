package cn.edu.cqu.yihao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pay")
public class PayController {
	@RequestMapping("/debit_card")
	public String debit_cardWay(HttpServletRequest req, Model model) {
		Double price = (Double)req.getParameter("price");
		
		
	}

}
