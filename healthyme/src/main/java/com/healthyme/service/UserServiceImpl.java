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
	
	public String loginCheck(UserVO userVO, HttpSession session) throws Exception{
		String username = dao.loginCheck(userVO);
		if(username != null) {
			session.setAttribute("username", username);
		}
		return username;
	}
}
