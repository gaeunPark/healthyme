package com.healthyme.service;

import java.util.Date;
import java.util.List;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

public interface DietService {
	public void insertNutrition(UserDietVO dietVO) throws Exception;
	
	public List<UserDietVO> selectDietList(Integer userIdx, String date) throws Exception;
	
	public NutritionVO sumNutri(Integer userIdx, String date) throws Exception;
}
