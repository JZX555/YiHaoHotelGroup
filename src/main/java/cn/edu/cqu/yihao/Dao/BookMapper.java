package cn.edu.cqu.yihao.Dao;

import java.sql.Date;

import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.BookKey;

public interface BookMapper {
    int deleteByPrimaryKey(BookKey key);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(BookKey key);
    
    Book selectByTypeandDate(String type, Date date);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}