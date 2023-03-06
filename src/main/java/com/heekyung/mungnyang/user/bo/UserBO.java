package com.heekyung.mungnyang.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.heekyung.mungnyang.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email
			, String petname
			, MultipartFile petImage) {
		
		return userDAO.insertUser(loginId, password, name, email, petname, petImage);
	}
	
}