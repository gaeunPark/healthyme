package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
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

	 @Test
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

}
