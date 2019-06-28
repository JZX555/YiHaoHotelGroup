package cn.edu.cqu.yihao.Dao;

import cn.edu.cqu.yihao.pojo.Vip;

public interface VipMapper {
    int deleteByPrimaryKey(Integer vipLevel);

    int insert(Vip record);

    int insertSelective(Vip record);

    Vip selectByPrimaryKey(Integer vipLevel);

    int updateByPrimaryKeySelective(Vip record);

    int updateByPrimaryKey(Vip record);
}