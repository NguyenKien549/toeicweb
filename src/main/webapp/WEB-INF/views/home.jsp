<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/animate.css">
<body>

<jsp:include page="default/header.jsp"></jsp:include>
	
		<!-- content -->
		<div class="row height-79">
			<div class="container content">

				<div class="row register"></div>

				<div class="row practice">
					<div class="col-md-6 reading">
						<a href="${pageContext.request.contextPath}/readingpractice/5"><img
							 class="wow bounceInDown" src="resources/img/reading.png" width="70px" height="70px"></a>
						<a  href="${pageContext.request.contextPath}/readingpractice/5"><p class="wow bounceInUp" data-wow-duration="1s">READING
								PRACTICE</p></a>
					</div>
					<div class="col-md-6 listening">
						<a  href="${pageContext.request.contextPath}/listeningpractice/1">
							<img  class="wow bounceInDown" src="resources/img/listening.png" height="55px" width="55px">
						</a> <a href="${pageContext.request.contextPath}/listeningpractice/1"><p class="wow bounceInUp" data-wow-duration="1s">LISTENING
								PRACTICE</p></a>
					</div>
				</div>

			</div>
		</div>
		
			<script type="text/javascript" src="resources/js/wow.min.js"></script>
        <script>
              new WOW().init();
        </script>
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
	
	
	
	<script type="text/javascript" src="resources/js/login.js"></script>
	<script type="text/javascript" src="resources/ajax/login.js"></script>

	<jsp:include page="default/footer.jsp"></jsp:include>
	