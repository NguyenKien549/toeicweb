<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${discussion.getTitle()}-Discussion-BKForum</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/bootstrap/bootstrap.min.css"></c:url>' >
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/login.css"></c:url>' >
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/discussion.css"></c:url>' >
</head>
<body>
	<jsp:include page="../default/forumHeader.jsp"/>

		<!-- content -->
		<div class="container content">
			<div class="note">
				<h4 class="forumSlogan">Hãy hỏi để biết rằng còn nhiều thứ cần
					khám phá.</h4>
			</div>
			<div class="discussion col-12">
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
							<div class="col-1 timer">
								<span id="discussion${discussion.getId()}"
								 title='<fmt:formatDate value="${discussion.getTime()}" pattern="dd-MM-yyyy HH:mm:ss"/>'></span>
							</div>
							
							<div class="col-1 menu">
								<div class="dropdown">
									<img class="option-icon dropdown-toggle"
										src="../../resources/img/option_icon.png"
										data-toggle="dropdown">
									<ul class="dropdown-menu commentOption"
										style="min-width: 50px; width: 70px">
										<li class="reportDiscussion"
											data-target="#login-box" data-toggle="modal">Report</li>
										
									</ul>
								</div>
							</div>

							<div class="col-12 questionContent">
								<span id="discussionContent">${discussion.getContent()}</span>
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
								<div class="col-1 timer">
									<span id="timer${comment.getId() }" title='<fmt:formatDate value="${comment.getTime()}" pattern="dd-MM-yyyy HH:mm:ss"/>'></span>
								</div>
								<div class="col-1 menu">
									<div class="dropdown">
										<img class="option-icon dropdown-toggle"
											src="../../resources/img/option_icon.png"
											data-toggle="dropdown">
										<ul class="dropdown-menu commentOption"
											style="min-width: 50px; width: 70px">
											<li id="${comment.getId()}" class="reportOption"
												data-target="#login-box" data-toggle="modal">Report</li>
											
										</ul>
									</div>
								</div>

								<div class="col-12 commentContent">
									<span class="contentComment" id="${comment.getId()}">${comment.getContent()}</span>
									<br>
									<div class="mainComment">
										<span class="replyComment" id="${count}"data-target="#login-box" data-toggle="modal">Reply</span>
									</div>

									<c:choose>
										<c:when test="${comment.getReplies().size() > 0 }">
											<span class="readmoreReply" id="${comment.getId()}">Read 
												more ${comment.getReplies().size()} replies</span>
											<span
												class="col-11 readLessReply lessReply${comment.getId()}"
												id="${comment.getId()}" style="float: right;">Read
												less reply</span>
										</c:when>
									</c:choose>


									<div class="replyArea col-11" style="float: right;">
										<div class="row listReply${comment.getId()}"></div>
										<!--	het danh sach reply -->
										<br>
										<div class="replyInputArea row col-12 replyBox${count }">
											<input
												class="col-9 form-control replyContent${comment.getId()}"
												id="replyInput${count}" type="text"> <img
												src="../../resources/img/send_reply.png"
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

					</div>

				</div>
				<!--  het phan noi dung thao luan -->
			</div>
			<!-- het div discussion -->
		</div>
		<!-- het div content -->
		

<script src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>' ></script>
<script type="text/javascript">
$(".replyInputArea").hide();
$(".readLessReply").hide();
</script>
		
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
		src='<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>' ></script>
	<script type="text/javascript" src="../../resources/js/login.js"></script>
	<script type="text/javascript"
		src='<c:url value="/resources/ajax/discussionAjax.js"></c:url>' ></script>
	<script type="text/javascript" src='<c:url value="/resources/js/discussion.js"></c:url>' ></script>
	<script type="text/javascript" src='<c:url value="/resources/js/setTime.js"></c:url>' ></script>
	
<jsp:include page="../default/footer.jsp"/>