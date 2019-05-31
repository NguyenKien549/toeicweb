<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Test</title>
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/reading.css">

<!-- 	phan cu -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/default.css">

<style type="text/css">
.test:hover {
	background: #007bff;
	cursor: pointer;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="default/header.jsp"></jsp:include>
	<!-- content -->
	<div class="container content">
		<div class="col-12 background"></div>
		<div class="col-12 part-list">

			<div class="col-lg-10 col-sm-10 col-xs-10 col-10 questions">
				<div class="listQuestions">
					<h2 id="title">Tests</h2>
					<hr>
					<div class="contentTest listTest">
						<ul class="list-group">
							<c:forEach items="${listTest}" var="test">
								<li class="test list-group-item" value="${test.getId()}"><span
									id="test${test.getId()}">${test.getTitle()}</span></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

		</div>

	</div>
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
			<script type="text/javascript" src='<c:url value="/resources/js/login.js"></c:url>'></script>

	<script>
		$(".test").click(function() {
			var id = $(this).val();
			location.href = "test/" + id + "/" + $("#test" + id).html();
		});
	</script>


	<jsp:include page="default/footer.jsp"></jsp:include>