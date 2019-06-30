package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Room;

public interface RoomService {
	public Room getById(String id);
	
	public int addRoom(Room room);
	
	public int updateSelect(Room room);
}
