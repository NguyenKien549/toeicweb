<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listening Practice</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/listening.css">
</head>
<body>
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
							<label>Username</label> <input class="form-control" type="text"
								placeholder="Username" required="required"></input>
						</div>

						<div class="form-group">
							<label>Password</label> <input class="form-control"
								type="password" placeholder="Password" required="required"></input>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>
		</div>
		<!-- het modal -->
	</div>
	<!-- het login-dialog -->

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top"> <!-- Brand -->
		<span><img class="logo" src="../resources/img/logo.png"
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
				<form class="form-inline mr-auto" action="https://google.com/search"
					target="blank">
					<input class="form-control mr-sm-2 input-search active" type="text"
						placeholder="Search" name="q"> <img class="btn-search"
						src="../resources/img/search.png" width="35px" height="35px"
						style="opacity: 0.9">
				</form>
				<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="#">FORUM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link login-window"
					data-target="#login-box" data-toggle="modal" href="#">LOGIN</a></li>
			</ul>
		</div>
		</nav>

		<!-- content -->
		<div class="container content">
			<div class="row background"></div>

			<div class="row part-list">
				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart ">
					<div class="col-3 part">
						<a href="#" id="part1">Part 1: Photo</a>
					</div>
					<div class="col-3 part">
						<a href="" id="part2">Part 2: Question-Response</a>
					</div>
					<div class="col-3 part">
						<a href="${pageContext.request.contextPath}/listeningpractice/3" id="part3">Part 3: Short conversation</a>
					</div>
					<div class="col-3 part">
						<a href="" id="part4">Part 4: Short talk</a>
					</div>
				</div>

				<div class="col-lg-8 col-sm-8 col-xs-8 col-8 questions">
					<div class="listQuestions">
						<h2 id="title">${partTitle}</h2>
						<hr>
						<!-- 						<button class="btn btn-primary start">Start</button> -->
						<div class="contentPractice">
							<div class="question">
								<!-- 								<table class="table table-striped"> -->
								<!-- 									<tbody> -->
								<ul class="list-group">
									<c:forEach items="${listPractice}" var="practice">
										<li class="listeningPractice list-group-item" value="${practice.getId()}">
											<span class="${part}">${practice.getName()}</span>
										</li>
									</c:forEach>
								</ul>

								<!-- 									</tbody> -->

								<!-- 								</table> -->
							</div>
							<!-- 							<button class="btn btn-primary submit">Submit</button> -->
						</div>
					</div>
				</div>
				<!-- het phan noi dung cau hoi -->

<!-- 				<div class="col-sm-4 col-lg-4 col-xs-4 col-4 timer"> -->
<!-- 					<div class="box-answer"> -->
<!-- 						<div class="header"> -->
<!-- 							<p id="time" style="margin-bottom: 0;">0:5:00</p> -->
<!-- 						</div> -->
<!-- 						<div class="answers"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->

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
				<a href=""><span><img src="../resources/img/fb.png"
						height="40px" width="40px"></span></a> <a href=""><span><img
						src="../resources/img/twitter.png" height="40px" width="40px"></span></a>
			</div>

		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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
		src="../resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/js/login.js"></script>
	<script type="text/javascript" src="../resources/ajax/login.js"></script>
	<script type="text/javascript" src="../resources/js/listening.js"></script>
</body>
</html>