package cn.edu.cqu.yihao.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Post;

public interface PostMapper {
    int deleteByPrimaryKey(String indentId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(String indentId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKeyWithBLOBs(Post record);

    int updateByPrimaryKey(Post record);
    
    int updateComment(@Param("id")String id, @Param("comment")String comment);
    
    int updateScore(@Param("id")String id, @Param("score")double score);
}