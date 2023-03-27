package com.heekyung.mungnyang.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchController {
	
	@GetMapping("/search/list/view")
	public String searchView() {
		return "search/list";
		
	}
	

}