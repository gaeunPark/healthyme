package com.healthyme.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.XML;
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

import com.healthyme.domain.Criteria;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.PageMaker;
import com.healthyme.service.DietService;

@Controller
@RequestMapping("/nutrition")
public class NutritionController {

	private static final Logger logger = LoggerFactory.getLogger(NutritionController.class);
	public static int INDENT_FACTOR = 4;
	
	@RequestMapping(value = "/readNutri", method = RequestMethod.GET, produces = "text/json; charset=UTF-8")
	public void readNutri(Model model) throws Exception {
		logger.info("nutrition/readNutri 화면");
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void ntrGET3(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("searchKey") String searchKey, @ModelAttribute("pageNo") String pageNo) throws Exception {

		logger.info("search");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// System.out.println(searchKey);

		StringBuffer buffer = new StringBuffer();

		PrintWriter out = response.getWriter();
		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D";
		String parameter = "";
		parameter = parameter + "&" + "desc_kor=" + URLEncoder.encode(searchKey, "UTF-8");
		parameter = parameter + "&" + "bgn_year=" + "2017";
		parameter = parameter + "&" + "numOfRows=" + "30";
		pageNo = "1";
//		if (pageNo == null) {
//			pageNo = "1";
//		}
		parameter = parameter + "&" + "pageNo=" + URLEncoder.encode(pageNo + "", "UTF-8");

		addr = addr + serviceKey + parameter;

		HttpURLConnection conn = (HttpURLConnection) new URL(addr).openConnection();
		conn.connect();
		if (conn.getResponseCode() == conn.HTTP_OK) {

			BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
			BufferedReader reader = new BufferedReader(new InputStreamReader(bis, "UTF-8"));

			String line;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
		} else {
			logger.info("통신결과:" + conn.getResponseCode() + "에러");
		}
	
		// Json으로 변환
		JSONObject JSONObj = XML.toJSONObject(buffer.toString());
		out.println(JSONObj);

//		String JsonString = JSONObj.toString();
//		System.out.println(JsonString);
		
		//total 갯수
		JSONObject jObject = JSONObj.getJSONObject("response");
		JSONObject body = jObject.getJSONObject("body");
		String totalCount = body.optString("totalCount");
		System.out.println(totalCount);

	}

	@RequestMapping(value = "/searchNutri", method = RequestMethod.GET, produces = "text/json; charset=UTF-8")
	public void searchNutri(@ModelAttribute Criteria cri, Model model) throws Exception {
		logger.info("nutrition/searchNutri 화면");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(50);
		model.addAttribute("pageMaker", pageMaker);	
	}	


}
