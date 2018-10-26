package com.healthyme.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.healthyme.dao.UserDAO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

@Service
public class UserService{
	
	@Inject
	private UserDAO dao; 
	
	public void join(UserVO userVO) throws Exception{
		dao.insertUser(userVO);
	}
	
	public UserVO loginCheck(UserVO userVO, HttpSession session) throws Exception{
		UserVO vo = dao.loginCheck(userVO);
		return vo;
	}
	
	public void insertWeight(UserInfoVO userInfoVO) throws Exception{
		dao.insertWeight(userInfoVO);
	}
	
	public String selectDayWeight(Integer userIdx, String date) throws Exception{
		System.out.println("service");
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
	
	
	
	
	
	
	
	
	
	
	
	
}
