package cn.edu.cqu.yihao.service;

import java.util.Date;

import cn.edu.cqu.yihao.pojo.Book;

public interface BookService {
	public Book getByKey(String tel, String room_id);
	
	public Book[] getByTypeandDate(int type, String date);
	
	public String[] getAvailRoom(int type, String date);
	
	public String[] getAvailRoomBetween(int type, String begin, String end);
}
