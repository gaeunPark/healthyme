<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<script>
		$.ajax({
			url : '',
			type : 'get',
			data : {
			/* 					"contentId" : "2521880",
			 "contentTypeId" : "15" */
			}, //contentid, contentTypeid ������ ����
			dataType : 'json',
			success : function(data) {
				console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item; //�� ��� ���ο� �����Ͱ� �������
				
				var output = '';
				output += '<h4>' + "��ǰ�̸�" + myItem + '</h4>';
				/* output += '<h4>' + "��ǰ�̸�" + myItem.DESC_KOR + '</h4>'; //API Ȱ�� �޴��� ���� Response �� �� �ִ�
				output += '<h4>' + "1ȸ ������" + myItem.SERVING_WT + '</h4>'; //�����͵��� ����
				output += '<h4>' + "����(kcal)" + myItem.NUTR_CONT1 + '</h4>'; //�ű⼭ ��� ���� ��.
				output += '<h4>' + "ź��ȭ��(g)" + myItem.NUTR_CONT2 + '</h4>'; */
				$('#window').html(output);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	</script>

	<!-- <script>
		$(document).ready(
				function() {

					$.ajax({
						url : '',
						type : 'post',
						dataType : 'xml',
						success : function(data) { //ajax��û�� ���� ��ȯ�Ǵ� ������ data.

							/* $(data).find("data.response.body.items.item").each( */
									alert("1")
							$(data).find("data").find("response").find("body").find("items").find("item").each(
								function() {
										var info = "DESC_KOR : "
												+ $(this).find("DESC_KOR").text()
												+ "<br/>";

										$('#wrap').append(info);

									});

						},
						error: function() {
							alert("����");
						}
					});

				}
		);
	</script> -->
	dsfadfs
	<div id="wrap"></div>
	����������������������sadffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff



</body>
</html>