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
			}, //contentid, contentTypeid ������ ����
			dataType : 'xml',
			success : function(data) {
				console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item; //�� ��� ���ο� �����Ͱ� �������
				
				var output = '';
				output += '<h4>' + "��ǰ�̸�" + myItem.DESC_KOR + '</h4>'; //API Ȱ�� �޴��� ���� Response �� �� �ִ�
				output += '<h4>' + "1ȸ ������" + myItem.SERVING_WT + '</h4>'; //�����͵��� ����
				output += '<h4>' + "����(kcal)" + myItem.NUTR_CONT1 + '</h4>'; //�ű⼭ ��� ���� ��.
				output += '<h4>' + "ź��ȭ��(g)" + myItem.NUTR_CONT2 + '</h4>';
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