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
	@Override
	public void insertNutrition(UserDietVO dietVO) {
		sqlsession.insert(namespace + ".insertNutrition", dietVO);
	};
	@Override
	public List<UserDietVO> selectDietList(Integer userIdx, String date) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("date", date);
		return sqlsession.selectList(namespace + ".selectDietList", paramMap);
	};
	@Override
	public NutritionVO sumNutri(Integer userIdx, String date) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("date", date);
		return sqlsession.selectOne(namespace + ".sumNutri", paramMap);
	}
	@Override
	public List<NutritionVO> sumKcal(Integer userIdx) {
		return sqlsession.selectList(namespace + ".sumKcal", userIdx);
	}
	@Override
	public List<NutritionVO> selectMonthKcal(Integer userIdx, String month){
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("month", month);
		return sqlsession.selectList(namespace + ".selectMonthKcal", paramMap);
	};
	@Override
	public NutritionVO avgNutri(Integer userIdx, String month) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userIdx", userIdx);
		paramMap.put("month", month);
		return sqlsession.selectOne(namespace + ".avgNutri", paramMap);
	};
}
