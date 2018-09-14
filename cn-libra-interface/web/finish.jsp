<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<script>
    //定义函数myClose关闭当前窗口
    function myClose(){
        //将id为time的元素的内容转为整数，保存在变量n中
        var n=parseInt(time.innerHTML);
        n--;//将n-1
        //如果n==0,关闭页面
        //否则, 将n+秒钟后自动关闭，再保存回time的内容中
        if(n>0){
            time.innerHTML=n+"秒钟后自动关闭";
            timer=setTimeout(myClose,1000);
        }else{
        	window.opener=null;
        	window.open('','_self');
        	window.close();
        }
    }
    var timer=null;
    //当页面加载后，启动周期性定时器，每个1秒执行myClose
    window.onload=function(){
        timer=setTimeout(myClose,1000);
    }
</script>
<body>
    <span>验证成功！</span><br>
    <span id="time">5秒钟后自动关闭</span><br>
    <a href="javascript:clearTimeout(timer)">留在本页</a>
    <p>如果不能自动关闭请手动关闭</p>
</body>

</html>
