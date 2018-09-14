package cn.libra.user.inter.Impl;

import cn.libra.user.inter.UserInter;
import cn.libra.user.service.UserService;
import cn.libra.user.util.exception.ControllerException;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.lang.reflect.Method;

@Controller
public class UserInterImpl implements UserInter {
@Autowired
UserService userService;

    public JSONObject callServer(String serviceName, String methodName, JSONObject params) throws Exception {
        Class jsonClass = Class.forName("com.alibaba.fastjson.JSONObject");
        Object methodResult = null;

        switch (serviceName){
            case "user":{
                Method method = userService.getClass().getMethod(methodName, jsonClass);
                methodResult = method.invoke(userService, params);
                return makeReturnJson(methodResult, serviceName, methodName);
            }
            default : throw  new ControllerException("不存在名字为【"+serviceName+"】的service");
        }
    }

    private JSONObject makeReturnJson(Object data,String serviceName,String methodName){
        JSONObject json = new JSONObject();
        json.put("controller",serviceName+"_"+methodName);
        json.put("data",data);
        return json;
    }
}
