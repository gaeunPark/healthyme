package com.healthyme.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.UserDAO;
import com.healthyme.domain.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO userDAO; 
	
	public void join(UserVO userVO) throws Exception{
		userDAO.insertUser(userVO);
	}
}
