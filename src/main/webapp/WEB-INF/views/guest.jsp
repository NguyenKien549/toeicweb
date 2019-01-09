<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/login.css">
	<link rel="stylesheet" type="text/css" href="resources/css/register-dialog.css">
<body>
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
<%-- 	            <label>${error}</label> --%>
	            <!-- <p>
	            <a class="forgot" href="#">Quên mật khẩu?</a>
	            </p>  -->       
            </form>
        </div>
		
		<!-- register -->
		<div id="register-box" class="register-dialog">
            <p class="register_title"> Register</p>
            <a href="#" class="close"><img src="resources/img/close-icon.png" height="35px" width="35px" class="img-close" title="Close Window" alt="Close" /></a>
            <form:form method="post" class="register-content" action="${pageContext.request.contextPath}/register" modelAttribute="user">
	            <label class="name">
	            <span>Full name</span>
	            <input id="name" name="Name" value="" type="text" autocomplete="on" placeholder="input name...">
	            </label>
	            <label class="gender">
	            <span>Gender</span>
	            <select name="Gender">
	            	<option value="Male">Male</option>
	            	<option value="Female">Female</option>
	            	<option value="other">Other</option>

	            </select>
	            <!-- <input id="gender" name="gender" value="" type="text" placeholder=""> -->
	            </label>

	            <label class="DoB">
	            <span>Date of Birth</span>
	            <input id="DoB" name="DateOfBirth" type="date" autocomplete="on">
	            </label>

				<label class="email">
	            <span>Email</span>
	            <input id="email" name="Email" value="" type="text" autocomplete="on" placeholder="Input email...">
	            </label>

	            <label class="username">
	            <span>Username</span>
	            <input id="username" name="Username" value="" type="text" autocomplete="on" placeholder="Username...">
	            </label>
	            <label class="password">
	            <span>Password</span>
	            <input id="password" name="Password" value="" type="password" autocomplete="on" placeholder="Password...">
	            </label>

	            <button class="button submit-button-register" type="submit">Register</button>        
            </form:form>
        </div>


	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color: #0033c3">
			<!-- Brand -->
			<img class="logo" src="resources/img/logo.png" width="50px" height="50px" style="opacity: 0.8">
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
						<img class="btn-search" src="resources/img/search.png" width="35px" height="35px" style="opacity: 0.9">
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
					<li class="nav-item" >
						<a class="nav-link login-window" href="#login-box">LOGIN</a>
					</li>					
				</ul>
			</div>
		</nav>
	<!-- content -->
		<div class="row height-79">
			<div class="container content">
				
				<div class="row register">
					<div class="title"><p>FREE TO LEARNING TOEIC</p></div>
					<div class="split"></div>
					<div class="slogan">
						<p>With only 1 hour per day,</p>
						<p> our website will help to improve your toeic level for free</p>
					</div>
					<div class="row btnRegister">
						<a class="register-window" href="#register-box">REGISTER NOW</a>
					</div>
				</div>
				
				<div class="row practice">
					<div class="col-md-6 reading">
						<a href="${pageContext.request.contextPath}/readingpractice"><img src="resources/img/reading.png" width="70px" height="70px"></a>
						<a href="${pageContext.request.contextPath}/readingpractice"><p>READING PRACTICE</p></a>
					</div>
					<div class="col-md-6 listening">
						<a href=""><span><img src="resources/img/listening.png" height="55px" width="55px"></span></a>
						<a href=""><p>LISTENING PRACTICE</p></a>
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
				<a href=""><span><img src="resources/img/fb.png" height="40px" width="40px"></span></a>
				<a href=""><span><img src="resources/img/twitter.png" height="40px" width="40px"></span></a>
			</div>
			
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/ajax/login.js"></script>
</body>
</html>