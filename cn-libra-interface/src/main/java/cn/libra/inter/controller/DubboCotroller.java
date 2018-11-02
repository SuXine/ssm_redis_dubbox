package cn.libra.inter.controller;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DubboCotroller {

    public JSONObject callController(String paramsStr, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, String childrenName, String serviceName, String methodName) throws  Exception ;
}