package com.heekyung.mungnyang.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("/main/menu/view")
	public String menuView() {
		return "main/menu";
		
	}
	
	
}