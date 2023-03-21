package com.heekyung.mungnyang.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.post.comment.dao.CommentDAO;
import com.heekyung.mungnyang.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	
	public List<Comment> getCommentList(int postId) {
		return commentDAO.selectCommentList(postId);
		
	}

}
