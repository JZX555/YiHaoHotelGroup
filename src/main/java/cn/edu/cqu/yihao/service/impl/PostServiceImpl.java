package cn.edu.cqu.yihao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.yihao.Dao.PostMapper;
import cn.edu.cqu.yihao.pojo.Post;
import cn.edu.cqu.yihao.service.PostService;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostMapper postDao = null;
	
	@Override
	public Post getById(String id) {
		return postDao.selectByPrimaryKey(id);
	}

	@Override
	public int addPost(String id, double score, String comment) {
		Post post = new Post();
		post.setIndentId(id);
		post.setSocre(score);
		post.setComment(comment);
		return this.postDao.insert(post);
	}

	@Override
	public int updateScore(String id, double score) {
		return this.postDao.updateScore(id, score);
	}

	@Override
	public int updateComment(String id, String comment) {
		return this.postDao.updateComment(id, comment);
	}

	@Override
	public int updateAll(String id, double score, String comment) {
		Post post = new Post();
		post.setIndentId(id);
		post.setSocre(score);
		post.setComment(comment);
		return this.postDao.updateByPrimaryKeyWithBLOBs(post);
	}

	@Override
	public int addPost(Post post) {
		return this.postDao.insert(post);
	}

	@Override
	public int updateSelect(Post post) {
		return this.postDao.updateByPrimaryKeySelective(post);
	}
	
}
