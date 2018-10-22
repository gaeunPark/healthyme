package com.healthyme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.service.DietService;
import com.healthyme.service.UserService;

@RestController
public class ApiController {

	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);
	
	@Inject
	private DietService dietService;
	
	@Inject
	private UserService userService;
	
	@GetMapping("/test/test")
	public NutritionVO test() throws Exception {
		
		NutritionVO sumNutri = dietService.sumNutri(1, "2018-10-19");
		
		return sumNutri;
	}
	
	@RequestMapping(value = "/user/myPagePOST",   method = {RequestMethod.GET})
	public String myPagePOST(HttpSession session, Model model, @RequestBody UserDietVO dietVO) throws Exception {
		logger.info("마이페이지post");

		String date = dietVO.getDate();
		System.out.println(date);
		
		Integer userIdx = (Integer)session.getAttribute("userIdx");
		System.out.println(userIdx);
//		String date = "2018-10-18"; 	
		List<UserDietVO> dietLists = dietService.selectDietList(userIdx, date);
		NutritionVO sumNutri = dietService.sumNutri(userIdx, date);
		
		System.out.println(sumNutri.getSumKcal());
		//model.addAttribute("dietLists", dietLists);
		//model.addAttribute("sumNutri", sumNutri);
		
		return date;
	}
	
	@RequestMapping(value = "user/addWeight", method = RequestMethod.POST)
	public ResponseEntity<String> addWeight(HttpSession session, @RequestBody UserInfoVO infoVO) {	
		logger.info("체중정보 넣기 ...........");
				
		ResponseEntity<String> entity = null;
		try {
			int userIdx = (Integer)session.getAttribute("userIdx");
			infoVO.setUserIdx(userIdx);

			userService.insertWeight(infoVO);			
			logger.info("OK... vo = " + infoVO.toString());	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping("user/selectWeightInfo")
	public List<UserInfoVO> selectChartInfo(HttpSession session) {	
		logger.info("체중정보 가져오기 ...........");
		List<UserInfoVO> list = null;
		
		try {
			int userIdx = (Integer)session.getAttribute("userIdx");
			int month = 10;
			list = userService.selectMonthWeight(userIdx, month);
			
			logger.info("OK... vo = " + list.toString());	
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return list;
	}
}
