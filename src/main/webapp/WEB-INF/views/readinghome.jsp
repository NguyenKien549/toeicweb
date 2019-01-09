<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Reading Practice</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/luyendochome.css">
</head>
<body>
	<div class="container-fluid div-parent">
		<div id="login-box" class="login">
            <p class="login_title"> Login</p>
            <a href="#" class="close"><img src="resources/img/close-icon.png" height="35px" width="35px" class="img-close" title="Close Window" alt="Close" /></a>
            <form method="post" class="login-content" action="${pageContext.request.contextPath}/checklogin">
	            <label class="username">
	            <span>Username</span>
	            <input id="usernameLogin" name="usernameLogin" value="" type="text" autocomplete="on" placeholder="Username...">
	            </label>
	            <label class="password">
	            <span>Password</span>
	            <input id="passwordLogin" name="passwordLogin" value="" type="password" placeholder="Password...">
	            </label>
	            <button class="button submit-button" type="submit">Login</button>
 
            </form>
        </div>


		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #0033c3">
			<!-- Brand -->
			<img src="resources/img/logo.png" width="50px" height="50px">
						<a class="navbar-brand" href="#">BKTOEIC</a>

			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<form class="form-inline mr-auto" action="https://google.com/search" target="blank">
						<input class="form-control mr-sm-2 input-search active" type="text" placeholder="Search" name="q">
						<img class="btn-search" src="resources/img/search.png">
					</form>
					<li class="nav-item">
						<a class="nav-link" href="#">HOME</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#" >FORUM</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">ABOUT</a>
					</li>
					<li class="nav-item">
						<a class="nav-link login-window" href="#login-box">LOGIN</a>
					</li>					
				</ul>
			</div>
		</nav>

		<!-- body -->
		
		<div class="container-fluid content row justify-content-center">
			<div class="inner-content col-lg-10">
				<!-- ND -->
				<!-- cover -->
				<div class="container-fluid div-cover">
					<div class="frog">
						<div class="text-c1" style="position: relative;">
							<p style="position: absolute;width: 100%; bottom: 0.5em">READING PACTICE</p>
						</div>
						<!-- <div class="divide row justify-content-center"><div></div></div> -->
						<div class="text-c2">
							<p>With a hundred readings to choose from, our website will improve your reading skills on the toeic exam
							</p>
						</div>
					</div>
				</div>

				<!-- Bai hoc noi bat -->
				<div class="container-fluid bar">
					<span>Top readings</span>
				</div>
				<div class="container-fluid table-div">
					<div class="table-responsive-sm table-div-inner">
						<table class="table justify-content-start  table-hover">
							<thead>
								<tr class="d-flex">
									<th class="col-12 col-sm-10 col-md-7">Reading name</th>
									<th class="col-0 col-sm-2 col-md-5 count">Access count</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${suggest}" var="lession">
									<tr class="d-flex r">
										<td class="col-12 col-sm-10 col-md-7">
											<span><img src="resources/img/book.png"></span>
											<span>Lession: ${lession.getTitle()}</span>
										</td>
										<td class="col-0 col-sm-2 col-md-5 count">${lession.getAccessCount()}</td>
									</tr>
								
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>

				<!-- Bai hoc tim kiem -->
				<div class="container-fluid bar" style="margin-top: 3.5em">
					<span>New Lession</span>
				</div>
				<div class="container-fluid table-div">
					<div class="table-responsive-sm table-div-inner">
						<table class="table justify-content-start  table-hover">
							<thead>
								<tr class="d-flex">
									<th class="col-12 col-sm-10 col-md-7">Reading name</th>
									<th class="col-0 col-sm-2 col-md-5 count">Access count</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${newLessions}" var="lession">
									<tr class="d-flex r">
										<td class="col-12 col-sm-10 col-md-7">
											<span><img src="resources/img/book.png"></span>
											<span>Lession: ${lession.getTitle()}</span>
										</td>
										<td class="col-0 col-sm-2 col-md-5 count">${lession.getAccessCount()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
		<!--  -->
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
				<span><img src="resources/img/fb.png" height="40px" width="40px"></span>
				<span><img src="resources/img/twitter.png" height="40px" width="40px"></span>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/luyendochome.js"></script>
	
</body>
</html>