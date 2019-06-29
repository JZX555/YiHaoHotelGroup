package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.Debit_cardMapper;
import cn.edu.cqu.yihao.pojo.Debit_card;
import cn.edu.cqu.yihao.service.Debit_cardService;

@Service
public class Debit_cardServiceImpl implements Debit_cardService{
	@Autowired
	Debit_cardMapper Debit_cardDao = null;
	
	@Override
	public Debit_card getByID(String id) {
		return Debit_cardDao.selectByPrimaryKey(id);
	}

	@Override
	public int add(String id, double money) {
		return Debit_cardDao.addBalance(id, money);
	}

	@Override
	public int sub(String id, double money) {
		return Debit_cardDao.subBalance(id, money);
	}
	
}
