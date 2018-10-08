package com.healthyme.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.healthyme.dao.UserDAO;
import com.healthyme.domain.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao; 
	
	public void join(UserVO userVO) throws Exception{
		dao.insertUser(userVO);
	}
	
	public UserVO loginCheck(UserVO userVO, HttpSession session) throws Exception{
		UserVO vo = dao.loginCheck(userVO);
		return vo;
	}
}
