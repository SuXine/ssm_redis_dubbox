package cn.libra.server.inter;

import cn.libra.utils.util.exception.ControllerException;
import com.alibaba.fastjson.JSONObject;

public interface ServerInter {
    public JSONObject callServer(String serviceName,String methodName,JSONObject params) throws ControllerException;
}
