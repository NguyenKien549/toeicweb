<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Practice Management</title>
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
							<option value="practice" selected="selected">Practice</option>
							<option value="test">Test</option>
						</select>
					</div>
					<%-- <div class="col-md-2 noti" style="color: red">
						<span>${errors}</span>
					</div> --%>
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
								<th class="col-sm-6 col-md-6">Name</th>
								<th class="col-sm-1 col-md-1">Part</th>
								<th class="col-sm-2 col-md-2">View</th>
								<th class="col-sm-1 col-md-1">Access</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${listLesson}" var="lesson">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${lesson.getId() }</td>
									<td class="col-sm-1 col-md-1">${lesson.getCode() }</td>
									<td class="col-sm-6 col-md-6">${lesson.getName() }</td>
									<td class="col-sm-1 col-md-1">${lesson.getPart() }</td>
									<td class="col-sm-2 col-md-2">${lesson.getView() }</td>
									<td class="col-sm-1 col-md-1">
										<a href="${pageContext.request.contextPath}/practice/${lesson.getPart() }/${lesson.getName() }/${lesson.getId() }" target="_blank">Try</a>
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
				<input id="addLesson" type="button" class="practice" value="Add Practice"
					data-toggle="modal" data-target="#myModal-addLesson"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="updateLesson" type="button" class="practice" value="Edit Practice"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="deleteLesson" class="practice" type="button"
					value="Delete Practice"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="addDocument" type="button" class="practice"
					value="Add Document"
					style="padding: 0.8em 1em; color: white; background-color: #0000FF; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="updateDocument" type="button" class="practice"
					value="Update Document"
					style="padding: 0.8em 1em; color: white; background-color: #c9310c; border: none; border-radius: 0.5em; margin-right: 2em">
			</div>
		</div>
	</div>



	<!-- modal them document -->

	<div class="modal fade" id="myModal-addLesson">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Add Practice</h4>
				</div>
				<div class="modal-body form-group">
					<div class="addContent"  style="font-size: medium;">
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Code:</p>
							<input type="text" class="form-control col-10 practiceCode">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1"  style="padding-left: 0">Title:</p>
							<input type="text" class="form-control col-10 practiceName">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Part:</p>
							<select class="form-control selectPartPractice" style="width: 86px;">
								<option value="1">Part1</option>
								<option value="2">Part2</option>
								<option value="3">Part3</option>
								<option value="4">Part4</option>
								<option value="5">Part5</option>
								<option value="6">Part6</option>
								<option value="7">Part7</option>
							</select>
						</div>
					</div>
					<hr>
					<!-- het phan danh sach cau hoi -->


				</div>
				<!-- het phan noi dung can them addContent-->

				<div class="submitA" style="justify-content: center">
					<button id="practice"
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
					<h4 class="modal-title" style="color: white">Edit Practice</h4>
				</div>
				<div class="modal-body">
					<div class="updateContent"  style="font-size: medium;">
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Id:</p>
							<input type="text" readonly="readonly" class="form-control col-10 editId">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Code:</p>
							<input type="text" class="form-control col-10 editPracticeCode">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1"  style="padding-left: 0">Title:</p>
							<input type="text" class="form-control col-10 editPracticeName">
						</div>
						<div class="row" style="    margin: 1% 0 1% 0;">
							<p class="col-1" style="padding-left: 0">Part:</p>
							<select class="form-control editSelectPartPractice" style="width: 86px;">
								<option value="1">Part1</option>
								<option value="2">Part2</option>
								<option value="3">Part3</option>
								<option value="4">Part4</option>
								<option value="5">Part5</option>
								<option value="6">Part6</option>
								<option value="7">Part7</option>
							</select>
						</div>
					</div>
					
				</div>
				<div class="modal-footer" style="justify-content: center">
						<button id="practice" style="background-color: #c9310c; color: white"
							type="submit" class="btn btn-default updateLessonSubmit">UPDATE</button>
					</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal-addDocumentLesson">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3b3bf3">
					<h4 class="modal-title" style="color: white">Add Practice
						Document</h4>
				</div>
				<div class="option row">
						<span  style="line-height: 35px;margin: 2% 0 0 6%">Id:</span> 
						<input class="form-control col-2" id="practiceId" readonly="readonly"style="margin: 2% 0 0 1%">
				<div class="countQuestion" style="margin: 2% 4% 0 43%;float: right;font-size: 21px;">Selected: <span class="numbDocumentSelected">0</span>/<span class="maxDocument">10</span></div>
				</div>
				<div class="modal-body">
					
					<div class="listDocuments" style="overflow: auto; height: 26em;font-size: 17px;border-top: 1px solid #e9ecef">
						<p>List <span class="typeDocument"></span>:</p>
						<div class="readingDocuments">
						
						</div>
						<div class="listeningDocuments">
						
						</div>
					</div>
				</div>
				<div class="modal-footer" style="justify-content: center">
					<button id="practice" style="background-color: #3b3bf3; color: white"
						type="submit" class="btn btn-default addDocumentSubmit"
						>ADD</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal-updateLessonDocument">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3b3bf3">
					<h4 class="modal-title" style="color: white">Update Practice Question</h4>
				</div>
				<div class="option row" style="margin: 0">
						<span  style="line-height: 35px;margin: 2% 0 0 1%">Id:</span> 
						<input class="form-control col-2" id="practiceIdUpdate" readonly="readonly"style="margin: 2% 0 0 1%">
					<div class="countQuestion" style="margin: 2% 4% 0 43%;float: right;font-size: 21px;"><span class="numbDocumentSelectedUpdate">0</span>/<span class="maxDocumentUpdate">10</span></div>
				</div>
				<div class="modal-body">
					<label style="font-size: 1.3em; margin-top: 1%;">Current Documents (<span class="currentPart"></span>):</label> 
					<div class="currentDocuments" style="overflow: auto; height: 15em;font-size: 17px;border-top: 1px solid #e9ecef">
						
					</div>
					<label style="font-size: 1.3em; margin-top: 1%;">List Documents:</label>
					<div class="listDocuments" style="overflow: auto; height: 34em;font-size: 17px;border-top: 1px solid #e9ecef">
						<div class="readingDocuments">
						
						</div>
						<div class="listeningDocuments">
						
						</div>
					</div>
				</div>
				<div class="modal-footer" style="justify-content: center">
					<button id="practice" style="background-color: #3b3bf3; color: white"
						type="submit" class="btn btn-default updateDocumentSubmit"
						>Update</button>
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