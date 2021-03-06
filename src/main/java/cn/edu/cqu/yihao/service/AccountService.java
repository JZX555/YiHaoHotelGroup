package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Account;

public interface AccountService {
	Account getAccountByTel(String tel);
	
	int addPoint(String tel, int point);
	
	int subPoint(String tel, int point);
	
	int changePassword(String tel, String last, String cur);
	
	int insertAccount(Account record);
	
	int setVipLevel(String tel, int vip);
	
	int addAccount(Account account);
	
	int updateSelect(Account account);
}
