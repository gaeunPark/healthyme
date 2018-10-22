package com.healthyme.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healthyme.dao.DietDAO;
import com.healthyme.dao.UserDAO;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })

public class UserDAOTest {

	@Inject
	private UserDAO dao;
	@Inject
	private DietDAO dietDao;

//	@Test
	public void testTime() throws Exception {
		System.out.println("getTime() = " + dao.getTime());

	}

//    @Test
	public void testInsertUser() throws Exception {
		UserVO userVO = new UserVO();
		userVO.setUserid("user_id05");
		userVO.setUserpw("user_pw02");
		userVO.setUsername("USER02");
		userVO.setEmail("user02@joy.org");

		dao.insertUser(userVO);
	}

//    @Test
	public void testInserNutrition() throws Exception {
		UserDietVO dietVO = new UserDietVO();
		dietVO.setUserIdx(1);
		dietVO.setFoodName("safdfa");
		
		dietDao.insertNutrition(dietVO);
	}
//	@Test
	public void date() throws Exception {
		List<UserDietVO> dietList = new ArrayList<UserDietVO>();
		dietList = dietDao.selectDietList(1, "2018-10-18");
		System.out.println(dietList.size());
	}
//	@Test
	public void sumNutri() throws Exception {
		NutritionVO sumNutri = dietDao.sumNutri(1, "2018-10-19");
		sumNutri.toString();
	}	
//	@Test
	public void insertWeight() throws Exception {
		UserInfoVO vo = new UserInfoVO();
		vo.setUserIdx(1);
		vo.setWeight("85.5");
		vo.setDate("2018-10-19");
		dao.insertWeight(vo);
	}
//	@Test
	public void selectWeight() throws Exception {
		String weight = dao.selectDayWeight(1, "2018-10-19");
		System.out.println(weight);
	}
	@Test
	public void selectMonthWeight() throws Exception {
		List<UserInfoVO> list = dao.selectMonthWeight(1, 10);
		System.out.println(list);
	}


}
