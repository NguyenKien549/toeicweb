<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BKForum</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" type="text/css" href="resources/css/forum.css">
</head>
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

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top"
			style="background-color: #0033c3"> <!-- Brand --> <span><img
			class="logo" src="resources/img/forum_icon.png" width="40px"
			height="40px" style="opacity: 0.8"> <a class="navbar-brand"
			href="${pageContext.request.contextPath}">BKForum</a></span> <!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<!-- 					<form class="form-inline mr-auto" -->
				<!-- 						action="https://google.com/search" target="blank"> -->
				<!-- 						<input class="form-control mr-sm-2 input-search active" -->
				<!-- 							type="text" placeholder="Search" name="q"> <img -->
				<!-- 							class="btn-search" src="resources/img/search.png" width="35px" -->
				<!-- 							height="35px" style="opacity: 0.9"> -->
				<!-- 					</form> -->
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/home">HOME</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/BKForum">FORUM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">TEST</a></li>
				<li class="nav-item"></li>
				<li class="nav-item"><a class="nav-link login-window"
					data-target="#login-box" data-toggle="modal" href="#">LOGIN</a></li>

			</ul>
		</div>
		</nav>


		<div class="background container"></div>
		<!-- content -->
		<div class="container content">
			
			<div class="sloganTitle">
				<span>Nơi dành cho mọi người thảo luận, trao đổi liên quan đến Toeic. Hãy cùng nhau xây dựng một cộng đồng vững mạnh bạn nhé!</span>
			</div>
		
			
			<div class="discussion">
				<table class="table table-hover listDiscussion">
					<thead>

						<tr>
							<th style="width: 60%">Topic</th>
							<th style="width: 15%">Author</th>
							<th style="width: 12%">View</th>
							<th style="width: 13%">Date</th>
						</tr>

					</thead>

					<tbody class="bodyTable">
						<c:forEach items="${discussionList}" var="discussion">
							<tr>
								<td><a href="${pageContext.request.contextPath}/discussion/${discussion.getTitle()}/${discussion.getId()}" style="text-decoration: none;color: black">${discussion.getTitle()}</a></td>
								<td>${discussion.getUser().getUsername()}</td>
								<td>${discussion.getView()}</td>
								<td id="discussionTime${discussion.getId()}" title='<fmt:formatDate value="${discussion.getTime()}" pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate>'></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- het div discussion -->

		</div>
		<!-- het div content -->

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
		src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/js/setTime.js"></script>
</body>
</html>