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

<!-- text editor -->
	<script src="resources/assets/ckeditor/ckeditor.js"></script>
</head>
<body>

	<jsp:include page="../default/forumHeader.jsp"></jsp:include>
		
		<div class="background container">
		</div>
		
		<!-- content -->
		<div class="container content">
			<div class="sloganTitle">
				<span>Nơi dành cho mọi người thảo luận, trao đổi liên quan đến Toeic. Hãy cùng nhau xây dựng một cộng đồng vững mạnh bạn nhé!</span>
			</div>
		
			
			<div class="discussion">
				<div class="uploadDiscussion col-2 row" data-toggle="modal" data-target="#newTopicModal">
					<span>+ New topic</span>
				</div>
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
		
		<!-- Modal -->
			<div id="newTopicModal" class="modal fade" role="dialog">
			  <div class="modal-dialog modal-lg">

			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">New Topic</h4>
			      </div>
			      <div class="modal-body">
			        <div class="title row">
			      		<span class="col-1" style="margin: auto">Title</span>
						<input type="text" class= "form-control" id="title">
			      	</div>
			      	
					<div class="inputContent">
						<span>Content</span>
			        	<textarea name="topicContent" id="topicContent"></textarea>
			        </div>
			      </div>
			      <div class="modal-footer" style="justify-content: center;">
			        <button type="button" class="btn btn-primary postTopic" data-dismiss="modal" style="margin-left: 0;width: 6em;font-size: 17px;">Post</button>
			      </div>
			    </div>

			  </div>
			</div> <!-- het modal -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	
	<script>
		CKEDITOR.replace('topicContent');
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
		src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/js/setTime.js"></script>
	<script type="text/javascript" src="resources/ajax/discussionAjax.js"></script>

<jsp:include page="../default/footer.jsp"></jsp:include>
