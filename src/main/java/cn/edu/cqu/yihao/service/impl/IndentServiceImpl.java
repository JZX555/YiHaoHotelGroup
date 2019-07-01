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

	@Override
	public Indent[] getByTypeandTel(int type, String tel) {
		return indentDao.selectByTypeandTel(type, tel);
	}

	@Override
	public Indent[] getByTypeandStartDate(int type, String date) {
		return this.indentDao.selectByTypeandStartDate(type, date);
	}

	@Override
	public Indent[] getByTypeandEndDate(int type, String date) {
		return this.indentDao.selectByTypeandEndDate(type, date);
	}

	@Override
	public int addIndent(Indent indent) {
		return this.indentDao.insert(indent);
	}

	@Override
	public int updateSelect(Indent indent) {
		return this.indentDao.updateByPrimaryKeySelective(indent);
	}

	@Override
	public Indent[] getByRoomandDate(String roomID, String beginDate, String endDate) {
		return this.indentDao.selectByRoomandDate(roomID, beginDate, endDate);
	}

	@Override
	public Indent getByRoomandOneDate(String roomID, String date) {
		return this.indentDao.selectByRoomandOneDate(roomID, date);
	}
}
