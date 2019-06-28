package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Indent;

public interface IndentMapper {
    int deleteByPrimaryKey(String indentId);

    int insert(Indent record);

    int insertSelective(Indent record);

    Indent selectByPrimaryKey(String indentId);

    int updateByPrimaryKeySelective(Indent record);

    int updateByPrimaryKey(Indent record);
}