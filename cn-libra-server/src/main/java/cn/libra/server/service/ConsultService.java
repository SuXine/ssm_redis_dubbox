package cn.libra.server.service;

import cn.libra.server.service.callServeice.Receive;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ConsultService {
	@Autowired Receive receive;


	/**
	* API: server_consult_listConsult / 查询咨询列表
	* @program:params
	* @author: sx
	**/
	public JSONObject listConsult(JSONObject params){

		return  		receive.getUserMap();
	}


}
