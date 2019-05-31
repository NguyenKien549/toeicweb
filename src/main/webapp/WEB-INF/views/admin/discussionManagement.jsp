<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Discussion Management</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/bootstrap/bootstrap.min.css"/>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/admin.css"/>'>

<!-- text editor -->
<script type="text/javascript"
	src='<c:url value="/resources/assets/ckeditor/ckeditor.js"/>'></script>
</head>
<body>
<jsp:include page="../default/adminHeader.jsp"></jsp:include>

		<!-- table and button -->
		<div class="row justify-content-center" style="margin-left: 15em;">
			<!-- Khung ngoai table -->
			<div class="col-11 row justify-content-center"
				style="border: 1px black solid; margin-top: 3em; padding: 0">
				<!-- tieu de khung ngoai -->
				<div class="col-12 tableName"
					style="height: 2em; background-color: #575464; line-height: 2em">
					<span>Bảng quản lý tài liệu</span>
				</div>

				<!-- search -->
				<div class="col-12 row justify-content-end"
					style="padding-top: 1em; padding-bottom: 1em">
					<div class="col-md-2 noti">
						<span style="color: red">${errors}</span> <span
							style="color: green">${done}</span>
					</div>
					<div class="col-md-10" style="text-align: right;">
						<span><input id="btnsearch" type="button" value="Search"></span>
						<input id="search" type="text" style="border-radius: 4px"
							placeHolder="Search by title...">
					</div>
				</div>

				<!-- TABLE -->
				<div class="justify-content-center col-12 main-table contentTable">
					<table class="table table-bordered discussionTable"
						style="min-width: 800px">
						<thead class="thead-dark">
							<tr class="d-flex">
								<th class="col-sm-1 col-md-1">ID</th>
								<th class="col-sm-6 col-md-6">Title</th>
								<th class="col-sm-2 col-md-2">Author</th>
								<th class="col-sm-1 col-md-1">View</th>
								<th class="col-sm-1 col-md-1">Active</th>
								<th class="col-sm-1 col-md-1"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${discussionList}" var="discussion">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${discussion.getId() }</td>
									<td class="col-sm-6 col-md-6">${discussion.getTitle() }</td>
									<td class="col-sm-2 col-md-2">${discussion.getUser().getUsername() }</td>
									<td class="col-sm-1 col-md-1">${discussion.getView() }</td>
									<td class="col-sm-1 col-md-1">${discussion.getActive() }</td>
									<td class="col-sm-1 col-md-1"><a
										href="${pageContext.request.contextPath}/discussion/${discussion.getTitle()}/${discussion.getId()}"
										target="_blank">View</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

	<jsp:include page="../default/paginationAdmin.jsp"></jsp:include>


			</div>
			<!-- btn delete -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
				<input id="addDiscussion" type="button" name=""
					value="Add Discussion" data-toggle="modal"
					data-target="#myModal-addDiscussion"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="lockDiscussion" type="button" name=""
					value="Lock Discussion"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="unlockDiscussion" type="button" name=""
					value="Unlock Discussion"
					style="padding: 0.8em 1em; background-color: blue; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<!-- 				<input id="deleteDiscussion" type="button" name="" value="Delete Discussion" -->
				<!-- 					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em"> -->
			</div>
		</div>
	</div>



	<!-- modal them document -->

	<div class="modal fade" id="myModal-addDiscussion">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Add Document</h4>
				</div>
				<div class="modal-body form-group">

					<div class="addContent">
						<div class="row">
							<span class="col-2" style="line-height: 35px">Title</span> <input
								type="text" id="discussionTitle" class="form-control col-10">
							<hr>
							<span class="col-2" style="line-height: 35px">Content</span>
							<textarea id="discussionContent" rows="5"
								class="form-control col-12"></textarea>
						</div>

					</div>
					<!-- het phan noi dung can them addContent-->
				</div>
				<!-- het phan modal-body -->

				<div class="modal-footer" style="justify-content: center">
					<button id="submitDiscussion"
						style="background-color: #035904; color: white"
						class="btn btn-default" data-dismiss="modal">ADD</button>
				</div>
			</div>
		</div>
	</div>
	<!-- het phan modal them tai lieu -->

	<!-- footer -->
	<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>

	<script>
		CKEDITOR.replace('discussionContent');
	</script>


	<script type="text/javascript"
		src="../../resources/js/js-for-admin-acc.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/ajax/discussionAdmin.js"/>'></script>
</body>
</html>