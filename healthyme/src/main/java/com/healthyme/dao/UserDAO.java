package com.healthyme.dao;

import java.util.Date;
import java.util.List;

import com.healthyme.domain.LoginDTO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO);
	
	public UserVO loginCheck(LoginDTO dto);
	
	public void insertWeight(UserInfoVO userInfoVO);
	
	public String selectDayWeight(Integer userIdx, String date);
	
	public List<UserInfoVO> selectMonthWeight(Integer userIdx, String month);
	
	public List<UserInfoVO> getMyWeight(Integer userIdx);
	
	public UserVO getUser(Integer userIdx);
	
	public void updateUser(UserVO userVO);
	
	public void keepLogin(String userid, String sessionKey, Date sessionLimit);

	public UserVO UserSessionKey(String value);
}
