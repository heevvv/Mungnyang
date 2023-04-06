package com.heekyung.mungnyang.search.review.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewDAO {
	
	public int insertReview(
			@Param("userId") int userId
			, @Param("hospitalId") int hospitalId
			, @Param("content") String content);

}
