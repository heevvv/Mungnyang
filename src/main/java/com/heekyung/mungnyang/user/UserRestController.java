package com.heekyung.mungnyang.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.heekyung.mungnyang.user.bo.UserBO;
import com.heekyung.mungnyang.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("petname") String petname) {
		
		int count = userBO.addUser(loginId, password, name, email, petname);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			// 세션에 값 저장
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("userPetname", user.getPetname());

			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	
	
	
	// 아이디 중복 확인 기능
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userBO.duplicateId(loginId);
		
		
		Map<String, Boolean> result = new HashMap<>();

		
		result.put("is_duplicate", isDuplicate);
		
		return result;
	}
	
	
	
	
}
