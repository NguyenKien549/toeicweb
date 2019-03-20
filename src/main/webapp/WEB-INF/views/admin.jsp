<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/admin.css">
</head>
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
							src="resources/img/email-icon.png"></a></li>
					<li id="acc" class="nav-item">
						<div class="dropdown nav-link" data-toggle="dropdown">
							<img class="ico-header" src="resources/img/account-icon.png">
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
				<li>b <a href="#" class="choice"><img class="ico-manag"
						src="resources/img/account-manager.png">Quản lý tài khoản</a>
				</li>
				<li><a href="#"><img class="ico-manag"
						src="resources/img/baihoc-manager.png">Quản lý bài học</a></li>
				<li><a href="#"><img class="ico-manag"
						src="resources/img/btl-manager.png">Quản lý bài thảo luận</a></li>
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
					<div class="col-12 col-md-4 noti" style="color: red">
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
								<th class="col-sm-1 col-md-1">ID</th>
								<th class="col-sm-3 col-md-3">Họ và tên</th>
								<th class="col-sm-2 col-md-2">Ngày sinh</th>
								<th class="col-sm-1 col-md-1">Giới tính</th>
								<th class="col-sm-2 col-md-2">Username</th>
								<th class="col-sm-2 col-md-2">Email</th>
								<th class="col-sm-1 col-md-1">Type</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${acc}" var="account">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${account.getId() }</td>
									<td class="col-sm-3 col-md-3">${account.getName() }</td>
									<td class="col-sm-2 col-md-2">
										<fmt:formatDate
											pattern="dd/MM/yyyy" value="${account.getDateOfBirth()}" /></td>
									<td class="col-sm-1 col-md-1">${account.getGender() }</td>
									<td class="col-sm-2 col-md-2">${account.getUsername() }</td>
									<td class="col-sm-2 col-md-2">${account.getEmail() }</td>
									<td class="col-sm-1 col-md-1">${account.getType() }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- search -->
				<div class="col-12 row"
					style="padding-top: 1em; padding-bottom: 1em">
					<span class="col-md-6 col-sm-12" id="infoPage">Page 1 of
						${numPage}</span>
					<ul class="pagination" id="pagin">
						<c:forEach var="i" begin="1" end="${numPage}">
							<li class="page-item" id="index"><a class="page-link"
								href="#">${i }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<!-- btn delete -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
				<input id="add" type="button" name="" value="Thêm tài khoản"
					data-toggle="modal" data-target="#myModal-add"
					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="update" type="button" name="" value="Sửa tài khoản"
					data-target="#myModal-update"
					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
				<input id="delete" type="button" name="" value="Xóa tài khoản"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
			</div>
		</div>
	</div>

	<!-- footer -->
	<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

	<!-- modal them acc -->

	<div class="modal fade" id="myModal-add">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="background-color: #035904">
					<h4 class="modal-title" style="color: white">Thêm account</h4>
				</div>
				<form action="Admin/themaccount" method="POST"
					modelAttribute="account" id="form-them" accept-charset="UTF-8">
					<div class="modal-body">
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Họ tên</span> <input
								type="text" name="Name">
						</div>
						<div class="input-modal row">
							<span class="col-3" style="line-height: 35px">Ngày sinh</span><input
								type="date" name="DateOfBirth">
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
							<span class="col-3" style="line-height: 35px">Password</span><input
								type="text" name="Password">
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
						<button id="submit-add-btn"
							style="background-color: #035904; color: white"
							class="btn btn-default" data-dismiss="modal">ADD</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- modal sua acc -->
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

	<script type="text/javascript" src="resources/js/js-for-admin-acc.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
</body>
</html>