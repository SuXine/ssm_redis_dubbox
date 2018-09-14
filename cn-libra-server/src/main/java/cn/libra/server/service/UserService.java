package cn.libra.server.service;


import cn.libra.server.bean.SCourse;
import cn.libra.server.dao.SCourseMapper;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service("server_userService")
public class UserService {
    @Autowired
    SCourseMapper sCourseMapper;

    public JSONObject test(JSONObject params){
        params.put("aaa","qwewq");
        String id = params.getString("userId");
        SCourse course = sCourseMapper.selectByPrimaryKey(id);
        return  course.toJson();
    }
}
