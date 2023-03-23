package com.heekyung.mungnyang.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.heekyung.mungnyang.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList();
	
	public Post selectPost(@Param("postId") int postId);
	
	// 대상 테이블 삭제
	public int deletePost(
			@Param("postId") int postId
			// 삭제 과정에서, 내가 쓴 글만 삭제할 수 있도록.
			, @Param("userId") int userId);
	
	
}
