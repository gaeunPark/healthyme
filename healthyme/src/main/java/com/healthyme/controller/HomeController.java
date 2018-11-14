package com.healthyme.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.healthyme.domain.LoginDTO;
import com.healthyme.domain.UserVO;
import com.healthyme.service.UserService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeGET(Model model) throws Exception {
		logger.info("홈 화면");
		return "home";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(Model model) throws Exception {
	}


}
