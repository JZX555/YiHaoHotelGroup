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

}
