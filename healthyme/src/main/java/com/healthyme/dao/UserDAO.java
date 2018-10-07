package com.healthyme.dao;

import com.healthyme.domain.UserVO;

public interface UserDAO {
	
	public String getTime();
	
	public void insertUser(UserVO userVO);
	
	public String loginCheck(UserVO userVO);

}
