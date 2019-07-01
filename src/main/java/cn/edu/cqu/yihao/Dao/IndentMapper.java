package cn.edu.cqu.yihao.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Indent;
import cn.edu.cqu.yihao.pojo.Room;

public interface IndentMapper {
    int deleteByPrimaryKey(String indentId);

    int insert(Indent record);

    int insertSelective(Indent record);

    Indent selectByPrimaryKey(String indentId);

    int updateByPrimaryKeySelective(Indent record);

    int updateByPrimaryKey(Indent record);
    
    Indent[] selectByTypeandTel(@Param("type")int type, @Param("tel")String tel);
    
    Indent[] selectByTypeandStartDate(@Param("type")int type, @Param("date")String date);
    
    Indent[] selectByTypeandEndDate(@Param("type")int type, @Param("date")String date);
    
	Indent[] selectByRoomandDate(@Param("room")String room, @Param("begin")String begin, @Param("end")String end);
	
	Indent selectByRoomandOneDate(@Param("room")String room, @Param("date")String date);
}