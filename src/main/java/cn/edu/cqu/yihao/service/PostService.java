package cn.edu.cqu.yihao.service;

import cn.edu.cqu.yihao.pojo.Post;

public interface PostService {
	public Post getById(String id);
	
	public int addPost(String id, double score, String comment);
	
	public int updateScore(String id, double score);
	
	public int updateComment(String id, String comment);
	
	public int updateAll(String id, double score, String comment);
}
