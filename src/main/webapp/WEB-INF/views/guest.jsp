<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/animate.css">
<body>
	

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

<jsp:include page="default/header.jsp"></jsp:include>
		<!-- content -->

		<div class="row height-79">
			<div class="container content">

				<div class="row register">
					<div class="title wow bounceInDown">
						<p>FREE TO LEARNING TOEIC</p>
					</div>
					<div class="split"></div>
					<div class="slogan wow bounce">
						<p>With only 2 hour per day,</p>
						<p>our website will help to improve your toeic level for free</p>
					</div>
					<div class="row btnRegister wow rubberBand">
						<!-- <a class="register-window" href="#register-box">REGISTER NOW</a> -->
						<a class="register-window " data-toggle="modal"
							data-target="#register-box" href="#">REGISTER NOW</a>
					</div>
				</div>

				<div class="row practice">
					<div class="col-md-6 reading">
						<a href="${pageContext.request.contextPath}/readingpractice/5"><img
							 class="wow bounceInDown" src="resources/img/reading.png" width="70px" height="70px"></a>
						<a  href="${pageContext.request.contextPath}/readingpractice/5"><p class="wow bounceInUp" data-wow-duration="1s">READING
								PRACTICE</p></a>
					</div>
					<div class="col-md-6 listening">
						<a  href="${pageContext.request.contextPath}/listeningpractice/1">
							<img  class="wow bounceInDown" src="resources/img/listening.png" height="55px" width="55px">
						</a> <a href="${pageContext.request.contextPath}/listeningpractice/1"><p class="wow bounceInUp" data-wow-duration="1s">LISTENING
								PRACTICE</p></a>
					</div>
				</div>

			</div>
		</div>
			<script type="text/javascript" src="resources/js/wow.min.js"></script>
        <script>
              new WOW().init();
        </script>
	<script src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
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
		src='<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>'></script>
	
<script type="text/javascript" src="resources/js/login.js"></script>
<script type="text/javascript" src="resources/ajax/login.js"></script>

<jsp:include page="default/footer.jsp"></jsp:include>
		