package com.healthyme.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.healthyme.domain.UserVO;
import com.healthyme.service.UserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private UserService userService;
	
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public String homeGET(Model model) throws Exception {
//		
//		return "home";
//	}
	
	/*@RequestMapping(value = "/", method = RequestMethod.POST)
	public String joinPOST(@ModelAttribute UserVO userVO, Model model) throws Exception {

		userService.join(userVO);
	
		return "redirect:/";
	}*/
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> join(@RequestBody UserVO userVO) {
		
		logger.info("insert POST called ...........");
				
		ResponseEntity<String> entity = null;
		try {
			userService.join(userVO);
//			logger.info("OK... vo = " + userVO.toString());	
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

}
