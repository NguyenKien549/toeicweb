<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Management</title>
</head>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../resources/css/admin.css">

<body>
<!-- HEADER -->
	<nav class="navbar navbar-expand bg-dark navbar-dark fixed-top">
		<div class="container-fluid">
			<!-- Brand -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}">BKTOEIC ADMIN</a>

			<!-- Navbar links -->
			<div class=" navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li id="mail" class="nav-item"><a class="nav-link mr-100"
						href="#"><img class="ico-header"
							src="../../resources/img/email-icon.png"></a></li>
					<li id="acc" class="nav-item">
						<div class="dropdown nav-link" data-toggle="dropdown">
							<img class="ico-header" src="../../resources/img/account-icon.png">
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
				<li> <a href="${pageContext.request.contextPath}/admin/accountManagement/1" class="choice" style="color: white"><img class="ico-manag"
						src="../../resources/img/account-manager.png">Quản lý tài khoản</a>
				</li>
				<li><a href="#"  class="choice"><img class="ico-manag"
						src="../../resources/img/baihoc-manager.png">Quản lý bài học</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/questionManagement/part1/1"  class="choice"><img class="ico-manag"
						src="../../resources/img/baihoc-manager.png">Quản lý ngân hàng câu hỏi</a></li>
				<li><a href="#"  class="choice"><img class="ico-manag"
						src="../../resources/img/btl-manager.png">Quản lý bài thảo luận</a></li>
			</ul>
		</div>

		<!-- table and button -->
		<div class="row justify-content-center" style="margin-left: 15em;">
			<!-- Khung ngoai table -->
			<div class="col-11 row justify-content-center"
				style="border: 1px black solid; margin-top: 3em; padding: 0">
				<!-- tieu de khung ngoai -->
				<div class="col-12"
					style="height: 2em; background-color: #B8B8B8; line-height: 2em">
					<span>Bảng quản lý tài khoản</span>
				</div>

				<!-- search -->
				<div class="col-12 row justify-content-end"
					style="padding-top: 1em; padding-bottom: 1em">
					<div class="col-12 col-md-4 notice" style="color: red">
						<span>${errors}</span>
					</div>
					<div class="col-12 col-md-8" style="text-align: right;">
						<span><input id="btnsearch" type="button" name="submit"
							value="Search"></span> <input id="search" type="text" name="q"
							style="border-radius: 4px">
					</div>
				</div>

				<!-- TABLE -->
				<div class="justify-content-center col-12 main-table">
					<table class="table table-bordered" style="min-width: 800px">
						<thead class="thead-dark">
							<tr class="d-flex">
								<th style="width: 5%">ID</th>
								<th style="width: 25%">Full Name</th>
								<th style="width: 10%">Date of Birth</th>
								<th style="width: 8%">Gender</th>
								<th style="width: 16%">Username</th>
								<th style="width: 22%">Email</th>
								<th style="width: 7%">Type</th>
								<th style="width: 7%">Active</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listUser}" var="account">
								<tr class="d-flex">
									<td style="width: 5%">${account.getId() }</td>
									<td style="width: 25%">${account.getName() }</td>
									<td style="width: 10%"><fmt:formatDate
											pattern="dd/MM/yyyy" value="${account.getDateOfBirth()}" /></td>
									<td style="width: 8%">${account.getGender() }</td>
									<td style="width: 16%">${account.getUsername() }</td>
									<td style="width: 22%">${account.getEmail() }</td>
									<td style="width: 7%">${account.getType() }</td>
									<td style="width: 7%">${account.getActive() }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- pagingation -->
				<div class="col-12 row"
					style="padding-top: 1em; padding-bottom: 1em">
					<span class="col-md-6 col-sm-12" id="infoPage">Page ${currentPage} of
						${numbPage}</span>
					<ul class="pagination" id="pagin">
						<c:forEach var="i" begin="1" end="${numbPage}">
							<li class="page-item" id="index"><a class="page-link pageIndex"
								href="${i}">${i}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- btn management -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
				<input id="add" type="button" name="" value="Add Account"
					data-toggle="modal" data-target="#myModal-add"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="delete" type="button" class="account" value="Delete Account"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
			</div>
		</div>
	</div>

	

	<!-- modal them acc -->

	<div class="modal fade " id="myModal-add">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Add Account</h4>
				</div>
				<form action="admin/themaccount" method="POST"
					modelAttribute="account" id="form-them" accept-charset="UTF-8">
					<div class="modal-body">
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Họ tên</span> <input
								 class="form-control col-9" type="text" name="Name">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Ngày sinh</span>
							<input class="form-control col-9" type="date" name="DateOfBirth">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Giới tính</span><select
								name="Gender" class="form-control col-9">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="other">Other</option>

							</select>
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Username</span><input
								type="file" name="Avatar" class="form-control col-9">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Username</span><input
								type="text" name="Username" class="form-control col-9">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Password</span><input
								type="password" name="Password" class="form-control col-9">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Email</span><input
								type="text" name="Email" class="form-control col-9">
						</div>
						<div class="input-modal row form-group">
							<span class="col-2" style="line-height: 35px">Type</span>
							<select name="Type" class="form-control col-9">
								<option value="User">user</option>
								<option value="Admin">admin</option>
							</select>
						</div>
					</div>
					<div class="modal-footer" style="justify-content: center">
						<button id="submit-add-btn"
							style="background-color: #035904; color: white"
							class="btn btn-default" data-dismiss="modal">ADD</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!-- 	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

	<script type="text/javascript" src="../../resources/js/js-for-admin-acc.js"></script>
	<script type="text/javascript" src="../../resources/ajax/adminAjax.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript" src="../../resources/js/bootstrap/bootstrap.min.js"></script>
</body>
</html>