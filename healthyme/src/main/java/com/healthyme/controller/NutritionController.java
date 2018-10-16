package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
			@ModelAttribute("searchKey") String searchKey) throws Exception {

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
		parameter = parameter + "&" + "numOfRows=" + "50";
		int pageNo = 1;
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

		String JsonString = JSONObj.toString();
//		System.out.println(JsonString);

		JSONObject jObject = JSONObj.getJSONObject("response");
		JSONObject body = jObject.getJSONObject("body");
		String totalCount = body.optString("totalCount");
		System.out.println(totalCount);

	}

	public String[] Parser(String JsonString) {
		String foodName = null;
		float kcal = 0;

		String[] a = new String[8];

		return a;
	}

	@RequestMapping(value = "/searchNutri", method = RequestMethod.GET, produces = "text/json; charset=UTF-8")
	public void searchNutri(Model model) throws Exception {
		logger.info("nutrition/searchNutri 화면");

	}

	@RequestMapping(value = "/searchNutri2?searchKey={searchKey}", method = RequestMethod.GET, produces = "text/json; charset=UTF-8")
	public String searchNutri2(@PathVariable("searchKey") String searchKey, Model model) throws Exception {
		logger.info("nutrition/aaa 화면");
		System.out.println(searchKey);
		return searchKey;
	}

	// @RequestMapping(value = "/", method = RequestMethod.GET)
	public void ntrGET2(HttpServletRequest request, HttpServletResponse response, @RequestParam String searchKey)
			throws Exception {
		logger.info("예제욤");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		System.out.println(searchKey);
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
		urlBuilder.append(
				"&" + URLEncoder.encode("desc_kor", "UTF-8") + "=" + URLEncoder.encode(searchKey, "UTF-8")); /* 식품이름 */
		// urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" +
		// URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
				+ URLEncoder.encode("30", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("bgn_year", "UTF-8") + "=" + URLEncoder.encode("2017", "UTF-8")); /* 구축년도 */
		// urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" +
		// URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/

		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;

		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());
		String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
		out.println(jsonPrettyPrintString);
		System.out.println(jsonPrettyPrintString);
	}

}
