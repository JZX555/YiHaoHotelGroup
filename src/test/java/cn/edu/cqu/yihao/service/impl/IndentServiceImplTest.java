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
		Indent[] indents = indentService.getByTypeandTel(3, "17725024014");
		System.out.println("------------");
		for(Indent indent:indents)
			System.out.println(indent.getTel());
	}

}
