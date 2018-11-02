package cn.libra.inter.dubboMain;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DuboMain {

    public static void main(String[] args) throws Exception {
        String []  xmls = {"classpath:spring/applicationContext.xml","classpath:spring/dubbo-consumer.xml",};
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(xmls);

        context.start();

        System.out.println("启动成功");

        //让线程在这个地方阻塞着，这样服务就可以一直保持了
        System.in.read();
    }
}