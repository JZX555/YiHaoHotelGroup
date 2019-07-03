package cn.edu.cqu.yihao.service;

import java.util.Date;
import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.BookKey;
import cn.edu.cqu.yihao.pojo.Room;

public interface BookService {
	public Book getByKey(String tel, String room_id);
	
	public Book[] getByTypeandDate(int type, String date);
	
	public String[] getAvailRoom(int type, String date);
	
	public String[] getAvailRoomBetween(int type, String begin, String end);
	
	public int getPriceByType(String roomType);
	
	public int addBook(Book book);
	
	public int updateSelect(Book book);
	
	public int dropBook(BookKey bookkey);
}
