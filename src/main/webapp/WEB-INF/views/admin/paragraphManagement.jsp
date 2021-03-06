<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paragraph Management</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../../resources/css/admin.css">
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
					<div class="col-md-2 type">
						<select class="form-control" id="selectDataTable">
							<option value="part1">Part 1</option>
							<option value="part2">Part 2</option>
							<option value="part3">Part 3</option>
							<option value="part4">Part 4</option>
							<option value="part5">Part 5</option>
							<option value="part6">Part 6</option>
							<option value="part7">Part 7</option>
							<option value="audio">Audio</option>
							<option value="paragraph" selected="selected">Paragraph</option>
						</select>
					</div>
					<div class="col-md-2 noti" style="color: red">
						<span>${errors}</span>
					</div>
<!-- 					<div class="col-md-8" style="text-align: right;"> -->
<!-- 						<span><input id="btnsearch" type="button" name="submit" -->
<!-- 							value="Search"></span> <input id="search" type="text" name="q" -->
<!-- 							style="border-radius: 4px"> -->
<!-- 					</div> -->
				</div>

				<!-- TABLE -->
				<div class="justify-content-center col-12 main-table contentTable">
					<table class="table table-bordered questionTable" style="min-width: 800px">
						<thead class="thead-dark headerTable">
							<tr class="d-flex">
								<th class="col-sm-1 col-md-1">ID</th>
								<th class="col-sm-7 col-md-7">Paragraph</th>
								<th class="col-sm-1 col-md-1">Part</th>
								<th class="col-sm-2 col-md-2">PracticeID</th>
								<th class="col-sm-1 col-md-1">TestID</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${listQuestion}" var="question">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${question.getId() }</td>
									<td class="col-sm-7 col-md-7">${question.getParagraph() }</td>
									<td class="col-sm-1 col-md-1">${question.getPart() }</td>
									<td class="col-sm-2 col-md-2">${question.getPractice().getId() }</td>
									<td class="col-sm-1 col-md-1">${question.getTest().getId() }</td>
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
				<input id="add" type="button" class="paragraph" value="Add paragraph"
					data-toggle="modal" data-target="#myModal-addDocument"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="update" type="button" value="Update paragraph"
					data-target="#myModal-update" class="paragraph"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="delete" type="button" class="paragraph" value="Delete paragraph"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="addQuestion" type="button" class="paragraph" value="Add Question"
					style="padding: 0.8em 1em; color: white; background-color: #0000FF; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="updateQuestion" type="button" class="paragraph" value="Update Question"
					style="padding: 0.8em 1em; color: white; background-color: #c9310c; border: none; border-radius: 0.5em; margin-right: 2em">			</div>
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
						
						<div class="row">
							<span class="col-2" style="line-height: 35px">Paragraph</span>
							<textarea id="paragraph" rows="5" class="form-control col-10"></textarea>
						</div>

					</div>
					<!-- het phan noi dung can them addContent-->

					<div class="submitA" style="justify-content: center">
						<button id="paragraph"
							style="background-color: #035904; color: white; margin-left: 43%;margin-top:2%; width: 100px;"
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
					<h4 class="modal-title" style="color: white">Edit Audio</h4>
				</div>
				<div class="modal-body">
					<div class="input-modal row">
						<span class="col-2" style="line-height: 35px">Id</span> <input
							class="col-9 form-control" id="editId" readonly="readonly">
					</div>
					<div class="row">
						<span class="col-2" style="line-height: 35px">Paragraph</span>
						<textarea id="editParagraph" rows="5" class="form-control col-10"></textarea>
					</div>

				</div>
				<div class="modal-footer" style="justify-content: center">
					<button id="paragraph" style="background-color: #c9310c; color: white"
						type="submit" class="btn btn-default updateButton"
						data-dismiss="modal">UPDATE</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal-addDocumentQuestion">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3b3bf3">
					<h4 class="modal-title" style="color: white">Add Paragraph
						Question</h4>
				</div>
				<div class="option row">
					<select class="form-control partQuestion"
						style="margin: 2% 0 0 4%; width: 6em">
						<option value="6">Part 6</option>
						<option value="7">Part 7</option>
					</select>
						<span  style="line-height: 35px;margin: 2% 0 0 1%">Id:</span> 
						<input class="form-control col-2" id="paragraphId" readonly="readonly"style="margin: 2% 0 0 1%">
				<div class="countQuestion" style="margin: 2% 4% 0 51%;float: right;font-size: 21px;"><span class="numbQuesSelected">0</span>/<span class="maxQuestion">3</span></div>
				</div>
				<div class="modal-body">
					<div class="listQuestions" style="overflow: scroll; height: 34em;font-size: 17px">
					
					</div>
				</div>
				<div class="modal-footer" style="justify-content: center">
					<button id="paragraph" style="background-color: #3b3bf3; color: white"
						type="submit" class="btn btn-default addQuestionButton"
						data-dismiss="modal">ADD</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal-updateDocumentQuestion">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #3b3bf3">
					<h4 class="modal-title" style="color: white">Update Paragraph
						Question</h4>
				</div>
				<div class="option row" style="margin: 0">
<!-- 					<select class="form-control partQuestionUpdate" -->
<!-- 						style="margin: 2% 0 0 4%; width: 6em"> -->
<!-- 						<option value="1">Part 1</option> -->
<!-- 						<option value="2">Part 2</option> -->
<!-- 						<option value="3">Part 3</option> -->
<!-- 						<option value="4">Part 4</option> -->
<!-- 						<option value="test">Test</option> -->
<!-- 					</select> -->
						<span  style="line-height: 35px;margin: 2% 0 0 1%">Id:</span> 
						<input class="form-control col-2" id="paragraphIdUpdate" readonly="readonly"style="margin: 2% 0 0 1%">
				<div class="countQuestion" style="margin: 2% 4% 0 43%;float: right;font-size: 21px;"><span class="numbQuesSelectedUpdate">0</span>/<span class="maxQuestionUpdate">10</span></div>
				</div>
				<div class="modal-body">
				Current questions (<span class="currentPart"></span>) : 
					<div class="currentQuestions" style="overflow: auto; height: 11em;font-size: 17px;border-top: 1px solid #e9ecef">
						
					</div>
					List questions:
					<div class="listQuestions" style="overflow: auto; height: 34em;font-size: 17px;border-top: 1px solid #e9ecef">
						
					</div>
				</div>
				<div class="modal-footer" style="justify-content: center">
					<button id="paragraph" style="background-color: #3b3bf3; color: white"
						type="submit" class="btn btn-default updateQuestionSubmit"
						>Update</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
	<script>
		CKEDITOR.replace('paragraph');
		CKEDITOR.replace('editParagraph');
	</script>
	
	<script type="text/javascript" src="../../../resources/js/js-for-admin-acc.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript" src="../../../resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../../resources/js/questionManagement.js"></script>
	<script type="text/javascript" src="../../../resources/ajax/questionManagementAjax.js"></script>
</body>
</body>
</html>