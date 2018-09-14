package cn.libra.user.service;


import cn.libra.user.dao.CourseMapper;
import cn.libra.user.bean.Course;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service("user_userService")
public class UserService {
    @Autowired
    CourseMapper courseMapper;

    public JSONObject test(JSONObject params){
        params.put("aaa","qwewq");
        String id = params.getString("userId");
        Course course = courseMapper.selectByPrimaryKey(id);
        return  course.toJson();
    }
}
