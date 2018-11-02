package cn.libra.utils.util.mail;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class MailUtil implements Runnable {
    private String email;// 收件人邮箱
    private String code;// 激活码
    private String html;// html文本

    public MailUtil(String email, String code,String html) {
        this.email = email;
        this.code = code;
        this.html = html;
    }
 
    public void run() {
        // 3.发送一封激活邮件
        String from = "admin@libraone.cn";// 发件人电子邮箱
        String host = "smtp.exmail.qq.com"; // 指定发送邮件的主机smtp.qq.com(QQ)|smtp.163.com(网易)
 
        Properties properties = System.getProperties();// 获取系统属性
 
        properties.setProperty("mail.smtp.host", host);// 设置邮件服务器
        properties.setProperty("mail.smtp.auth", "true");// 打开认证
 
        try {
            //QQ邮箱需要下面这段代码，163邮箱不需要
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);
 
 
            // 1.获取默认session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("admin@libraone.cn", "KyXnKY7CYKupJ8Ut"); // 发件人邮箱账号、授权码
                }
            });
 
            // 2.创建邮件对象
            Message message = new MimeMessage(session);
            // 2.1设置发件人
            message.setFrom(new InternetAddress(from));
            // 2.2设置接收人
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            // 2.3设置邮件主题
            message.setSubject("Libra咨询人操作邮件");
            // 2.4设置邮件内容
//            String content = "<html><head></head><body><h1>请点击以下链接完成操作</h1><h3><a href='http://localhost:8080/test/Active.action?code="
//            			+ code + "'>点击链接进行验证：http:///localhost:8080/test/Active.action?code="+ code
//                    + "</href></h3></body></html>";
            message.setContent(html, "text/html;charset=UTF-8");
            // 3.发送邮件
            Transport.send(message);
            System.out.println("邮件成功发送!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
