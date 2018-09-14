package cn.libra.user.dao;

import cn.libra.user.bean.User;
import cn.libra.user.util.redis.RedisCache;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
@CacheNamespace(implementation = RedisCache.class)
public interface UserDao  {


    @Insert(" INSERT INTO user(id,name) VALUES (#{user.id}, #{user.name}) ")
	int insertUser(@Param("user") User user); //添加

    @Select({"<script>",
            "SELECT * FROM User",
            "WHERE 1=1",
            "<if  test = '@StringUtil@isNotEmpty(user.id)' > AND id = #{user.id} </if>",
            "<if  test = '@StringUtil@isNotEmpty(user.name)' > AND name = #{user.name} </if>",
            "</script>"})
    List<User> selectAllUsers(@Param("user") User user);//查询所有学生，返回List
}
