package com.healthyme.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.UserDAO;
import com.healthyme.domain.LoginDTO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

@Service
public class UserService{
	
	@Inject
	private UserDAO dao; 
	
	public void join(UserVO userVO) throws Exception{
		dao.insertUser(userVO);
	}
	
	public UserVO loginCheck(LoginDTO dto) throws Exception{
		return dao.loginCheck(dto);	 
	}
	
	public void insertWeight(UserInfoVO userInfoVO) throws Exception{
		dao.insertWeight(userInfoVO);
	}
	
	public String selectDayWeight(Integer userIdx, String date) throws Exception{
		return dao.selectDayWeight(userIdx, date);
	}
	
	public List<UserInfoVO> selectMonthWeight(Integer userIdx, String month) throws Exception{
		return dao.selectMonthWeight(userIdx, month);
	}
	public List<UserInfoVO> getMyWeight(Integer userIdx) throws Exception{
		return dao.getMyWeight(userIdx);
	}
	
	public UserVO getUser(Integer userIdx) throws Exception{
		return dao.getUser(userIdx);
	}
	
	public void updateUser(UserVO userVO) throws Exception{
		dao.updateUser(userVO);
	}
	
	public void keepLogin(String userid, String sessionKey, Date sessionLimit) throws Exception{
		dao.keepLogin(userid, sessionKey, sessionLimit);
	}

	public UserVO UserSessionKey(String value) throws Exception{
		return dao.UserSessionKey(value);
	}
	
	
	
	
	
	
	
	
	
	
}
