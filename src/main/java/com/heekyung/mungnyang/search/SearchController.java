package com.heekyung.mungnyang.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.heekyung.mungnyang.search.bo.SearchBO;
import com.heekyung.mungnyang.search.model.Hospital;

@Controller
public class SearchController {
	
	@Autowired
	private SearchBO searchBO;
	
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
		
		model.addAttribute("hospital",hospital);

		return "search/detail";
	}
	

}