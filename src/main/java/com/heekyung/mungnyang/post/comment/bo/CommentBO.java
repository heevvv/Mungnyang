package com.heekyung.mungnyang.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.post.comment.dao.CommentDAO;
import com.heekyung.mungnyang.post.comment.model.Comment;
import com.heekyung.mungnyang.post.comment.model.CommentDetail;
import com.heekyung.mungnyang.user.bo.UserBO;
import com.heekyung.mungnyang.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addComment(int userId, int postId, String content) {
		return commentDAO.insertComment(userId, postId, content);
	}
	

	public List<CommentDetail> getCommentList(int postId) {
		
		List<Comment> commentList = commentDAO.selectCommentList(postId);
		
		// 4. 새로운 List 만들기 CommentDetail 객체 저장
		List<CommentDetail> commentDetailList = new ArrayList<>();
		
		for(Comment comment:commentList) {
			
			// 1. comment 하나마다 대응되는 commentDetail 객체 생성
			CommentDetail commentDetail = new CommentDetail();
			
			// 2. userBO에 있는 userId로 조회
			User user = userBO.getUserById(comment.getUserId());
			
			commentDetail.setId(comment.getId());
			commentDetail.setPostId(comment.getUserId());
			commentDetail.setContent(comment.getContent());
			
			// 3. 새로 조회한 user 객체에서 userName 값 저장
			commentDetail.setUserName(user.getName());
			
			commentDetailList.add(commentDetail);
			
		}
		
		return commentDetailList;
}

		


}
