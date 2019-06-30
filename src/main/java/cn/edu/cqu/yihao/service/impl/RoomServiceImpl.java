package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.RoomMapper;
import cn.edu.cqu.yihao.pojo.Room;
import cn.edu.cqu.yihao.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {
	@Autowired
	private RoomMapper roomDao = null;
	
	@Override
	public Room getById(String id) {
		return roomDao.selectByPrimaryKey(id);
	}

	@Override
	public int addRoom(Room room) {
		return this.roomDao.insert(room);
	}

	@Override
	public int updateSelect(Room room) {
		return this.roomDao.updateByPrimaryKeySelective(room);
	}
}
