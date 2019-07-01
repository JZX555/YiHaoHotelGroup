package cn.edu.cqu.yihao.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.service.IndentService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-context.xml"})  
public class IndentServiceImplTest {
	@Autowired
	private IndentService indentService = null;
	
	@Test
	public void test() {
//		Indent[] indents = indentService.getByRoomandDate("001", "2019-06-15", "2019-06-15");
//		System.out.println("------------");
//		for(Indent indent:indents)
//			System.out.println(indent.getTel());
		
		Indent indent = indentService.getByRoomandOneDate("001", "2019-6-19");
		if(indent == null)
			System.out.println("null");
		System.out.println("------------");
		System.out.println(indent.getRoomId());
		
//		Indent indent = new Indent();
//		indent.setIndentId("00001");
//		indent.setIndentType(2);
//		indent.setCost(500.0);
//		this.indentService.updateSelect(indent);
	}

}
