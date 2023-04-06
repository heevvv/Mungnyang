package com.heekyung.mungnyang.search.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.heekyung.mungnyang.search.model.Review;

@Repository
public interface ReviewDAO {
	
	public int insertReview(
			@Param("userId") int userId
			, @Param("hospitalId") int hospitalId
			, @Param("content") String content);
	
	public List<Review> selectReviewList();

}
