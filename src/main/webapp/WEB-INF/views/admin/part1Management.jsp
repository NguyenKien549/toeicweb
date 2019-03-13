<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Question Library</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/admin.css">
</head>
<body>
	<!-- HEADER -->
	<nav class="navbar navbar-expand bg-dark navbar-dark fixed-top">
	<div class="container-fluid">
		<!-- Brand -->
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/admin/accountManagement">BKTOEIC
			ADMIN</a>

		<!-- Navbar links -->
		<div class=" navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li id="mail" class="nav-item"><a class="nav-link mr-100"
					href="#"><img class="ico-header"
						src="../../../resources/img/email-icon.png"></a></li>
				<li id="acc" class="nav-item">
					<div class="dropdown nav-link" data-toggle="dropdown">
						<img class="ico-header" src="../../../resources/img/account-icon.png">
						<ul class="dropdown-menu" id="menu-acc">
							<li id="dangxuat-btn">Đăng xuất</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- body -->
	<div class="container-fluid" style="padding-top: 50px;">
		<!-- menu left -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li><a href="#" class="choice"><img class="ico-manag"
						src="../../../resources/img/account-manager.png">Quản lý tài
						khoản</a></li>
				<li><a href="#" class="choice"><img class="ico-manag"
						src="../../../resources/img/baihoc-manager.png">Quản lý bài học</a>
				</li>
				<li><a href="#" class="choice" style="color: white"> <img
						class="ico-manag" src="../../../resources/img/baihoc-manager.png">Quản
						lý ngân hàng câu hỏi
				</a></li>
				<li><a href="#" class="choice"><img class="ico-manag"
						src="../../../resources/img/btl-manager.png">Quản lý bài thảo
						luận</a></li>
			</ul>
		</div>

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
							<option value="part1" selected="selected">Part 1</option>
							<option value="part2">Part 2</option>
							<option value="part3">Part 3</option>
							<option value="part4">Part 4</option>
							<option value="part5">Part 5</option>
							<option value="part6">Part 6</option>
							<option value="part7">Part 7</option>
							<option value="audio">Audio</option>
							<option value="paragraph">Paragraph</option>
						</select>
					</div>
					<div class="col-md-2 noti" style="color: red">
						<span>${errors}</span>
					</div>
					<div class="col-md-8" style="text-align: right;">
						<span><input id="btnsearch" type="button" name="submit"
							value="Search"></span> <input id="search" type="text" name="q"
							style="border-radius: 4px">
					</div>
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
								<th class="col-sm-1 col-md-1">AudioID</th>
								<th class="col-sm-1 col-md-1">ImageID</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${listQuestion}" var="question">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${question.getId() }</td>
									<td class="col-sm-4 col-md-4">${question.getQuestion() }</td>
									<td class="col-sm-1 col-md-1">${question.getA()}</td>
									<td class="col-sm-1 col-md-1">${question.getB()}</td>
									<td class="col-sm-1 col-md-1">${question.getC()}</td>
									<td class="col-sm-1 col-md-1">${question.getD()}</td>
									<td class="col-sm-1 col-md-1">${question.getRightAnswer() }</td>
									<td class="col-sm-1 col-md-1">
									<audio class="playAudio" controls>
									 	<source src="${pageContext.request.contextPath }/${question.getAudio().getAudio()}" type="audio/mpeg">
									 </audio>
									</td>
									<td class="col-sm-1 col-md-1"><img src="${pageContext.request.contextPath }/${question.getImage()}" height="40px" width="60px"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- pagination -->
				<div class="col-12 row pagination"
					style="padding-top: 1em; padding-bottom: 1em">
					<span class="col-md-6 col-sm-12" id="infoPage">Page 1 of
						${numbPage}</span>
					<ul class="pagination" id="pagin">
						<c:forEach var="i" begin="1" end="${numbPage}">
							<li class="page-item" id="index"><a class="page-link"
								href="#">${i}</a></li>
						</c:forEach>
					</ul>
				</div>


			</div>
			<!-- btn delete -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
				<input id="add" type="button" name="" value="Add Question"
					data-toggle="modal" data-target="#myModal-addDocument"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="update" type="button" name="" value="Sửa tài khoản"
					data-target="#myModal-update"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="delete" type="button" name="" value="Xóa tài khoản"
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
					<h4 class="modal-title" style="color: white">Add Question</h4>
				</div>
					<div class="modal-body form-group">
						<div class="addContent">
							<div class="input-modal row">
								
								<span class="col-2" style="line-height: 35px">Audio</span>
								 <input name="file"
									type="file" id="audio" class="form-control col-9">
							</div>
							<div class="input-modal row" style="height: 120px">
								<span class="col-2" style="line-height: 35px">Script</span>
								<textarea id="script" class="form-control col-9" rows="4"
									style="height: 95%; width: 80%;"></textarea>
							</div>

							<div class="questionsPart1">
								<c:forEach var="i" begin="1" end="10">
									<hr>
									
									<div class="question" id="${i}">
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">Image
												${i}</span>
												<input type="file" class="col-9 form-control"
												id="image${i}" >
										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">Question
												${i}</span> <input type="text" class="col-9 form-control"
												id="question${i}">

										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">A</span><input
												type="text" id="A${i}" class="form-control col-9" />
										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">B</span> <input
												class="col-9 form-control" type="text" id="B${i}" />
										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">C</span> <input
												class="col-9 form-control" type="text" id="C${i}" />
										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">D</span><input
												class="col-9 form-control" type="text" id="D${i}" />
										</div>
										<div class="input-modal row">
											<span class="col-2" style="line-height: 35px">Right
												Answer:</span> <select class="col-9 form-control"
												id="RightAnswer${i}">
												<option value="A">A</option>
												<option value="B">B</option>
												<option value="C">C</option>
												<option value="D">D</option>
											</select>
										</div>
									</div>

								</c:forEach>
							</div>
							<hr>
							<!-- het phan danh sach cau hoi -->

