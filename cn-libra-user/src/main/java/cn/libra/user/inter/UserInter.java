package cn.libra.user.inter;

import com.alibaba.fastjson.JSONObject;

public interface UserInter {
    public JSONObject callServer(String serviceName, String methodName, JSONObject params) throws Exception;
}
