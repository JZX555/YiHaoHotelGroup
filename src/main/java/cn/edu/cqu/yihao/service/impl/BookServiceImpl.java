package cn.edu.cqu.yihao.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.BookMapper;
import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.BookKey;
import cn.edu.cqu.yihao.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookDao = null;
	
	@Override
	public Book getByKey(String tel, String roomId) {
		BookKey key = new BookKey();
		key.setTel(tel);
		key.setRoomId(roomId);
		
		return bookDao.selectByPrimaryKey(key);
	}

	@Override
	public Book[] getByTypeandDate(int type, String date) {
		return bookDao.selectByTypeandDate(type, date);
	}

	@Override
	public String[] getAvailRoom(int type, String date) {
		return bookDao.selectNotBook(type, date);
	}

	@Override
	public String[] getAvailRoomBetween(int type, String begin, String end) {
		return bookDao.selectNotBookBetween(type, begin, end);
	}
	

}
