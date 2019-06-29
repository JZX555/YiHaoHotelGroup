package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Indent;

public interface IndentService {
	public Indent getById(String id);
	
	public Indent[] getByTypeandTel(int type, String tel);
}
