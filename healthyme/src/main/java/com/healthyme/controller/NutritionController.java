package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nutrition")
public class NutritionController {
	
	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void ntrGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		logger.info("영양api 정보 보내기");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int INDENT_FACTOR = 4;
		PrintWriter out = response.getWriter();
		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D";
		String parameter = "";
		parameter = parameter + "&" + "bgn_year=" + "2017";
		parameter = parameter + "&" + "numOfRows=" + "50";

		addr = addr + serviceKey + parameter;
		
		HttpURLConnection conn = (HttpURLConnection) new URL(addr).openConnection();
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

}
