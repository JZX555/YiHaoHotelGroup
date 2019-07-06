package cn.edu.cqu.yihao.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

	@Override
	public String getValCode(int len) {
		String code = new String();
		code = new Double((Math.random() * 9 + 1) * 100000).toString();
		return code;
	}

	@Override
	//pop3:hlozbqafdatzcabj
	//imp:xjcdsoysuskobhbg
	public void sendEmail(String client, String msg) {
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", 465);// 端口号
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        try {
        	// 设置发件人邮箱地址
			message.setFrom(new InternetAddress("505684228@qq.com"));
			// 设置收件人邮箱地址 
			//message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress("xxx@qq.com"),new InternetAddress("xxx@qq.com"),new InternetAddress("xxx@qq.com")});
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(client));//一个收件人
			// 设置邮件标题
			message.setSubject("亿豪酒店");
			// 设置邮件内容
			message.setText(msg);

			Transport transport = session.getTransport();
			transport.connect("505684228@qq.com", "xjcdsoysuskobhbg");
			
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
