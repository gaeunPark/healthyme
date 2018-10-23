package com.healthyme.dao;

import java.util.List;

import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

public interface UserDAO {
	
	public String getTime();
	
	public void insertUser(UserVO userVO);
	
	public UserVO loginCheck(UserVO userVO);
	
	public void insertWeight(UserInfoVO userInfoVO);
	
	public String selectDayWeight(Integer userIdx, String date);
	
	public List<UserInfoVO> selectMonthWeight(Integer userIdx, Integer month);
	
	public List<UserInfoVO> getMyWeight(Integer userIdx);
}
