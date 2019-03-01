<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Discussion</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/discussion.css">
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
					<div class="form-group">
						<label>Username</label> <input class="form-control" type="text"
							id="usernameLogin" placeholder="Username" required="required"></input>
					</div>

					<div class="form-group">
						<label>Password</label> <input class="form-control"
							id="passwordLogin" type="password" placeholder="Password"
							required="required"></input>
					</div>
					<button type="button" class="btn btn-primary loginButton">Login</button>
				</div>
			</div>

		</div>
	</div>
	<!-- het login-dialog -->

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top"
			style="background-color: #0033c3"> <!-- Brand --> <span><img
			class="logo" src="../../resources/img/forum_icon.png" width="40px"
			height="40px" style="opacity: 0.8"> <a class="navbar-brand"
			href="${pageContext.request.contextPath}/BKForum">BKForum</a></span> <!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<!-- 				<form class="form-inline mr-auto" action="https://google.com/search" -->
				<!-- 					target="blank"> -->
				<!-- 					<input class="form-control mr-sm-2 input-search active" type="text" -->
				<!-- 						placeholder="Search" name="q"> <img class="btn-search" -->
				<!-- 						src="../../resources/img/search.png" width="35px" height="35px" -->
				<!-- 						style="opacity: 0.9"> -->
				<!-- 				</form> -->
				<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="#">FORUM</a></li>
				<li class="nav-item"><a class="nav-link" href="#">TEST</a></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
				<li class="nav-item"><c:choose>
						<c:when test="${name==null}">
							<a class="nav-link login-window" data-target="#login-box"
								data-toggle="modal" href="#">LOGIN</a>
						</c:when>
						<c:otherwise>
							<div class="dropdown nav-link" data-toggle="dropdown"
								style="padding: 0">
								<a class="nav-link" href="#">${name}</a>
								<ul class="dropdown-menu" id="menu-acc">
									<li id="information">Account Management</li>
									<li id="dangxuat-btn">Đăng xuất</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose></li>

			</ul>
		</div>
		</nav>

		<!-- content -->
		<div class="container content">
			<div class="note">
				<h4 class="forumSlogan">Hãy hỏi để biết rằng còn nhiều thứ cần
					khám phá.</h4>
			</div>
			<div class="discussion">
				<h2 class="dicussionTitle" id="${discussion.getId()}">${discussion.getTitle()}</h2>
				<div class="noidung">
					<div class="title">
						<div class="row">
							<div class="col-10 author">
								<img
									src="data:image/jpg;base64, ${discussion.getUser().getAvatar()}"
									width="40px" height="40px"
									style="opacity: 0.8; border-radius: 20px;">
									${discussion.getUser().getUsername()}
							</div>
							<div class="col-2 timer">
								<span>${discussion.getTime()}</span>
							</div>

							<div class="col-12 questionContent">
								<p>${discussion.getContent()}</p>
								<a href="#" class="report">Report</a>
								<div class="reportBox">
									<div class="form-group">
										<input type="text" name="reply" class="form-control">
										<button class="btn btn-primary reportButton" type="submit"
											placeholder="input your report">Report</button>
									</div>
								</div>
							</div>

						</div>

						<hr>
						<c:choose>
							<c:when test="${name!=null}">
								<div class="yourcomment">
									<label>Your comment:</label>

									<textarea class="form-control" rows="3"
										id="commentContent" placeholder="input your comment"></textarea>
									<button class="btn btn-primary commentButton" type="submit">Comment</button>
								</div>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary commentButtonLogin"
									data-target="#login-box" data-toggle="modal" type="button">Comment</button>
							</c:otherwise>

						</c:choose>


						<div class="row comment">
							<c:set scope="page" var="count" value="1" />
							<c:forEach items="${discussion.getCommentList()}" var="comment">
								<c:choose>
									<c:when test="${name==null}">
										<div class="col-10 avt ">
											<img
												src="data:image/jpg;base64, ${comment.getUser().getAvatar()}"
												width="40px" height="40px"
												style="opacity: 0.8; border-radius: 20px;">${comment.getUser().getUsername()}

										</div>
										<div class="col-2 timer">
											<span>${comment.getTime()}</span>
										</div>
										<div class="col-12 commentContent">
											<span>${comment.getContent()}</span> <br> <a href="#"
												class="reply" data-target="#login-box" data-toggle="modal"
												id="reply${count}">Reply</a> <a href="#" class="report"
												data-target="#login-box" data-toggle="modal"
												id="report${count}">Report</a>
										</div>
										<hr>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:when>
									<c:otherwise>
										<div class="col-10 avt ">
											<img
												src="data:image/jpg;base64, ${comment.getUser().getAvatar()}"
												width="40px" height="40px"
												style="opacity: 0.8; border-radius: 20px;">${comment.getUser().getUsername()}

										</div>
										<div class="col-2 timer">
											<span>${comment.getTime()}</span>
										</div>
										<div class="col-12 commentContent">
											<span>${comment.getContent()}</span> <br> <a href="#"
												class="reply" id="reply${count}">Reply</a> <a href="#"
												class="report" id="report${count}">Report</a>

											<div class="replyBox reply${count}">
												<div class="form-group">
													<input type="text" name="reply" class="form-control">
													<button class="btn btn-primary replyButton" type="submit"
														placeholder="input your reply">Reply</button>
												</div>
											</div>
											<div class="reportBox report${count}">
												<div class="form-group">
													<input type="text" name="reply" class="form-control">
													<button class="btn btn-primary reportButton" type="submit"
														placeholder="input your report">Report</button>
												</div>
											</div>
										</div>
										<hr>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<!--het phan comment -->

					</div>

				</div>
				<!--  het phan noi dung thao luan -->
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
				<a href=""><span><img src="../../resources/img/fb.png"
						height="40px" width="40px"></span></a> <a href=""><span><img
						src="../../resources/img/twitter.png" height="40px" width="40px"></span></a>
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
		src="../../resources/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="../../resources/js/login.js"></script>
	<script type="text/javascript" src="../../resources/js/dicussion.js"></script>
	
</body>
</html>