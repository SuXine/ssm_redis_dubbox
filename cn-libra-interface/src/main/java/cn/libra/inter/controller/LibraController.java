package cn.libra.inter.controller;

import cn.libra.inter.service.LibraService;
import cn.libra.utils.util.redis.RedisUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;


@Component
@Path("pc")
public class LibraController implements DubboCotroller {
    @Autowired
    LibraService libraService;
    @Autowired
    RedisUtil redisUtil;

    private final static String TOURIST = "TOURIST";



    @POST
    @Path("{childrenName}_{serviceName}_{methodName}")
    @ResponseBody
    @Produces({MediaType.APPLICATION_JSON + "; " + MediaType.CHARSET_PARAMETER + "=UTF-8", MediaType.TEXT_XML + "; " + MediaType.CHARSET_PARAMETER + "=UTF-8"})
    public JSONObject callController(String paramsStr, @Context HttpServletRequest httpServletRequest, @Context HttpServletResponse httpServletResponse, @PathParam("childrenName") String childrenName, @PathParam("serviceName") String serviceName, @PathParam("methodName") String methodName) throws Exception {

        JSONObject params = JSONObject.parseObject(paramsStr);
        params = initParams(params);
        String type = params.getString("userType");

        String controllerPath = childrenName + "_" + serviceName + "_" + methodName;


        JSONObject jsonObject = makeSuccessJson(params, childrenName, serviceName, methodName, controllerPath);
        String s = jsonObject.toString();

        return jsonObject;
    }

    private JSONObject makeSuccessJson(JSONObject paramsStr, String childrenName, String serviceName, String methodName, String controllerPath) throws Exception {
        JSONObject requestJson = libraService.callChildren(childrenName, serviceName, methodName, paramsStr);


        requestJson.put("controllerPath", controllerPath);
        return requestJson;
    }

    private JSONObject initParams(JSONObject paramsStr) {
        if (paramsStr == null) {
            paramsStr = new JSONObject();
        }
        paramsStr = paramsStr.getJSONObject("params");
        if (paramsStr == null) {
            paramsStr = new JSONObject();
        }
        return paramsStr;
    }





}




