package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healthyme.domain.UserVO;
import com.healthyme.service.UserService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private UserService userService;

//	@RequestMapping(value = "/openApi", method = RequestMethod.GET)
	public void openApi(HttpServletRequest request, HttpServletResponse response) throws Exception {

		logger.info("api 컨트롤러");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D";
		String parameter = "";

		PrintWriter out = response.getWriter(); // 클라이언트로 보낼 TEXT DATA, JSON에 넣을 때 쭉 나열하는듯

//        parameter = parameter + "&" + "contentId=" + contentId;//JSP에서 받아올 contentid, contentTypeid    
		parameter = parameter + "&" + "numOfRows=" + "1";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		InputStream in = url.openStream(); // URL로 부터 자바로 데이터 읽어오도록 URL객체로 스트림 열기

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream의 데이터들을 바이트 배열로 저장하기 위해
		IOUtils.copy(in, bos1); // InputStream의 데이터를 바이트 배열로 복사
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");
//        System.out.println("mbos 출력\n" + mbos);

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8"); // String으로 풀었다가 byte배열로 했다가 다시 String으로 해서 json에 저장할 배열을 print?? 여긴 잘 모르겠다
//        out.println(s);
		JSONObject json = new JSONObject();
		json.put("data", s);
		out.println(json);
		System.out.println(json.toString());

	}

	@RequestMapping(value = "/openApi", method = RequestMethod.GET)
	public void openApiGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("전송");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int INDENT_FACTOR = 4;
		PrintWriter out = response.getWriter();
		HttpURLConnection conn = (HttpURLConnection) new URL(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?"
						+ "ServiceKey=yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D&numOfRows=50&bgn_year=2017")
								.openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis, "UTF-8"));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
		out.println(xmlJSONObj);
	}
	
	
	@RequestMapping(value = "/openApi2", method = RequestMethod.GET)
	public String openApi2(Model model) throws Exception {
		logger.info("openApi2받음");

		return "openApi2";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/json; charset=UTF-8")
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
			session.setAttribute("idx", vo.getIdx());
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

	// @RequestMapping("/signUp.do")
	// public String signUp(Model model) throws Exception {
	//
	// User user = new User();
	// // UserVO userVO = new UserVO();
	// // homeMapper.insertUser(userVO);
	//
	// model.addAttribute("user", user);
	// return "signUp";
	// }
	//
	// @RequestMapping("/actionSignUp.do")
	// public String actionSignUp(@ModelAttribute @Valid ActionSignUpDTO
	// actionSignUpDTO, BindingResult bindingResult,
	// Model model) throws Exception {
	//
	// if(bindingResult.hasErrors()){
	// return "signUp";
	// }
	//
	// int count = homeMapper.selectUsersCount(actionSignUpDTO.getUsername());
	// if(count == 0){
	// String username = actionSignUpDTO.getUsername();
	// String password = actionSignUpDTO.getPassword();
	// String name = actionSignUpDTO.getName();
	// String email = actionSignUpDTO.getEmail();
	// String phone = actionSignUpDTO.getPhone();
	// String address = actionSignUpDTO.getAddress();
	// homeMapper.insertUser(username, password, name, email, phone, address);
	// } else {
	/// * �뿉�윭 �삁�쇅泥섎━
	// throw new NullPointerException();
	// User user = null;
	// user.getId();
	// user.setName("AAAA");*/
	//
	// return "signUp";
	// }
	// return "redirect:/main.do";
	// }
}
