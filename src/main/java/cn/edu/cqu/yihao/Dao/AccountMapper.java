package cn.edu.cqu.yihao.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(String tel);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String tel);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    
    int addPoint(@Param("tel")String tel, @Param("point")int point);
    
    int subPoint(@Param("tel")String tel, @Param("point")int point);
    
    int updatePassword(@Param("tel")String tel, @Param("last")String last, @Param("cur")String cur);
}