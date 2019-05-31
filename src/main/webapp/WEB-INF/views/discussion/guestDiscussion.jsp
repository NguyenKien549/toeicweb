<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<jsp:include page="../default/forumHeader.jsp"></jsp:include>

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
	<script type="text/javascript" src="resources/ajax/discussionAjax.js"></script>

	<jsp:include page="../default/footer.jsp"></jsp:include>
	