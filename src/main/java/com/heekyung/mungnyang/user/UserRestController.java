package com.heekyung.mungnyang.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.heekyung.mungnyang.user.bo.UserBO;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("petname") String petname
			, @RequestParam("petImage") MultipartFile petImage
			) {
		
		int count = userBO.addUser(loginId, password, name, email, petname, petImage);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
		
		
	}
}
