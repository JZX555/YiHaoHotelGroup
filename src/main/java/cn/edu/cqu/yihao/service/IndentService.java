package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Indent;

public interface IndentService {
	public Indent getById(String id);
	
	public Indent[] getByTypeandTel(int type, String tel);
	
	public Indent[] getByTypeandStartDate(int type, String date);
	
	public Indent[] getByTypeandEndDate(int type, String date);
	
	public int addIndent(Indent indent);
	
	public int updateSelect(Indent indent);
	
	public Indent[] getByRoomandDate(String roomID, String beginDate, String endDate);
	
	public Indent getByRoomandOneDate(String roomID, String date);
	
	public Indent[] getCompleteBetweenDate(int type, String beginDate, String endDate);
}
