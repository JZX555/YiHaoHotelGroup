package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.AccountMapper;
import cn.edu.cqu.yihao.pojo.Account;
import cn.edu.cqu.yihao.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountMapper accountDao;
	
	@Override
	public Account getAccountByTel(String tel) {	
		return this.accountDao.selectByPrimaryKey(tel);
	}

	@Override
	public int addPoint(String tel, int point) {
		return this.accountDao.addPoint(tel, point);
	}

	@Override
	public int subPoint(String tel, int point) {
		return this.accountDao.subPoint(tel, point);
	}

}
