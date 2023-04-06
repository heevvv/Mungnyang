package com.heekyung.mungnyang.search.review.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.search.review.dao.ReviewDAO;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	public int addReview(int userId, int hospitalId, String content) {
		return reviewDAO.insertReview(userId, hospitalId, content);
	}

}
