<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<body>

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
				<li class="nav-item"><a class="nav-link" href="BKForum">FORUM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
					<li class="nav-item">
						<div class="dropdown nav-link" data-toggle="dropdown"
							style="padding: 0">
							<a class="nav-link" href="#">${name}</a>
							<ul class="dropdown-menu" id="menu-acc">
								<li id="information"><a href="#">Account Management</a></li>
								<li id="dangxuat-btn">Logout</li>
							</ul>
						</div>
					</li>

				</ul>
			</div>
		</nav>
		<!-- content -->
		<div class="row height-79">
			<div class="container content">

				<div class="row register"></div>

				<div class="row practice">
					<div class="col-12 col-md-6 reading">
						<a href="${pageContext.request.contextPath}/readingpractice/5"><img
							src="resources/img/reading.png" width="70px" height="70px"></a>
						<a href="${pageContext.request.contextPath}/readingpractice/5"><p>READING PRACTICE</p></a>
					</div>
					<div class="col-12 col-md-6 listening">
						<a href=""><span><img src="resources/img/listening.png"
								height="55px" width="55px"></span></a> <a href=""><p>LISTENING
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
	<script type="text/javascript" src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/ajax/login.js"></script>
</body>
</html>