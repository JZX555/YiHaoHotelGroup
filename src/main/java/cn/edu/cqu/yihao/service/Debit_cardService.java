package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Debit_card;

public interface Debit_cardService {
	public Debit_card getByID(String id);
	
	public int add(String id, double money);
	
	public int sub(String id, double money);
}
