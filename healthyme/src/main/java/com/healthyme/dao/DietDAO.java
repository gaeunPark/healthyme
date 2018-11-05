package com.healthyme.dao;

import java.util.List;

import com.healthyme.domain.CalenderDTO;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;
import com.healthyme.domain.UserVO;

public interface DietDAO {
	
	public void insertNutrition(UserDietVO dietVO);
	
	public List<UserDietVO> selectDietList(Integer userIdx, String date);
	
	public NutritionVO sumNutri(Integer userIdx, String date);
	
	public List<CalenderDTO> CalenderKcal(UserVO userVO);
	
	public List<NutritionVO> selectMonthKcal(Integer userIdx, String month);
	
	public NutritionVO avgNutri(Integer userIdx, String month);
}
