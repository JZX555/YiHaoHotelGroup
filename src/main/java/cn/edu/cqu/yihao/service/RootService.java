package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Root;

public interface RootService {
	public Root getById(String id);
	
	public int addRoot(Root root);
	
	public int updateSelect(Root root);
}
