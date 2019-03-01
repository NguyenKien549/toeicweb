<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="resources/css/register-dialog.css"> -->
<body>
	<!-- Modal -->
	<div class="modal fade" id="login-box" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="login-content form-login"
						action="${pageContext.request.contextPath}/checklogin">
						<div class="form-group">
							<label>Username</label> <input class="form-control"
								name="usernameLogin" type="text" placeholder="Username"
								required="required"></input>
						</div>

						<div class="form-group">
							<label>Password</label> <input class="form-control"
								name="passwordLogin" type="password" placeholder="Password"
								required="required"></input>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>

		</div>
	</div>
	<!-- het login-dialog -->

	<!-- Modal -->
	<div class="modal fade" id="register-box" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Register Infomation</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="${pageContext.request.contextPath}/register"
						modelAttribute="user" enctype="multipart/form-data">
						<div class="form-group">
							<label>Full name</label>
							<input id="name" name="Name" class="form-control"
								type="text" placeholder="Full name" required="required" />
						</div>

						<div class="form-group">
							<label>Gender</label>
							<select class="form-control" name="Gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="other">Other</option>
							</select>
						</div>

						<div class="form-group">
							<label>Date of Birth</label>
							<input id="DoB" name="DateOfBirth" type="date"
								autocomplete="on" class="form-control" required="required"></input>
						</div>

						<div class="form-group">
							<label>Avatar</label>
							<input id="Avatar" name="avt" type="file" autocomplete="on"
							 class="form-control" required="required" accept="image/.jpg"></input>
						</div>

						<div class="form-group">
							<label>Email</label>
							<input id="email" class="form-control" name="Email"
								type="text" autocomplete="on" placeholder="Input email..."/>
						</div>

						<div class="form-group">
							<label>Username</label>
							<input id="username" class="form-control" name="Username"
								 type="text" autocomplete="on" placeholder="Username..."></input>
						</div>

						<div class="form-group">
							<label>Password</label>
							<input id="password" class="form-control" name="Password"
								type="password" autocomplete="on" placeholder="Password..."></input>
						</div>

						<button class="btn btn-primary" type="submit">Register</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- het register-dialog -->


	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top"> <!-- Brand -->
		<span><img class="logo" src="resources/img/logo.png"
			width="40px" height="40px" style="opacity: 0.8"> <a
			class="navbar-brand" href="${pageContext.request.contextPath}">BKTOEIC</a></span>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
<%-- 				<form class="form-inline mr-auto" action="https://google.com/search" --%>
<%-- 					target="blank"> --%>
<!-- 					<input class="form-control mr-sm-2 input-search active" type="text" -->
<!-- 						placeholder="Search" name="q"> <img class="btn-search" -->
<!-- 						src="resources/img/search.png" width="35px" height="35px" -->
<!-- 						style="opacity: 0.9"> -->
<%-- 				</form> --%>
				<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/BKForum">FORUM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link login-window"
					data-target="#login-box" data-toggle="modal" href="#">LOGIN</a></li>
			</ul>
		</div>
		</nav>
		<!-- content -->

		<div class="row height-79">
			<div class="container content">

				<div class="row register">
					<div class="title">
						<p>FREE TO LEARNING TOEIC</p>
					</div>
					<div class="split"></div>
					<div class="slogan">
						<p>With only 2 hour per day,</p>
						<p>our website will help to improve your toeic level for free</p>
					</div>
					<div class="row btnRegister">
						<!-- <a class="register-window" href="#register-box">REGISTER NOW</a> -->
						<a class="register-window" data-toggle="modal"
							data-target="#register-box" href="#">REGISTER NOW</a>
					</div>
				</div>

				<div class="row practice">
					<div class="col-md-6 reading">
						<a href="${pageContext.request.contextPath}/readingpractice/5"><img
							src="resources/img/reading.png" width="70px" height="70px"></a>
						<a href="${pageContext.request.contextPath}/readingpractice/5"><p>READING
								PRACTICE</p></a>
					</div>
					<div class="col-md-6 listening">
						<a href="${pageContext.request.contextPath}/listeningpractice/1">
							<img src="resources/img/listening.png" height="55px" width="55px">
						</a> <a href="${pageContext.request.contextPath}/listeningpractice/1"><p>LISTENING
								PRACTICE</p></a>
					</div>
				</div>

			</div>
		</div>


		<!-- footer -->
		<div class="container-fluid footer row">
			<div class="col-7 left-footer">
				<p>Một sản phẩm của KV team</p>
				<p>Địa chỉ: Số 1, Đại Cồ Việt, Hà Nội</p>
				<p>Hot line: 0123456789</p>
				<p>Email: kvteam@gamil.com</p>
			</div>
			<div class="col-5 right-footer">
				<p>Liên hệ:</p>
				<a href=""><span><img src="resources/img/fb.png"
						height="40px" width="40px"></span></a> <a href=""><span><img
						src="resources/img/twitter.png" height="40px" width="40px"></span></a>
			</div>

		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript"
		src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/ajax/login.js"></script>
</body>
</html>