package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Account;

public interface AccountMapper {
    int deleteByPrimaryKey(String tel);

    int insert(Account record);

    int insertSelective(Account record);

    Account selectByPrimaryKey(String tel);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
}