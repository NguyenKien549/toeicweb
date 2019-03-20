<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${discussion.getTitle()}-Discussion-BKForum</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href='<c:url href="/resources/css/dicussion.css"></c:url>'>
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
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}">HOME</a></li>
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
									src="${pageContext.request.contextPath}/${discussion.getUser().getAvatar()}"
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
						<button class="btn btn-primary commentButtonLogin"
							data-target="#login-box" data-toggle="modal" type="button">Comment</button>

						<c:set scope="page" var="count" value="1" />
						<c:forEach items="${discussion.getCommentList()}" var="comment">
							<div class="row comment">

								<!-- 										danh tinh nguoi dung -->
								<div class="col-9 avt ">
									<img
										src="${pageContext.request.contextPath}/${comment.getUser().getAvatar()}"
										width="40px" height="40px"
										style="opacity: 0.8; border-radius: 20px;"><span
										style="margin-left: 5px;">${comment.getUser().getUsername()}</span>

								</div>
								<div class="col-2 timer">
									<span>${comment.getTime()}</span>
								</div>
								<div class="col-1 menu">
									<div class="dropdown">
										<img class="option-icon dropdown-toggle"
											src="../../resources/img/option_icon.png"
											data-toggle="dropdown">
										<ul class="dropdown-menu commentOption"
											style="min-width: 50px; width: 70px">
											<li id="${comment.getId()}" class="reportOption"
												data-target="#reportComment-box" data-toggle="modal">Report</li>
											<c:choose>
												<c:when
													test="${user.getUsername() == comment.getUser().getUsername()}">
													<li id="${comment.getId()}" class="editOption"
														data-target="#editComment-box" data-toggle="modal">Edit</li>
													<li id="${comment.getId()}" class="deleteOption">Delete</li>
												</c:when>
											</c:choose>
										</ul>
									</div>
								</div>

								<div class="col-12 commentContent">
									<span class="contentComment" id="${comment.getId()}">${comment.getContent()}</span>
									<br>
									<div class="mainComment">
										<span data-target="#login-box" data-toggle="modal">Reply</span>

<%-- 										<div class="replyBox reply${count}"> --%>
<!-- 											<div class="form-group"> -->
<!-- 												<input type="text" name="reply" class="form-control"> -->
<!-- 												<button class="btn btn-primary replyButton" type="submit" -->
<!-- 													placeholder="input your reply">Reply</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>

									<span  class="col-11 readmoreReply" style="float: right;" id="${comment.getId()}">Read
										more 10 reply</span>
									<span class="col-11 readLessReply"
										style="float: right;">Read less reply</span>

									<div class="replyArea col-11" style="float: right;">
										<div class="row listReply${comment.getId()}">
										
										</div>
										<!--	het danh sach reply -->
										<br>
										<div class="replyInputArea row col-12 replyBox${count }">
											<input class="col-9 form-control" id="replyInput${count}" type="text">
											<img src="../../resources/img/send_reply.png"
												class="send_reply_icon" id="${comment.getId()}">
										</div>
									</div>
									<!-- het phan reply -->
								</div>

								<c:set var="count" value="${count + 1}" scope="page" />
							</div>
							<!--het phan 1 comment -->

							<hr>
						</c:forEach>
						<div class="modal fade" id="editComment-box" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Edit Comment</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label>Your comment:</label>
											<textarea class="form-control" rows="4" id="editedContent"
												placeholder="input yoru comment" required="required"></textarea>
										</div>

										<button type="button" class="btn btn-primary editButton">Update</button>
									</div>
								</div>
							</div>
						</div>
						<!-- het edit-dialog -->

						<!-- report Modal -->
						<div class="modal fade" id="reportComment-box" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Report this comment</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label>Your report:</label>
											<textarea class="form-control" rows="4" id="reportedContent"
												placeholder="input your report" required="required"></textarea>
										</div>

										<button type="button"
											class="btn btn-primary reportCommentButton">Report</button>
									</div>
								</div>
							</div>
						</div>
						<!-- het report-dialog -->


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
<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<script src="../../resources/js/jquery-3.2.1.min.js"></script>
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
	<script type="text/javascript" src='<c:url href="/resources/js/dicussion.js"></c:url>'></script>

</body>
</html>