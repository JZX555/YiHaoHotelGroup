package cn.edu.cqu.yihao.service.impl;

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
	public Book getByTypeandDate(String type, String date) {
		// TODO Auto-generated method stub
		return null;
	}

}
