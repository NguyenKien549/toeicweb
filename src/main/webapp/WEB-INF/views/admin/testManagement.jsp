<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Management</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/admin.css">
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
					<div class="col-md-2 type">
						<select class="form-control" id="selectDataTable">
							<option value="practice" >Practice</option>
							<option value="test" selected="selected">Test</option>
						</select>
					</div>
<!-- 					<div class="col-md-2 noti" style="color: red"> -->
<%-- 						<span>${errors}</span> --%>
<!-- 					</div> -->
<!-- 					<div class="col-md-8" style="text-align: right;"> -->
<!-- 						<span><input id="btnsearch" type="button" name="submit" -->
<!-- 							value="Search"></span> <input id="search" type="text" name="q" -->
<!-- 							style="border-radius: 4px"> -->
<!-- 					</div> -->
				</div>

				<!-- TABLE -->
				<div class="justify-content-center col-12 main-table contentTable">
					<table class="table table-bordered questionTable"
						style="min-width: 800px">
						<thead class="thead-dark headerTable">
							<tr class="d-flex">
								<th class="col-sm-1 col-md-1">ID</th>
								<th class="col-sm-1 col-md-1">Code</th>
								<th class="col-sm-7 col-md-7">Title</th>
								<th class="col-sm-2 col-md-2">View</th>
								<th class="col-sm-1 col-md-1">Access</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${listLesson}" var="lesson">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${lesson.getId() }</td>
									<td class="col-sm-1 col-md-1">${lesson.getCode() }</td>
									<td class="col-sm-7 col-md-7">${lesson.getTitle() }</td>
									<td class="col-sm-2 col-md-2">${lesson.getView() }</td>
									<td class="col-sm-1 col-md-1">
										<a href="${pageContext.request.contextPath}/user/test/${lesson.getId() }/${lesson.getTitle()}" target="_blank">Try</a>
									</td>
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
				<input id="addLesson" type="button" class="test" value="Add Test"
					data-toggle="modal" data-target="#myModal-addLesson"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="updateLesson" type="button" class="test" value="Edit Test"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="deleteLesson" class="test" type="button"
					value="Delete Test"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="addDocument" type="button" class="test"
					value="Add Document"
					style="padding: 0.8em 1em; color: white; background-color: #0000FF; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="updateDocument" type="button" class="test"
					value="Update Document"
					style="padding: 0.8em 1em; color: white; background-color: #c9310c; border: none; border-radius: 0.5em; margin-right: 2em">
			</div>
		</div>
	</div>



	<!-- modal them document -->

	<!-- modal them document -->

	<div class="modal fade" id="myModal-addLesson">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Add Test</h4>
				</div>
				<div class="modal-body form-group">
					<div class="addContent"  style="font-size: medium;">
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Code:</p>
							<input type="text" class="form-control col-10 testCode">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1"  style="padding-left: 0">Title:</p>
							<input type="text" class="form-control col-10 testTitle">
						</div>
						
					</div>
					<hr>
					<!-- het phan danh sach cau hoi -->
				</div>
				<!-- het phan noi dung can them addContent-->

				<div class="submitA" style="justify-content: center">
					<button id="test"
						style="background-color: #035904; color: white; margin-left: 43%;margin-bottom:1%; width: 100px;"
						class="btn btn-default addLessonSubmit" data-dismiss="modal">ADD</button>
				</div>
			</div>
			<!-- het phan modal-body -->
		</div>
	</div>

	<!-- het phan modal them tai lieu -->

	<!-- modal sua document -->
	<div class="modal fade" id="myModal-updateLesson">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #c9310c">
					<h4 class="modal-title" style="color: white">Edit Test</h4>
				</div>
				<div class="modal-body">
					<div class="updateContent"  style="font-size: medium;">
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Id:</p>
							<input type="text" readonly="readonly" class="form-control col-10 editTestId">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Code:</p>
							<input type="text" class="form-control col-10 editTestCode">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1"  style="padding-left: 0">Title:</p>
							<input type="text" class="form-control col-10 editTestTitle">
						</div>
					</div>
				</div>
				<div class="modal-footer" style="justify-content: center">
						<button id="test" style="background-color: #c9310c; color: white"
							type="submit" class="btn btn-default updateLessonSubmit">UPDATE</button>
					</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
	<script type="text/javascript"
		src="../../../resources/js/js-for-admin-acc.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript"
		src="../../../resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src='<c:url value='/resources/ajax/lessonManagement.js'></c:url>'></script>
</body>
</body>
</html>