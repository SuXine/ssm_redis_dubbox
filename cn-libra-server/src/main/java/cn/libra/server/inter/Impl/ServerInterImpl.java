package cn.libra.server.inter.Impl;

import cn.libra.server.inter.ServerInter;
import cn.libra.server.service.ConsultService;
import cn.libra.server.service.callServeice.Provide;
import cn.libra.utils.util.exception.ControllerException;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@Controller public class ServerInterImpl implements ServerInter {

	@Autowired ConsultService consultService;
	@Autowired Provide provide;

	public JSONObject callServer(String serviceName, String methodName, JSONObject params) throws ControllerException {
		Object methodResult = null;
		try {
			switch (serviceName) {
			case "provide": {
				Method method = null;
				method = provide.getClass().getMethod(methodName, JSONObject.class);
				methodResult = method.invoke(provide, params);
				break;
			}
			case "consult": {
				Method method = consultService.getClass().getMethod(methodName, JSONObject.class);
				methodResult = method.invoke(consultService, params);
				break;
			}
			default:
				throw new ControllerException("不存在名字为【" + serviceName + "】的service");
			}
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return makeReturnJson(methodResult, serviceName, methodName);
	}

	private JSONObject makeReturnJson(Object data, String serviceName, String methodName) {
		JSONObject json = new JSONObject();
		JSONObject error = new JSONObject();

		error.put("code","200");
		error.put("mess","SUCCESS");

		json.put("data", data);
		json.put("error",error);
		return json;
	}
}
