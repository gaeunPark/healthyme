package com.healthyme.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.LoginDTO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.healthyme.mapper.userMapper";

	@Override
	public void insertUser(UserVO userVO) {
		sqlSession.insert(namespace+".insertUser", userVO);
	}
	
	@Override
	public UserVO loginCheck(LoginDTO dto) {
		return sqlSession.selectOne(namespace + ".loginCheck", dto);
	}
	
	@Override
	public void insertWeight(UserInfoVO userInfoVO) {
		sqlSession.insert(namespace + ".insertWeight", userInfoVO);
	}
	
	@Override
	public String selectDayWeight(Integer userIdx, String date) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("date", date);
		return sqlSession.selectOne(namespace + ".selectDayWeight", paramMap);
	}
	@Override
	public List<UserInfoVO> selectMonthWeight(Integer userIdx, String month){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("month", month);
		return sqlSession.selectList(namespace + ".selectMonthWeight", paramMap);
	}
	@Override
	public List<UserInfoVO> getMyWeight(Integer userIdx){
		return sqlSession.selectList(namespace + ".getMyWeight", userIdx);
	}
	@Override
	public UserVO getUser(Integer userIdx) {
		return sqlSession.selectOne(namespace + ".getUser", userIdx);
	};
	@Override
	public void updateUser(UserVO userVO) {
		sqlSession.update(namespace + ".updateUser", userVO);
	};
	
	@Override
	public void keepLogin(String userid, String sessionKey, Date sessionLimit) {
	    Map<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("userid", userid);
	    paramMap.put("sessionKey", sessionKey);
	    paramMap.put("sessionLimit", sessionLimit);
	    
	    sqlSession.update(namespace+".keepLogin", paramMap);
	  }

	@Override
	public UserVO UserSessionKey(String value) {
	    return sqlSession.selectOne(namespace +".UserSessionKey", value);
	}

}