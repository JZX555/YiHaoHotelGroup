package cn.edu.cqu.yihao.service;

import java.util.Date;
import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.Room;

public interface BookService {
	public Book getByKey(String tel, String room_id);
	
	public Book[] getByTypeandDate(int type, String date);
	
	public String[] getAvailRoom(int type, String date);
	
	public String[] getAvailRoomBetween(int type, String begin, String end);
	
<<<<<<< HEAD
	public int insert(Book book);
	
=======
	public int getPriceByType(String roomType);
	
	public int addBook(Book book);
	
	public int updateSelect(Book book);
>>>>>>> 51e55c4f535abb8963f3a773eb8a6d917efc48b0
}
