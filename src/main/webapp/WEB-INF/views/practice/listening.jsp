<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listening Practice</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../resources/css/listening.css">
</head>
<body>

<jsp:include page="../default/header.jsp"></jsp:include>
		<!-- content -->
		<div class="container content">
			<div class="row background"></div>

			<div class="row part-list">
				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart ">
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

				<div class="col-lg-8 col-sm-8 col-xs-8 col-8 questions">
					<div class="listQuestions">
						<h2 id="title">${partTitle}</h2>
						<hr>
						<!-- 						<button class="btn btn-primary start">Start</button> -->
						<div class="contentPractice">
							<div class="question">
								<!-- 								<table class="table table-striped"> -->
								<!-- 									<tbody> -->
								<ul class="list-group">
									<c:forEach items="${listPractice}" var="practice">
										<li class="listeningPractice list-group-item" value="${practice.getId()}">
											<span class="${part}">${practice.getName()}</span>
										</li>
									</c:forEach>
								</ul>

								<!-- 									</tbody> -->

								<!-- 								</table> -->
							</div>
							<!-- 							<button class="btn btn-primary submit">Submit</button> -->
						</div>
					</div>
				</div>
				<!-- het phan noi dung cau hoi -->

<!-- 				<div class="col-sm-4 col-lg-4 col-xs-4 col-4 timer"> -->
<!-- 					<div class="box-answer"> -->
<!-- 						<div class="header"> -->
<!-- 							<p id="time" style="margin-bottom: 0;">0:5:00</p> -->
<!-- 						</div> -->
<!-- 						<div class="answers"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>

		</div>

	<script src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
	<script type="text/javascript" src="../resources/js/login.js"></script>
	<script type="text/javascript" src="../resources/ajax/login.js"></script>
	<script type="text/javascript" src="../resources/js/listening.js"></script>
<jsp:include page="../default/footer.jsp"></jsp:include>