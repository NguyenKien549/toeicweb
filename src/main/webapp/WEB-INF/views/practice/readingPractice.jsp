<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Reading Practice</title>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/reading.css">

<!-- 	phan cu -->
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/default.css">
</head>
<body>
	<jsp:include page="../default/header.jsp"></jsp:include>

		<!-- content -->
		<div class="container content">
			<div class="row background"></div>

			<div class="part-list row">
				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart ">
					<div class="part5 col-4 part">
						<a href="${pageContext.request.contextPath}/readingpractice/5"><span>Part
								5: Incomplete Sentence</span></a>
					</div>
					<div class="part6 col-4 part">
						<a href="${pageContext.request.contextPath}/readingpractice/6"><span>Part
								6: Text completion</span></a>
					</div>
					<div class="part7 col-4 part">
						<a href="${pageContext.request.contextPath}/readingpractice/7"><span>Part
								7: Reading comprehen</span></a>
					</div>
				</div>

				<div class="col-lg-10 col-sm-10 col-xs-10 col-10 questions">
					<div  class="practicePart" id="${practice.getPart()}">
						<h2 id="title">${practice.getName() }</h2>
						<div class="contentPractice listQuesions">
							
						</div>
					</div>
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
		src="../../../resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../../resources/js/login.js"></script>
	<script type="text/javascript" src="../../../resources/ajax/login.js"></script>
	<script type="text/javascript" src="../../../resources/ajax/readingAjax.js"></script>
<jsp:include page="../default/footer.jsp"></jsp:include>
	