<!-- 							<div class="input-modal row"> -->
<!-- 								<span class="col-2" style="line-height: 35px">PracticeID</span><input -->
<!-- 									type="text" id="PracticeID" class="form-control"> -->
<!-- 							</div> -->
<!-- 							<div class="input-modal row"> -->
<!-- 								<span class="col-2" style="line-height: 35px">LessionID</span><input -->
<!-- 									type="text" id="LessionID" class="form-control"> -->
<!-- 							</div> -->

						</div>
						<!-- het phan noi dung can them addContent-->

						<div class="submitA" style="justify-content: center">
							<button id="submit-add-btn"
								style="background-color: #035904; color: white; margin-left: 43%; width: 100px;"
								class="btn btn-default addPart1" data-dismiss="modal">ADD</button>
						</div>
					</div>
					<!-- het phan modal-body -->
			</div>
		</div>
	</div>
	<!-- het phan modal them tai lieu -->

	<!-- modal sua document -->
	<div class="modal fade" id="myModal-update">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #c9310c">
					<h4 class="modal-title" style="color: white">Sửa account</h4>
				</div>

				<form id="form-update" action="Admin/updateaccount"
					modelAttribute="account" method="POST" accept-charset="UTF-8">
					<div class="modal-body">
						<input id="id" name="Id" value="0" style="display: none" />
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Họ tên</span><input
								type="text" name="Name">
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Ngày sinh</span><input
								id="date" type="date" name="DateOfBirth">
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Giới tính</span><select
								name="Gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="other">Other</option>

							</select>
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Username</span><input
								type="text" name="Username">
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Email</span><input
								type="text" name="Email">
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Type account</span>
							<select name="Type">
								<option value="User">user</option>
								<option value="Admin">admin</option>
							</select>
						</div>
					</div>
					<div class="modal-footer" style="justify-content: center">
						<button id="submit-update-btn"
							style="background-color: #c9310c; color: white" type="submit"
							class="btn btn-default" data-dismiss="modal">UPDATE</button>
					</div>
				</form>
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
		src="../../../resources/ajax/adminAjax.js"></script>
</body>
</body>
</html>