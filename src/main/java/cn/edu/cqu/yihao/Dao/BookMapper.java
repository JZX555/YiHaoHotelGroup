package cn.edu.cqu.yihao.Dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Book;
import cn.edu.cqu.yihao.pojo.BookKey;

public interface BookMapper {
    int deleteByPrimaryKey(BookKey key);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(BookKey key);
    
    Book[] selectByTypeandDate(@Param("type") int type, @Param("date") String date);
    
    String[] selectNotBook(@Param("type") int type, @Param("date") String date);
    
    String[] selectNotBookBetween(@Param("type") int type, @Param("begin") String begin, @Param("end") String end);
    
    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);
}