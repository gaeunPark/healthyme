package com.healthyme.persistence;

import com.healthyme.domain.UserVO;

public interface UserDAO {
	
	public String getTime();
	
	public void insertUser(UserVO userVO);

}
