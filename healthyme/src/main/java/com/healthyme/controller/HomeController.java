package com.healthyme.controller;

import java.util.Locale;

import javax.inject.Inject;

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

import com.healthyme.domain.UserVO;
import com.healthyme.service.UserService;


//@RestController
//@RequestMapping("/controller")
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeGET(Model model) throws Exception {
//		logger.info("홈 화면");
		System.out.println("홈화면");
		return "home";
	}
	
	
	/*@RequestMapping(value = "/", method = RequestMethod.POST)
	public String joinPOST(@ModelAttribute UserVO userVO, Model model) throws Exception {

		userService.join(userVO);
	
		return "redirect:/";
	}*/
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody UserVO userVO) {
		
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
	
	
	
	
	
//	@RequestMapping(value = "/", method = RequestMethod.POST)
//	public String loginPOST(@ModelAttribute UserVO userVO, Model model) throws Exception {
//		
//		int memberIdx = homeMapper.selectMemberIdx(adminVO.getUsername(), adminVO.getPassword());		
//		if(memberIdx > 0) {
//			session.setAttribute("memberIdx", memberIdx);
//			session.setAttribute("username", adminVO.getUsername());
//		} else {
//			Exception e = new Exception("로그인 정보가 틀립니다.");
//			throw e;
//		}		
//		return "redirect:/main.do";
//		return "redirect:/";
//	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Locale locale, Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET(UserVO userVO, Model model) throws Exception {
		
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join2POST(@ModelAttribute UserVO userVO, Model model) throws Exception {
		
		userService.join(userVO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPost(Model model) throws Exception {
		
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(Model model) throws Exception {
		
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
