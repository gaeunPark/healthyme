package com.healthyme.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;
import com.healthyme.domain.UserVO;
import com.healthyme.service.DietService;
import com.healthyme.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService userService;
	
	@Inject
	private DietService dietService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ResponseEntity<String> join(@RequestBody UserVO userVO) {
		logger.info("회원가입 ...........");
				
		ResponseEntity<String> entity = null;
		try {
			userService.join(userVO);
			logger.info("OK... vo = " + userVO.toString());	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/addNutri", method = RequestMethod.POST)
	public ResponseEntity<String> addNutri(HttpSession session, @RequestBody UserDietVO dietVO) {
		
		logger.info("식단정보넣기 ...........");
				
		ResponseEntity<String> entity = null;
		try {
			int userIdx = (Integer)session.getAttribute("userIdx");
			dietVO.setUserIdx(userIdx);
			dietVO.setTimeslot(1);
			
			dietService.insertNutrition(dietVO);
			logger.info("OK... vo = " + dietVO.toString());	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/calender", method = RequestMethod.GET)
	public void cal(Model model) throws Exception {
		logger.info("calender");

	}
	
	@RequestMapping(value = "/myPage",   method = {RequestMethod.GET})
	public void myPageGET(@RequestParam("date") String date, HttpSession session, Model model) throws Exception {
		logger.info("마이페이지");
	
		Integer userIdx = (Integer)session.getAttribute("userIdx");
		
		List<UserDietVO> dietLists = dietService.selectDietList(userIdx, date);
		NutritionVO sumNutri = dietService.sumNutri(userIdx, date);
		String weight = userService.selectDayWeight(userIdx, date);

		model.addAttribute("dietLists", dietLists);
		model.addAttribute("sumNutri", sumNutri);
		model.addAttribute("weight", weight);
	}

	
	@RequestMapping(value = "/myChart", method = RequestMethod.GET)
	public void myChart(Model model) throws Exception {
		logger.info("myChart");
		
	}
	


}
