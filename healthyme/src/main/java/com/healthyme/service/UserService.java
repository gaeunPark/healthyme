package com.healthyme.service;

import javax.servlet.http.HttpSession;

import com.healthyme.domain.UserVO;

public interface UserService {

	public void join(UserVO userVO) throws Exception;
	
	public String loginCheck(UserVO userVO, HttpSession session) throws Exception;
}
