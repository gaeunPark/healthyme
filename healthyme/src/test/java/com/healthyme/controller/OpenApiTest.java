package com.healthyme.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.cxf.helpers.IOUtils;
import org.json.XML;
import org.json.JSONObject;
import org.junit.Test;

public class OpenApiTest {

//	@Test
	public void test() throws Exception {
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
//
		String addr = "http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?ServiceKey=";
		String serviceKey = "yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D";
		String parameter = "";

//		PrintWriter out = response.getWriter(); // Ŭ���̾�Ʈ�� ���� TEXT DATA, JSON�� ���� �� �� �����ϴµ�

//      parameter = parameter + "&" + "contentId=" + contentId;//JSP���� �޾ƿ� contentid, contentTypeid

		parameter = parameter + "&" + "numOfRows=" + "50";
//      parameter = parameter + "&" + "_type=json";

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
		String s = new String(b, "UTF-8"); // String���� Ǯ���ٰ� byte�迭�� �ߴٰ� �ٽ� String���� �ؼ� json�� ������ �迭�� print?? ���� �� �𸣰ڴ�
		System.out.println(s);
//
//      JSONObject json = new JSONObject();
//      json.put("data", s);  

//	fail("Not yet implemented");
	}
	public static int INDENT_FACTOR = 4;
	@Test
	public JSONObject test2() throws Exception {
		
		HttpURLConnection conn = (HttpURLConnection) new URL(
				"http://apis.data.go.kr/1470000/FoodNtrIrdntInfoService/getFoodNtrItdntList?"
						+ "ServiceKey=yZZgPPuDihT%2F%2BxPnqlmB43yjAdza8%2F23DVjtbXpxc5peeqF9Mu%2FADaBFPgXYSxzXG6pXJtdQJzUdiFIVQMsg4Q%3D%3D").openConnection();
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
		
		return xmlJSONObj;

	}

}
