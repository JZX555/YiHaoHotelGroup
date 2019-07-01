package cn.edu.cqu.yihao.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Room;

public interface RoomMapper {
    int deleteByPrimaryKey(String roomId);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(String roomId);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);

	int selectPriceByType(String roomType);

}