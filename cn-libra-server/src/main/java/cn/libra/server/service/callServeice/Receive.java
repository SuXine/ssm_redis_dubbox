package cn.libra.server.service.callServeice;

import cn.libra.user.inter.UserInter;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 接收提供
 * @program:params
 * @author: sx
 **/
@Service("server_receive")
@Transactional(readOnly = true)
public class Receive {
	@Autowired
	private UserInter userInter;

	public JSONObject getUserMap()  {
		try {
			return userInter.callServer("provide", "getUserMap", new JSONObject());
		} catch (Exception e) {
			e.printStackTrace();
			return  null;
		}
	}

}
