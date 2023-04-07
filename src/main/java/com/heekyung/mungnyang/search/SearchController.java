package com.heekyung.mungnyang.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heekyung.mungnyang.search.bo.SearchBO;
import com.heekyung.mungnyang.search.model.Hospital;
import com.heekyung.mungnyang.search.model.Review;
import com.heekyung.mungnyang.search.review.bo.ReviewBO;

@Controller
public class SearchController {
	
	@Autowired
	private SearchBO searchBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/search/list/view")
	public String searchView(Model model) {
		
		List<Hospital> searchList = searchBO.getSearchList();
		model.addAttribute("searchList", searchList);
		
		return "search/list";
		
	}
	
	@GetMapping("/search/detail/view")
	public String detailView(
	        @RequestParam("searchId") int searchId
	        , Model model) {

	    Hospital hospital = searchBO.getSearch(searchId);
	    List<Review> reviewList = reviewBO.getReviewListByHospitalId(searchId);

	    model.addAttribute("hospital",hospital);
	    model.addAttribute("reviewList",reviewList);

	    return "search/detail";
	}
	
	
	@GetMapping("/search/review/view")
	public String reviewView() {
		return "search/review";
	}

}