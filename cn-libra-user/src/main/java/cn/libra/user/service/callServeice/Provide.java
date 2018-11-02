package cn.libra.user.service.callServeice;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 对外提供
 * @program:params
 * @author: sx
 **/
@Service("user_provide")
@Transactional(readOnly = true)
public class Provide {


	/**
	* API: provide_getUserMap / 获取User表数据
	* @program:params
	* @author: sx
	**/
	public JSONObject getUserMap(JSONObject params){
		params.put("hello","hello");
		return params;
	}


}
