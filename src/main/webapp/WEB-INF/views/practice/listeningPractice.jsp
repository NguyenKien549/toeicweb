<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${practice.getName()}</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/listening.css">
</head>
<body>
<jsp:include page="../default/header.jsp"></jsp:include>

		<!-- content -->
		<div class="container content" style="margin-top: 73px;">
			<div class="row part-list">
				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart" style = "padding-left: 20px;padding-right: 30px">
					<div class="col-3 part">
						<a href="${pageContext.request.contextPath}/listeningpractice/1" id="part1">Part 1: Photo</a>
					</div>
					<div class="col-3 part">
						<a href="${pageContext.request.contextPath}/listeningpractice/2" id="part2">Part 2: Question-Response</a>
					</div>
					<div class="col-3 part">
						<a href="${pageContext.request.contextPath}/listeningpractice/3" id="part3">Part 3: Short conversation</a>
					</div>
					<div class="col-3 part">
						<a href="${pageContext.request.contextPath}/listeningpractice/4" id="part4">Part 4: Short talk</a>
					</div>
				</div>

				<div class="col-lg-9 col-sm-9 col-xs-9 col-9 questions">
					<div class="listQuestions">
						<h2 id="title" class="${practice.getId()}">${practice.getName()}</h2>
						<hr>
						<div class="contentPractice">
							<audio class="audio" id="${practice.getPart()}" controls> <source
								src="${pageContext.request.contextPath}/${practice.getAudio().getAudio()}"
								type="audio/mpeg"></audio>
								
								<div class="question">

								</div>
						</div>
						<button class="btn btn-primary submit">Submit</button>
					</div>
				</div>
				<!-- het phan noi dung cau hoi -->

				<div class="col-sm-3 col-lg-3 col-xs-3 col-3 timer">
					<div class="box-answer col-3">
						<div class="header">
							<p id="time" style="margin-bottom: 0;">0:5:00</p>
						</div>
						<div class="answers"></div>
					</div>
				</div>

			</div>

		</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src='<c:url value = "/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
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
	<script type="text/javascript" src="../../../resources/ajax/listeningAjax.js"></script>
	<script type="text/javascript" src="../../../resources/js/listening.js"></script>
<jsp:include page="../default/footer.jsp"></jsp:include>