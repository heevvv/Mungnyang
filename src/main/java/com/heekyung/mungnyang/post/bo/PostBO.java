package com.heekyung.mungnyang.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.heekyung.mungnyang.common.FileManagerService;
import com.heekyung.mungnyang.post.comment.bo.CommentBO;
import com.heekyung.mungnyang.post.comment.model.CommentDetail;
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
	
	
	
	// 특정 post의 댓글목록을 조회하는 기능
	public List<PostDetail> getPostList(int userId) {
		
		List<Post> PostList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		for(Post post:PostList) {

			
			PostDetail postDetail = new PostDetail();
			User user = userBO.getUserById(post.getUserId());

			List<CommentDetail> commentList = commentBO.getCommentList(post.getId());
			
			postDetail.setId(post.getId());
			postDetail.setUserId(post.getUserId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());

			postDetail.setUserName(user.getName());
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		

	}
	// 게시글 삭제 기능
	public int deletePost(int postId) {
		
		Post post = postDAO.selectPost(postId);
		FileManagerService.removeFile(post.getImagePath());
		
		commentBO.deleteCommentByPostId(postId);
		
		return postDAO.deletePost(postId);
	}
		
	
	}

