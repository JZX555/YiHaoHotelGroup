package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.VipMapper;
import cn.edu.cqu.yihao.pojo.Vip;
import cn.edu.cqu.yihao.service.VipService;

@Service
public class VipServiceImpl implements VipService {
	@Autowired
	private VipMapper vipDao = null;
	
	@Override
	public Vip getByLevel(int level) {
		return vipDao.selectByPrimaryKey(level);
	}

}
