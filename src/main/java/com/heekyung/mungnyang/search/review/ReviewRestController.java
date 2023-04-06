package com.heekyung.mungnyang.search.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.heekyung.mungnyang.search.review.bo.ReviewBO;

@RestController
public class ReviewRestController {
	
	@Autowired
	private ReviewBO reviewBO;

	@PostMapping("/search/review/create")
	public Map<String, String>createReview(
			@RequestParam("hospitalId") int hospitalId
			, @RequestParam("content") String content
			, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = reviewBO.addReview(userId, hospitalId, content);
	
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
	
		return result;
	
	
	}

}
