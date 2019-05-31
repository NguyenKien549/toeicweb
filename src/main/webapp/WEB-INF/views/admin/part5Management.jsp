<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Part 5 Management</title>
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
							<option value="part1">Part 1</option>
							<option value="part2">Part 2</option>
							<option value="part3">Part 3</option>
							<option value="part4">Part 4</option>
							<option value="part5" selected="selected">Part 5</option>
							<option value="part6">Part 6</option>
							<option value="part7">Part 7</option>
							<option value="audio">Audio</option>
							<option value="paragraph">Paragraph</option>
						</select>
					</div>
<!-- 					<div class="col-md-2 notice" style="color: red"> -->
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
								<th class="col-sm-4 col-md-4">Question</th>
								<th class="col-sm-1 col-md-1">A</th>
								<th class="col-sm-1 col-md-1">B</th>
								<th class="col-sm-1 col-md-1">C</th>
								<th class="col-sm-1 col-md-1">D</th>
								<th class="col-sm-1 col-md-1">Right</th>
								<th class="col-sm-1 col-md-1">Practice</th>
								<th class="col-sm-1 col-md-1">Test</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${listQuestion}" var="question">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${question.getId() }</td>
									<td class="col-sm-4 col-md-4" title="${question.getQuestion()}">${question.getQuestion() }</td>
									<td class="col-sm-1 col-md-1">${question.getA()}</td>
									<td class="col-sm-1 col-md-1">${question.getB()}</td>
									<td class="col-sm-1 col-md-1">${question.getC()}</td>
									<td class="col-sm-1 col-md-1">${question.getD()}</td>
									<td class="col-sm-1 col-md-1">${question.getRightAnswer() }</td>
									<td class="col-sm-1 col-md-1">${question.getPractice().getId() }</td>
									<td class="col-sm-1 col-md-1">${question.getTest().getId() }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

		<jsp:include page="../default/paginationAdmin.jsp"></jsp:include>

			</div>
			<!-- btn management -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
				<input id="add" type="button" class="part5" value="Add Question"
					data-toggle="modal" data-target="#myModal-addDocument"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="update" type="button" value="Update Question"
					data-target="#myModal-update" class="part5"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="delete" type="button" class="part5"
					value="Delete Question"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
			</div>
		</div>
	</div>



	<!-- modal them document -->

	<div class="modal fade" id="myModal-addDocument">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Add Document</h4>
				</div>
					<div class="modal-body form-group">
						<div class="addContent">
						
							<div class="audioQuestions">
								<div class="questions question1">
									<div class="input-modal row">
										<span class="col-2"  style="line-height: 35px">Question</span>
										<input
											type="text" class="col-8 form-control" id="question1" class="form-control">
										<img src='<c:url value="/resources/img/add_button_2-512.png"></c:url>' alt="abc" class="col-1 add add_Question">
										<img src='<c:url value="/resources/img/subtract-512.png"></c:url>' class="col-1 sub sub_Question">
									</div>
									<div class="input-modal row">
										<span class="col-2" style="line-height: 35px">A</span><input
											type="text" class="form-control col-8" id="A1" >
									</div>
									<div class="input-modal row">
										<span class="col-2" style="line-height: 35px">B</span>
										<input class="col-8 form-control" type="text" id="B1">
									</div>
									<div class="input-modal row">
										<span class="col-2" style="line-height: 35px">C</span>
										<input class="col-8 form-control" type="text"  id="C1">
									</div>
									<div class="input-modal row">
										<span class="col-2" style="line-height: 35px">D</span><input
											class="col-8 form-control" type="text" id="D1">
									</div>
									<div class="input-modal row">
										<span class="col-2" style="line-height: 35px">Right Answer:</span>
										<select class="col-8 form-control"
											id="RightAnswer1">
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
										</select>
									</div>
								</div>
							</div> <!-- het phan danh sach cau hoi -->
					
						</div> <!-- het phan noi dung can them addContent-->

						<div class="submitA" style="justify-content: center">
							<button id="part5"
								style="background-color: #035904; color: white; margin-left: 43%; width: 100px;"
								class="btn btn-default addSubmit" data-dismiss="modal">ADD</button>
						</div>

					</div>
					<!-- het phan modal-body -->
			</div>
		</div>
	</div>
	<!-- het phan modal them tai lieu -->

	<!-- modal sua document -->
	<div class="modal fade" id="myModal-update">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #c9310c">
					<h4 class="modal-title" style="color: white">Update Question</h4>
				</div>

				<div class="modal-body form-group">
					<div class="modal-body">
						<div class="question">
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">Id</span> <input
									class="col-9 form-control" id="editId" readonly="readonly">
							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">Question </span> <input
									type="text" class="col-9 form-control" id="editQuestion">

							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">A</span><input
									type="text" id="editA" class="form-control col-9" />
							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">B</span> <input
									class="col-9 form-control" type="text" id="editB" />
							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">C</span> <input
									class="col-9 form-control" type="text" id="editC" />
							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">D</span><input
									class="col-9 form-control" type="text" id="editD" />
							</div>
							<div class="input-modal row">
								<span class="col-2" style="line-height: 35px">Right
									Answer:</span> <select class="col-9 form-control" id="editRightAnswer">
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
								</select>
							</div>
						</div>
					</div>
					<!-- het phan noi dung can them addContent-->

					<div class="submitA" style="justify-content: center">
						<button id="part5"
							style="background-color: #c9310c; color: white; margin-left: 43%; width: 100px;"
							class="btn btn-default updateButton" data-dismiss="modal">Update</button>
					</div>
				</div>
				<!-- het phan modal-body -->
			</div>
		</div>
	</div>
	<!-- footer -->
	<!-- 	<script type="text/javascript" src="../../../resources/js/jquery-3.3.1.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="../../../resources/js/js-for-admin-acc.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript"
		src="../../../resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../../../resources/js/questionManagement.js"></script>
	<script type="text/javascript"
		src="../../../resources/ajax/questionManagementAjax.js"></script>
</body>
</body>
</html>