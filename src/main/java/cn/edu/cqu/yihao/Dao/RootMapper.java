package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Root;

public interface RootMapper {
    int deleteByPrimaryKey(String rootId);

    int insert(Root record);

    int insertSelective(Root record);

    Root selectByPrimaryKey(String rootId);

    int updateByPrimaryKeySelective(Root record);

    int updateByPrimaryKey(Root record);
}