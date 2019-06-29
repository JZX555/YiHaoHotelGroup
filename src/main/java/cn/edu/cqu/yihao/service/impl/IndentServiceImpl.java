package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.IndentMapper;
import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.service.IndentService;

@Service
public class IndentServiceImpl implements IndentService {
	@Autowired
	private IndentMapper indentDao = null;
	
	@Override
	public Indent getById(String id) {
		return indentDao.selectByPrimaryKey(id);
	}

}
