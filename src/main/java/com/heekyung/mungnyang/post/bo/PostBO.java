package com.heekyung.mungnyang.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.heekyung.mungnyang.common.FileManagerService;
import com.heekyung.mungnyang.post.comment.bo.CommentBO;
import com.heekyung.mungnyang.post.comment.model.Comment;
import com.heekyung.mungnyang.post.dao.PostDAO;
import com.heekyung.mungnyang.post.model.Post;
import com.heekyung.mungnyang.post.model.PostDetail;
import com.heekyung.mungnyang.user.bo.UserBO;
import com.heekyung.mungnyang.user.model.User;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;

	public int addPost(int userId, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, content, imagePath);
	}
	
	
	
	public List<PostDetail> getPostList() {
		
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			
			PostDetail postDetail = new PostDetail();
			
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			postDetail.setId(post.getId());
			postDetail.setUserId(post.getUserId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setCommentList(commentList);
			
			User user = userBO.getUserById(post.getUserId());
			
			postDetail.setUserName(user.getName());
			postDetailList.add(postDetail);
			
			
		}
		return postDetailList;
		
	}
}
