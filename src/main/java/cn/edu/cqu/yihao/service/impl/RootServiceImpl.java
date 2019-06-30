package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.RootMapper;
import cn.edu.cqu.yihao.pojo.Root;
import cn.edu.cqu.yihao.service.RootService;

@Service
public class RootServiceImpl implements RootService {
	@Autowired
	private RootMapper rootDao = null;
	
	@Override
	public Root getById(String id) {
		return rootDao.selectByPrimaryKey(id);
	}

	@Override
	public int addRoot(Root root) {
		return this.rootDao.insert(root);
	}

	@Override
	public int updateSelect(Root root) {
		return this.rootDao.updateByPrimaryKeySelective(root);
	}

}
