package cn.edu.cqu.yihao.service.impl;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.service.BookService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-context.xml"})  
public class BookServiceImplTest {
	@Autowired
	BookService bookService = null;
	
	@Test
	public void test() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = f.parse("2019-06-28");
			Book b = bookService.getByTypeandDate(5, date);
			System.out.println(b.getTel());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void t2() {
		Book b = bookService.getByKey("17725024014", "001");
		System.out.println(b.getTel());
	}
}
