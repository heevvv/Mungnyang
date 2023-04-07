package com.heekyung.mungnyang.search.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.search.model.Review;
import com.heekyung.mungnyang.search.review.dao.ReviewDAO;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	public int addReview(int userId, int hospitalId, String content) {
		return reviewDAO.insertReview(userId, hospitalId, content);
	}

	

	public List<Review> getReviewList(){
		return reviewDAO.selectReviewList();
	}
	
	public List<Review> getReviewListByHospitalId(int hospitalId) {
	    return reviewDAO.selectReviewListByHospitalId(hospitalId);
	}
}