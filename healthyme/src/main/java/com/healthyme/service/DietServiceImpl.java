package com.healthyme.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.DietDAO;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

@Service
public class DietServiceImpl implements DietService {
	
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
}
