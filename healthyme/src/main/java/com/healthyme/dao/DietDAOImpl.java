package com.healthyme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

@Repository
public class DietDAOImpl implements DietDAO{
	
	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "com.healthyme.mapper.dietMapper";
	
	public void insertNutrition(UserDietVO dietVO) {
		sqlsession.insert(namespace + ".insertNutrition", dietVO);
	};
	
	public List<UserDietVO> selectDietList(Integer userIdx, String date) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("date", date);
		return sqlsession.selectList(namespace + ".selectDietList", paramMap);
	};
	
	public NutritionVO sumNutri(Integer userIdx, String date) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("date", date);
		return sqlsession.selectOne(namespace + ".sumNutri", paramMap);
	}
	public List<NutritionVO> sumKcal(Integer userIdx) {
		return sqlsession.selectList(namespace + ".sumKcal", userIdx);
	}
}
