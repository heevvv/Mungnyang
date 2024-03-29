package com.heekyung.mungnyang.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.heekyung.mungnyang.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email
			, @Param("petname") String petname);
	
	// id password 일치하는 것 가져오기
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public int idCheck(String loginId);
	
	public User selectUserById(@Param("id") int id);

}