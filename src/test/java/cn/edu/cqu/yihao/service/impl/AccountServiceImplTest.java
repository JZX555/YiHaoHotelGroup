package cn.edu.cqu.yihao.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.service.AccountService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-context.xml"})  
public class AccountServiceImplTest {
	@Autowired
	private AccountService accountService = null;
	
	@Test
	public void test() {
		Account a = this.accountService.getAccountByTel("17725024014");
		System.out.println("----");
		System.out.println(a.getTel());
		System.out.println("----");
		
		System.out.println(this.accountService.subPoint("17725024014", 300));
		
		System.out.println(this.accountService.changePassword("17725024014", "123456", "111111"));
	}

}
