<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../include/nav.jsp"%>

<section>
	<div class="menu">커뮤니티</div>
	<div class="container">
		<div class="contents">
			<form action="${pageContext.request.contextPath}/community/create" method="post">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> 
						<input type="text" name="categoryIdx" value="1">
						<input type="text" name='title' class="form-control" placeholder="Enter Title">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							placeholder="Enter ..."></textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Writer</label> <input type="text"
							name="writer" class="form-control" placeholder="Enter Writer">
					</div>
				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>

			</form>





		</div>
		<!-- contents -->

		<div class="side"></div>
	</div>
	<!-- container -->
</section>
<%@ include file="../include/footer.jsp"%>