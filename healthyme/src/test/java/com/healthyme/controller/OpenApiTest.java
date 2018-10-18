package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.cxf.helpers.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.junit.Test;

import com.healthyme.domain.NutritionVO;

public class OpenApiTest {

//	@Test
	public void test() throws Exception {

		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D";
		String parameter = "";
		parameter = parameter + "&" + "desc_kor=" + URLEncoder.encode("바나나", "UTF-8");
		parameter = parameter + "&" + "bgn_year=" + "2017";
		parameter = parameter + "&" + "numOfRows=" + "50";

		addr = addr + serviceKey + parameter;
		URL url = new URL(addr);

		System.out.println(addr);

		InputStream in = url.openStream(); // URL�� ���� �ڹٷ� ������ �о������ URL��ü�� ��Ʈ�� ����
		//
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream(); // InputStream�� �����͵��� ����Ʈ �迭�� �����ϱ� ����
		IOUtils.copy(in, bos1); // InputStream�� �����͸� ����Ʈ �迭�� ����
		in.close();
		bos1.close();
		//
		String mbos = bos1.toString("UTF-8");
		//
		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8"); // String���� Ǯ���ٰ� byte�迭�� �ߴٰ� �ٽ� String���� �ؼ� json�� ������ �迭��
											// print?? ���� �� �𸣰ڴ�
		System.out.println(s);
		//
		JSONObject json = new JSONObject();
		json.put("data", s);
	}

	public static int INDENT_FACTOR = 4;

	@Test
	public void test4() throws Exception {

		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D";
		String parameter = "";
		parameter = parameter + "&" + "desc_kor=" + URLEncoder.encode("바나나", "UTF-8");
		parameter = parameter + "&" + "bgn_year=" + "2017";
		parameter = parameter + "&" + "numOfRows=" + "3";

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

		JSONObject JSONObj = XML.toJSONObject(st.toString());
		String JsonString = JSONObj.toString(INDENT_FACTOR);
		
		
		JSONObject jObject = JSONObj.getJSONObject("response");
		JSONObject body = jObject.getJSONObject("body");
		JSONObject items = body.getJSONObject("items");	
		JSONArray item = (JSONArray)items.get("item");

		List<NutritionVO> list = new ArrayList<NutritionVO>(); 

		for(int i=0; i<item.length(); i++) {
			JSONObject json = (JSONObject) item.get(i);
			NutritionVO vo = new NutritionVO();
//			
//			vo.setFoodName(json.optString("DESC_KOR"));
//			vo.setFoodName(json.optString("SERVING_WT"));
//			vo.setFoodName(json.optString("NUTR_CONT1"));
//			vo.setFoodName(json.optString("NUTR_CONT2"));
//			vo.setFoodName(json.optString("NUTR_CONT3"));
//			vo.setFoodName(json.optString("NUTR_CONT4"));
//			vo.setFoodName(json.optString("NUTR_CONT8"));
//			vo.setFoodName(json.optString("NUTR_CONT9"));
//			vo.setFoodName(json.optString("NUTR_CONT5"));
//			vo.setFoodName(json.optString("NUTR_CONT6"));
//			vo.setFoodName(json.optString("NUTR_CONT7"));
//			vo.setFoodName(json.optString("ANIMAL_PLANT"));
					
			list.add(vo);
		}

	}

	
	
//	@Test
	public void test5() throws Exception {
		StringBuilder urlBuilder = new StringBuilder(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D"); /*
																															 * Service
																															 * Key
																															 */
		urlBuilder.append(
				"&" + URLEncoder.encode("desc_kor", "UTF-8") + "=" + URLEncoder.encode("사과", "UTF-8")); /* 식품이름 */
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append(
				"&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /* 한 페이지 결과 수 */
		urlBuilder.append(
				"&" + URLEncoder.encode("bgn_year", "UTF-8") + "=" + URLEncoder.encode("2017", "UTF-8")); /* 구축년도 */
//        urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" + URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/

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
		System.out.println(jsonPrettyPrintString);
		System.out.println();
	}

}
