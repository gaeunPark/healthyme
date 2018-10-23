package com.healthyme.dao;

import java.util.List;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

public interface DietDAO {
	
	public void insertNutrition(UserDietVO dietVO);
	
	public List<UserDietVO> selectDietList(Integer userIdx, String date);
	
	public NutritionVO sumNutri(Integer userIdx, String date);
	
	public List<NutritionVO> sumKcal(Integer userIdx);
}
