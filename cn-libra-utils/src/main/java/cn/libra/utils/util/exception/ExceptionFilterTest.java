
package cn.libra.utils.util.exception;

import cn.libra.utils.util.StringUtil;
import com.alibaba.dubbo.common.Constants;
import com.alibaba.dubbo.common.extension.Activate;
import com.alibaba.dubbo.common.logger.Logger;
import com.alibaba.dubbo.common.logger.LoggerFactory;
import com.alibaba.dubbo.rpc.Filter;
import com.alibaba.dubbo.rpc.Invocation;
import com.alibaba.dubbo.rpc.Invoker;
import com.alibaba.dubbo.rpc.Result;
import com.alibaba.dubbo.rpc.RpcContext;
import com.alibaba.dubbo.rpc.RpcException;
import com.alibaba.dubbo.rpc.RpcResult;
import com.alibaba.dubbo.rpc.filter.ExceptionFilter;
import com.alibaba.dubbo.rpc.service.GenericService;
import com.alibaba.fastjson.JSONObject;

/**
 * ExceptionInvokerFilter
 * <p>
 * 功能：
 * <ol>
 * <li>不期望的异常打ERROR日志（Provider端）<br>
 *     不期望的日志即是，没有的接口上声明的Unchecked异常。
 * <li>异常不在API包中，则Wrap一层RuntimeException。<br>
 *     RPC对于第一层异常会直接序列化传输(Cause异常会String化)，避免异常在Client出不能反序列化问题。
 * </ol>
 *
 * @author william.liangf
 * @author ding.lid
 */
@Activate(group = Constants.PROVIDER)
public class ExceptionFilterTest implements Filter {

    private final Logger logger;

    public ExceptionFilterTest() {
        this(LoggerFactory.getLogger(ExceptionFilter.class));
    }

    public ExceptionFilterTest(Logger logger) {
        this.logger = logger;
    }

    public Result invoke(Invoker<?> invoker, Invocation invocation) throws RpcException {


        try {

            Result result = invoker.invoke(invocation);
            if (result.hasException() && GenericService.class != invoker.getInterface()) {
                try {
                    Throwable exception = result.getException();

                    // 在服务器端打印ERROR日志
                    logger.error("Got unchecked and undeclared exception which called by " + RpcContext.getContext().getRemoteHost()
                            + ". service: " + invoker.getInterface().getName() + ", method: " + invocation.getMethodName()
                            + ", exception: " + exception.getClass().getName() + ": " + exception.getMessage(), exception);

                    JSONObject json = new JSONObject();
                    JSONObject error = new JSONObject();


                    Throwable cause = exception.getCause();
                    String supperMessage = exception.getMessage();
                    String message = null;
                    if (cause != null) {
                        message  = cause.getMessage();
                    }
                    json.put("code","500");
                    json.put("mess","操作失败：" + (StringUtil.isNotEmpty(supperMessage) ? supperMessage : "" )+ (StringUtil.isNotEmpty(message) ? ":" +message : ""));

                    error.put("error",json);

                    // 如果是checked异常，直接抛出
                    if (! (exception instanceof RuntimeException) && (exception instanceof Exception)) {
                        logger.error("发生错误："+ (StringUtil.isNotEmpty(supperMessage) ? supperMessage : "" )+ (StringUtil.isNotEmpty(message) ? ":" +message : ""));
                        return new RpcResult(error);
                    }

                    // 是JDK自带的异常，直接抛出
                    String className = exception.getClass().getName();
                    if (className.startsWith("java.") || className.startsWith("javax.")) {
                        json.put("mess", "请求失败，请联系管理员！我们将尽最大努力为你服务！");
                        logger.error("发生JDK错误："+  (StringUtil.isNotEmpty(supperMessage) ? supperMessage : "" )+ (StringUtil.isNotEmpty(message) ? ":" +message : ""));
                        return new RpcResult(error);
                    }

                    // 是Dubbo本身的异常，直接抛出
                    if (exception instanceof RpcException) {
                        json.put("mess", "请求失败，请联系管理员！我们将尽最大努力为你服务！");
                        logger.error("发生Dubbo库错误："+  (StringUtil.isNotEmpty(supperMessage) ? supperMessage : "" )+ (StringUtil.isNotEmpty(message) ? ":" +message : ""));
                        return new RpcResult(error);
                    }

                    if (exception instanceof ControllerException) {
                        logger.error("发生错误："+  (StringUtil.isNotEmpty(supperMessage) ? supperMessage : "" )+ (StringUtil.isNotEmpty(message) ? ":" +message : ""));
                        return new RpcResult(error);
                    }

                    // 否则，包装成RuntimeException抛给客户端
                    return new RpcResult(error);
                } catch (Throwable e) {
                    logger.warn("Fail to ExceptionFilter when called by " + RpcContext.getContext().getRemoteHost()
                            + ". service: " + invoker.getInterface().getName() + ", method: " + invocation.getMethodName()
                            + ", exception: " + e.getClass().getName() + ": " + e.getMessage(), e);
                    return result;
                }
            }
            return result;
        } catch (RuntimeException e) {
            logger.error("Got unchecked and undeclared exception which called by " + RpcContext.getContext().getRemoteHost()
                    + ". service: " + invoker.getInterface().getName() + ", method: " + invocation.getMethodName()
                    + ", exception: " + e.getClass().getName() + ": " + e.getMessage(), e);
            throw e;
        }
    }

}