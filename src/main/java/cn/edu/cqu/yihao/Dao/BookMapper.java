package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.BookKey;

public interface BookMapper {
    int deleteByPrimaryKey(BookKey key);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(BookKey key);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}