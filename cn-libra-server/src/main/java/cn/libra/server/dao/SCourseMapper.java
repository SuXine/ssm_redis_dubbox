package cn.libra.server.dao;

import cn.libra.server.bean.SCourse;

public interface SCourseMapper {
    int deleteByPrimaryKey(String id);

    int insert(SCourse record);

    int insertSelective(SCourse record);

    SCourse selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SCourse record);

    int updateByPrimaryKey(SCourse record);
}