<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../include/nav.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.js"></script>
<!-- Main content -->
<section>
	<div class="menu">
		<h3>커뮤니티</h3>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<form role="form" method="post">
						<input type='hidden' name='boardIdx' value="${boardVO.boardIdx}">
						<input type='hidden' name='categoryIdx'
							value="${boardVO.categoryIdx}"> <input type='hidden'
							name='page' value="${cri.page}"> <input type='hidden'
							name='perPageNum' value="${cri.perPageNum}"> <input
							type='hidden' name='searchType' value="${cri.searchType}">
						<input type='hidden' name='keyword' value="${cri.keyword}">
					</form>

					<div class="box-body">
						<div class="form-group">
							<input type="text" class="form-control"
								name='title' value="${boardVO.title}"
								readonly="readonly">
						</div>
						<hr>
						<div class="form-group">
							<textarea class="form-control" name="content" rows="3"
								readonly="readonly">${boardVO.content}</textarea>
						</div>
						<div class="form-group">
							<input type="text"
								name="writer" class="form-control" value="${boardVO.writer}"
								readonly="readonly">
						</div>
					</div>
					
					<!-- <table>
						<tr>
							<th>제목</th>
						</tr>
						<tr>
							<td>작성자</td>
							<td>조회수</td>
							<td>날짜</td>
						</tr>
						<tr>내용</tr>
					</table> -->

					<div class="box-footer">

						<c:if test="${login.userid == boardVO.writer}">
							<button type="submit" class="btn btn-default boardModify">Modify</button>
							<button type="submit" class="btn btn-default boardRemove">REMOVE</button>
						</c:if>
						<button type="submit" class="btn btn-default listAll">LIST ALL</button>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12">

							<!-- ...426p. 댓글 등록에 필요한 div -->
							<div class="box box-success">
								<div class="box-header">
									<h4 class="box-title">댓글쓰기</h4>
								</div>

								<c:if test="${not empty login}">
									<div style="background:#f7f7f7; padding: 3% 5%; ">
										 <input type="hidden" id="newReplyWriter" value="${login.userid}"> 
										<input class="form-control" type="text"
										placeholder="댓글을 입력해주세요" id="newReplyText"
										style="display:inline-block; width: 80%;">		
										<a style="float: right; width: auto;" type="button" class="btn btn-default" id="replyAddBtn">
										입력</a>		
									</div>
								</c:if>
									
								<c:if test="${empty login}">
									<div class="box-body">
										<div>
											<a href="javascript:goLogin();">Login Please</a>
										</div>
									</div>
								</c:if>
							</div>

							<!-- ...426p. 댓글 목록과 페이징 처리에 필요한 div -->
							<!-- The time line -->
							<ul class="timeline w3-ul w3-border">
								<!-- timeline time label -->
								<li class="time-label" id="repliesDiv"><span
									class="bg-green"> 댓글 <!-- 댓글목록갯수. -->
										<small id='reply_countSmall'> [ ${boardVO.replyCnt} ]
									</small>
								</span></li>
							</ul>

							<div class='text-center'>
								<ul id="pagination" class="pagination pagination-sm no-margin ">
								</ul>
							</div>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->


					<!-- ...442p. 수정과 삭제를 위한 Modal 창 -->
					<div id="modifyModal" class="modal modal-primary fade"
						role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title"></h4>
								</div>
								<div class="modal-body" data-rno>
									<p>
										<input type="text" id="replytext" class="form-control">
									</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
									<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>


				</div>
				<!-- /.box -->
			</div>
			<!--/.col (left) -->
		</div>
		<!-- /.row -->
	</div>
</section>
<!-- /.content -->

<!-- /.content-wrapper -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
			<div class="timeline-header">
				{{replyer}} {{prettifyDate regDate}}
			</div>
			<div class="timeline-body">
				{{replyText}} 
			</div>
			<div class="timeline-footer">
				{{#eqReplyer replyer }}
		 			<a class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#modifyModal">
					Modify
					</a>
				{{/eqReplyer}}
			</div>	 			
		</li>
	{{/each}}
</script>


<script>
	// 로그인  replyer 확인
	Handlebars.registerHelper("eqReplyer", function(replyer, block) {
		var accum = '';
		if (replyer == '${login.userid}') {
			accum += block.fn();
		}
		return accum;
	});
	
	// 날짜
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
	var boardIdx = ${boardVO.boardIdx};
	var replyPage = 1;
	
	function getPage(pageInfo) {
		$.getJSON(pageInfo, function(data) {
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));			
			
			$("#reply_countSmall").html("[ " + data.pageMaker.totalCount +" ]");
			$("#modifyModal").modal('hide');
		});
	}

	var printPaging = function(pageMaker, target) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		target.html(str);
	};
	
	$("#repliesDiv").on("click", function() {
		if ($(".timeline li").length > 1) {
			return;
		}
		getPage("/replies/" + boardIdx + "/1");

	});

	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();
		replyPage = $(this).attr("href");
		getPage("/replies/" + boardIdx + "/" + replyPage);

	});
	
	
	
$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	// 글 수정
	$(".boardModify").on("click", function(){
		formObj.attr("action", "/community/modify");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	// 글 삭제
	$(".boardRemove").on("click", function(){
		formObj.attr("action", "/community/delete");
		formObj.submit();
	});
	// 목록가기
	$(".listAll").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/community/community");
		formObj.submit();
	});
	
	// 댓글 추가
	$("#replyAddBtn").on("click", function() {
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replyText = replytextObj.val();
		console.log(replyer);
		$.ajax({
			type : 'post',
			url : '/replies/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				boardIdx : boardIdx,
				replyer : replyer,
				replyText : replyText
			}),
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/" + boardIdx + "/" + replyPage);
					replytextObj.val("");
				}
			}
		});
	});

	// 댓글 수정
	$("#replyModBtn").on("click", function() {
		var rno = $(".modal-title").html().trim();
		var replyText = $("#replytext").val().trim();

		$.ajax({
			type : 'put',
			url : '/replies/' + rno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replyText : replyText
			}),
			dataType : 'text',
			success : function(result) {
				if (result == 'SUCCESS') {
					alert("수정 되었습니다.");
					getPage("/replies/" + boardIdx + "/" + replyPage);
				}
			}
		});
	});

	// 댓글 삭제
	$("#replyDelBtn").on("click",function(){
		  var rno = $(".modal-title").html().trim();
		  var replytext = $("#replytext").val().trim();
		  $.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/" + boardIdx + "/" + replyPage );
					}
			}});
	});	

	$(".timeline").on("click", ".replyLi", function(event){
		var reply = $(this);
		console.log("reply list clicked : ", reply.find('.timeline-body').text().trim());
		//...핸들바템플릿에서 댓글본문, 댓글번호.
		$("#replytext").val(reply.find('.timeline-body').text().trim());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});

	function goLogin(){
			self.location ="/user/login";
	}

	
});		/* document.ready */
</script>



<script>    
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    } 
</script>



<%@include file="../include/footer.jsp"%>