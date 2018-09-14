package cn.libra.user.dao;

import cn.libra.user.bean.Course;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service("user_CourseMapper")
public interface CourseMapper {

    int deleteByPrimaryKey(String id);

    int insert(Course record);

    int insertSelective(Course record);

    Course selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);
}