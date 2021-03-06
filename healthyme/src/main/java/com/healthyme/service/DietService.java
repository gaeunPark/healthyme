package com.healthyme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.DietDAO;
import com.healthyme.domain.CalenderDTO;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;
import com.healthyme.domain.UserVO;

@Service
public class DietService {
	
	@Inject
	private DietDAO dao;
	
	public void insertNutrition(UserDietVO dietVO) throws Exception{
		dao.insertNutrition(dietVO);
	}
	
	public List<UserDietVO> selectDietList(Integer userIdx, String date) throws Exception{
		return dao.selectDietList(userIdx, date);
	}
	
	public NutritionVO sumNutri(Integer userIdx, String date) throws Exception{
		return dao.sumNutri(userIdx, date);
	}
	public List<CalenderDTO> CalenderKcal(UserVO userVO) throws Exception {
		return dao.CalenderKcal(userVO);
	}
	public List<NutritionVO> selectMonthKcal(Integer userIdx, String month) throws Exception {
		return dao.selectMonthKcal(userIdx, month);
	}
	public NutritionVO avgNutri(Integer userIdx, String month) throws Exception {
		return dao.avgNutri(userIdx, month);
	}
}
