package cn.edu.cqu.yihao.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.cqu.yihao.service.Debit_cardService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-context.xml"})  
public class Debit_cardServiceImplTest {
	@Autowired
	private Debit_cardService debit_cardService = null;
	
	@Test
	public void test() {
		int cnt = debit_cardService.sub("111111",500.00);
		System.out.println(cnt);
	}

}
