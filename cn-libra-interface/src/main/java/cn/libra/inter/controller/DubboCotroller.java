package cn.libra.inter.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

public interface DubboCotroller {

    public JSONObject callController(JSONObject params,String childrenName,String serviceName,String methodName) throws Exception;

    public String callControllera(String aa,String params) throws Exception ;
}