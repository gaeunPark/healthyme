<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

<!-- 		<script>
		$.ajax({
			url : '/openApi',
			type : 'get',
			data : {
			/* 					"contentId" : "2521880",
			 "contentTypeId" : "15" */
			}, //contentid, contentTypeid 서버로 전송
			dataType : 'json',
			success : function(data) {
				console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item; //이 경로 내부에 데이터가 들어있음
				console.log(myItem.length);
				for (var i = 0; i<myItem.length; i++) {
					var output = '';
					
					output += '<h4>' + "식품이름: " + myItem[i].DESC_KOR + '</h4>';
					output += '<h4>' + "칼로리: " + myItem[i].NUTR_CONT1 + '</h4>';
					console.log( myItem[i].NUTR_CONT1);
					document.body.innerHTML += output;
					/* output += '<h4>' + "식품이름" + myItem.DESC_KOR + '</h4>'; //API 활용 메뉴얼 보면 Response 할 수 있는
					output += '<h4>' + "1회 제공량" + myItem.SERVING_WT + '</h4>'; //데이터들이 있음
					output += '<h4>' + "열량(kcal)" + myItem.NUTR_CONT1 + '</h4>'; //거기서 골라 쓰면 됨.
					output += '<h4>' + "탄수화물(g)" + myItem.NUTR_CONT2 + '</h4>'; */
				}
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		}); -->
	</script>

	<script>
		/* 		$(document).ready(
		 function() {
		 */
	 	$.ajax({
			url : '/openApi',
			type : 'get',
			dataType : 'json',
			success: function(data){
				console.log(data.data); 
				var output = ""
				output += data.data
				document.body.innerHTML += "";
				
				$(data).find("data").find("response").each(
					function(){
						console.log($(this).find("header").text());
					}
				)
			} 
			/* success : function(data) { //ajax요청을 통해 반환되는 데이터 data.
				$(data).find("data").find("response").find("body")
						.find("items").find("item").each(
								function() {
									console.log($(this).find("DESC_KOR").text());
									var info = "DESC_KOR : "
											+ $(this).find("DESC_KOR").text()
											+ "<br/>";

									$('#wrap').append(info);
								});

			},
			error : function() {
				alert("실패");
			} */
		});

		/* 				}); */
	</script>

	<div id="wrap"></div>




</body>
</html>