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
@RequestMapping("/community/*")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public void community(Model model) throws Exception {
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("postIdx") int postIdx, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createGet(Model model) throws Exception {
		logger.info("createGet.....");
	}
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public void createPost(Model model) throws Exception {
		logger.info("createPost.....");
	}
	


}
