package cn.libra.user.inter.Impl;

import cn.libra.user.inter.UserInter;
import cn.libra.user.service.UserService;
import cn.libra.user.service.callServeice.Provide;
import cn.libra.utils.util.exception.ControllerException;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.lang.reflect.Method;

@Controller
public class UserInterImpl implements UserInter {
    @Autowired
    UserService userService;
    @Autowired Provide provide;

    public JSONObject callServer(String serviceName, String methodName, JSONObject params) throws Exception {
//        Class jsonClass = Class.forName("com.alibaba.fastjson.JSONObject");
        Object methodResult = null;

            switch (serviceName) {
            case "provide": {
                Method method = null;
                method = provide.getClass().getMethod(methodName, JSONObject.class);
                methodResult = method.invoke(provide, params);
                break;
            }
            case "user": {
                    Method method = null;
                    method = userService.getClass().getMethod(methodName, JSONObject.class);
                    methodResult = method.invoke(userService, params);
                    break;
            }
            

                default:
                    throw new ControllerException("不存在名字为【" + serviceName + "】的service");
            }
        return makeReturnJson(methodResult, serviceName, methodName);
    }

    private JSONObject makeReturnJson(Object data, String serviceName, String methodName) {
        JSONObject json = new JSONObject();
        JSONObject error = new JSONObject();

        error.put("code","200");
        error.put("mess","SUCCESS");

        json.put("data", data);
        json.put("error",error);
        return json;
    }
}
