package cn.edu.cqu.yihao.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.yihao.pojo.Debit_card;

public interface Debit_cardMapper {
    int deleteByPrimaryKey(String cardId);

    int insert(Debit_card record);

    int insertSelective(Debit_card record);

    Debit_card selectByPrimaryKey(String cardId);

    int updateByPrimaryKeySelective(Debit_card record);

    int updateByPrimaryKey(Debit_card record);
    
    int subBalance(@Param("id")String id, @Param("money")double money);
    
    int addBalance(@Param("id")String id, @Param("money")double money);
}