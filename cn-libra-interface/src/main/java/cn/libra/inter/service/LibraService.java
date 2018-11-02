package cn.libra.inter.service;

import cn.libra.server.inter.ServerInter;
import cn.libra.user.inter.UserInter;
import cn.libra.utils.util.exception.ControllerException;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LibraService{
    @Autowired
    private ServerInter serverInter;
    @Autowired
    private UserInter userInter;

    public  JSONObject callChildren(String childrenName,String serviceName,String methodName,JSONObject params) throws Exception {
        switch (childrenName){
            case "server" : return serverInter.callServer(serviceName, methodName, params);
            case "user" : return userInter.callServer(serviceName, methodName, params);
            default : throw  new ControllerException("不存在名字为【"+childrenName+"】的子服务");
        }

    }
}
