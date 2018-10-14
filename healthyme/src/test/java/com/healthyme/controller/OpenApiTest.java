package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.apache.cxf.helpers.IOUtils;
import org.json.JSONObject;
import org.json.XML;
import org.junit.Test;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

public class OpenApiTest {

	// @Test
	public void test() throws Exception {
		// request.setCharacterEncoding("utf-8");
		// response.setContentType("text/html; charset=utf-8");
		//
		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D";
		String parameter = "";

		// PrintWriter out = response.getWriter(); // Ŭ���̾�Ʈ�� ���� TEXT DATA, JSON��
		// ���� �� �� �����ϴµ�

		// parameter = parameter + "&" + "contentId=" + contentId;//JSP���� �޾ƿ�
		// contentid, contentTypeid

		parameter = parameter + "&" + "numOfRows=" + "50";
		// parameter = parameter + "&" + "_type=json";

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

//	 @Test
	public void test2() throws Exception {

		HttpURLConnection conn = (HttpURLConnection) new URL(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?"
						+ "ServiceKey=yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D")
								.openConnection();
		conn.connect();
		BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
		BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
		StringBuffer st = new StringBuffer();
		String line;
		while ((line = reader.readLine()) != null) {
			st.append(line);
		}

		JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
		String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
		System.out.println(jsonPrettyPrintString);

	}

//	@Test
	public void test3() throws Exception {

		String BASE_URL = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String naverMapKey = "yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D";
		String searchCood = "&numOfRows=10"; // 데이터를 10개씩 가져옴, 페이징 하려면 start 숫자를
												// 동적으로 변경. ex) 1, 11, 21 ..
		String query = "";

		query = URLEncoder.encode(query, "utf-8");
		XPath xpath = XPathFactory.newInstance().newXPath();
		Document documentInfo = DocumentBuilderFactory.newInstance().newDocumentBuilder()
				.parse(BASE_URL + naverMapKey + searchCood + "&coord=latlng&query=" + query);

		NodeList items2 = (NodeList) xpath.evaluate("//body/totalCount", documentInfo, XPathConstants.NODESET);
		NodeList items = (NodeList) xpath.evaluate("//item", documentInfo, XPathConstants.NODESET);
		NodeList mapxs = (NodeList) xpath.evaluate("//item/DESC_KOR", documentInfo, XPathConstants.NODESET);
		NodeList mapys = (NodeList) xpath.evaluate("//item/SERVING_WT", documentInfo, XPathConstants.NODESET);
		NodeList titles = (NodeList) xpath.evaluate("//item/NUTR_CONT1", documentInfo, XPathConstants.NODESET);

		for (int i = 0; i < items.getLength(); i++) {
			System.out.println(mapxs.item(i).getTextContent());
			System.out.println(mapys.item(i).getTextContent());
			System.out.println(titles.item(i).getTextContent());

		}
	}
	
//	@Test
	public void test4() throws Exception{

			String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
			String serviceKey = "97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D";
			String parameter = "";
//			parameter = parameter + "&" + "desc_kor=" + "바나나";
//			parameter = parameter + "&" + "pageNo=" + Integer.toString(i);
			parameter = parameter + "&" + "numOfRows=" + "30";
			parameter = parameter + "&" + "bgn_year=" + "2017";
			
	
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
			System.out.println(jsonPrettyPrintString);
	}
	
	
	
	@Test
	public void test5() throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=97emcv5MflEm6HTC%2BCfsWm1SgpKGj89K9kWIu9hckcNUme%2BX9FHGxsNms1%2BmW5zQ5ih0TDIY6R7xI%2FePfI6rlQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("desc_kor","UTF-8") + "=" + URLEncoder.encode("사과", "UTF-8")); /*식품이름*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("bgn_year","UTF-8") + "=" + URLEncoder.encode("2017", "UTF-8")); /*구축년도*/
//        urlBuilder.append("&" + URLEncoder.encode("animal_plant","UTF-8") + "=" + URLEncoder.encode("(유)돌코리아", "UTF-8")); /*가공업체*/
       
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
