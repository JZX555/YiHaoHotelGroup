package cn.edu.cqu.yihao.service;

public interface EmailService {
	public String getValCode(int len);
	
	public void sendEmail(String client, String msg);

}
