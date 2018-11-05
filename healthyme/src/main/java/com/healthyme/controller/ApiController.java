package com.healthyme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.healthyme.domain.CalenderDTO;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserInfoVO;
import com.healthyme.domain.UserVO;
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
		
	@RequestMapping(value = "user/addWeight", method = RequestMethod.POST)
	public ResponseEntity<String> addWeight(HttpSession session, @RequestBody UserInfoVO infoVO) {	
		logger.info("체중정보 넣기 ...........");
		
		ResponseEntity<String> entity = null;
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");	
			infoVO.setUserIdx(userVO.getUserIdx());
			userService.insertWeight(infoVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);		
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	
	@RequestMapping(value = "user/getWeightEvents", method = RequestMethod.POST)
	public List<CalenderDTO> getWeightEvents(HttpSession session) {	
		logger.info("달력정보(체중) 가져오기 ...........");
		List<CalenderDTO> list = null;
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");
			list = userService.CalenderWeight(userVO);
	
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return list;
	}
	
	@RequestMapping(value = "user/getKcalEvents", method = RequestMethod.POST)
	public List<CalenderDTO> getKcalEvents(HttpSession session) {	
		logger.info("달력정보(칼로리) 가져오기 ...........");
		List<CalenderDTO> list = null;
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");
			list = dietService.CalenderKcal(userVO);

		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return list;
	}
	
	@RequestMapping(value = "user/selectMonthWeight", method = RequestMethod.POST)
	public List<UserInfoVO> selectMonthWeight(HttpSession session, @RequestParam("month") String month) {	
		logger.info("한달 체중정보 가져오기 ...........");
		List<UserInfoVO> list = null;
		
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");
			
			list = userService.selectMonthWeight(userVO.getUserIdx(), month);
//			System.out.println("체중정보" + list);
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return list;
	}
	
	@RequestMapping(value = "user/selectMonthKcal", method = RequestMethod.POST)
	public List<NutritionVO> selectMonthKcal(HttpSession session, @RequestParam("month") String month) {	
		logger.info("한달칼로리 가져오기 ...........");
		List<NutritionVO> list = null;
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");
			
			list = dietService.selectMonthKcal(userVO.getUserIdx(), month);
//			System.out.println("한달칼로리" + list);
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return list;
	}
	
	@RequestMapping(value = "user/avgNutri", method = RequestMethod.POST)
	public NutritionVO avgNutri(HttpSession session, @RequestParam("month") String month) {	
		logger.info("평균Ntr 가져오기 ...........");
		NutritionVO avgNtr = null;
		try {
			UserVO userVO = (UserVO)session.getAttribute("login");
			avgNtr = dietService.avgNutri(userVO.getUserIdx(), month);
//			System.out.println("평균Ntr" + avgNtr);
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
		}		
		return avgNtr;
	}
}
