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

	@RequestMapping(value = "/loginPOST", method = RequestMethod.POST)
	public String loginPOST(@ModelAttribute UserVO userVO, Model model, HttpSession session) throws Exception {
		logger.info("로그인 처리");
		UserVO vo = userService.loginCheck(userVO, session);
		String username = vo.getUsername();

		if (username != null) {
			session.setAttribute("username", username);
			session.setAttribute("userIdx", vo.getUserIdx());
		} else {
			Exception e = new Exception("로그인 정보가 틀립니다.");
			throw e;
		}
		return "redirect:/";
	}


	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Locale locale, Model model) throws Exception {
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test(Model model) throws Exception {
	}

	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public void nav(Model model) throws Exception {
	}

}
