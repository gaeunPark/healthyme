package com.healthyme.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.healthyme.domain.UserVO;
import com.healthyme.service.UserService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Locale locale, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(UserVO userVO, Model model) throws Exception {
		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(@ModelAttribute UserVO userVO, Model model) throws Exception {
		
		userService.join(userVO);
		
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginPost(Model model) throws Exception {
		
	}
	
	
	
//	@RequestMapping("/signUp.do")
//	public String signUp(Model model) throws Exception {
//
//		User user = new User();
//		//		UserVO userVO = new UserVO();	
//		//		homeMapper.insertUser(userVO);
//		
//		model.addAttribute("user", user);
//		return "signUp";
//	}
//	
//	@RequestMapping("/actionSignUp.do")
//	public String actionSignUp(@ModelAttribute @Valid ActionSignUpDTO actionSignUpDTO, BindingResult bindingResult,
//			Model model) throws Exception {
//		
//		if(bindingResult.hasErrors()){
//			return "signUp";
//		}
//		
//		int count = homeMapper.selectUsersCount(actionSignUpDTO.getUsername());
//		if(count == 0){
//			String username = actionSignUpDTO.getUsername();
//			String password = actionSignUpDTO.getPassword();
//			String name = actionSignUpDTO.getName();
//			String email = actionSignUpDTO.getEmail();
//			String phone = actionSignUpDTO.getPhone();
//			String address = actionSignUpDTO.getAddress();
//			homeMapper.insertUser(username, password, name, email, phone, address);
//		} else {
///*			�뿉�윭 �삁�쇅泥섎━
//			throw new NullPointerException();
//			User user = null;
//			user.getId();
//			user.setName("AAAA");*/
//			
//			return "signUp";
//		}
//		return "redirect:/main.do";
//	}
}
