<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<script>
		$.ajax({
			url : '',
			type : 'get',
			data : {
			/* 					"contentId" : "2521880",
			 "contentTypeId" : "15" */
			}, //contentid, contentTypeid 서버로 전송
			dataType : 'xml',
			success : function(data) {
				console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
				
				var output = '';
				output += '<h4>' + "식품이름" + myItem.DESC_KOR + '</h4>'; //API 활용 메뉴얼 보면 Response 할 수 있는
				output += '<h4>' + "1회 제공량" + myItem.SERVING_WT + '</h4>'; //데이터들이 있음
				output += '<h4>' + "열량(kcal)" + myItem.NUTR_CONT1 + '</h4>'; //거기서 골라 쓰면 됨.
				output += '<h4>' + "탄수화물(g)" + myItem.NUTR_CONT2 + '</h4>';
				$('#window').html(output);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	</script>




</body>
</html>