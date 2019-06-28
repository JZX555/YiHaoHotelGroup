package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Post;

public interface PostMapper {
    int deleteByPrimaryKey(String indentId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(String indentId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKeyWithBLOBs(Post record);

    int updateByPrimaryKey(Post record);
}