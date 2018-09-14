package cn.libra.inter.controller;

import cn.libra.inter.service.LibraService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

@Controller
@Path("pc")
@Produces({MediaType.APPLICATION_JSON + "; " + MediaType.CHARSET_PARAMETER + "=UTF-8", MediaType.TEXT_XML + "; " + MediaType.CHARSET_PARAMETER + "=UTF-8"})

public class LibraController implements  DubboCotroller{
    @Autowired
    LibraService libraService;

    @POST
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    @Path("{childrenName}_{serviceName}_{methodName}")
    public JSONObject callController(JSONObject paramsStr,@PathParam("childrenName") String childrenName, @PathParam("serviceName") String serviceName, @PathParam("methodName") String methodName) throws Exception {
//        JSONObject params = JSONObject.parseObject(paramsStr);
        paramsStr =  paramsStr.getJSONObject("params");
        return libraService.callChildren(childrenName, serviceName, methodName, paramsStr) ;
    }

    @POST
    @Path("test/{test}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public String callControllera(String params,@PathParam("test") String aa) throws Exception {
        String b = aa;
        return aa;
    }

}




