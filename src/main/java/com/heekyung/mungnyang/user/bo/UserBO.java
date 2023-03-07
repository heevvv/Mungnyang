package com.heekyung.mungnyang.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heekyung.mungnyang.common.EncryptUtils;
import com.heekyung.mungnyang.user.dao.UserDAO;
import com.heekyung.mungnyang.user.model.User;

@Service
public class UserBO {
		
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email
			, String petname) {
		
		
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(loginId, encryptPassword, name, email, petname);

	}
	
	
	
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selectUser(loginId, encryptPassword);
			
	}
	
	
}