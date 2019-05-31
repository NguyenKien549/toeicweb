<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${test.getTitle() }</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../../resources/css/login.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/test.css">
</head>
<body>
	<jsp:include page="default/header.jsp"></jsp:include>
		<!-- content -->
		<div class="container content">
			<div class="row background"></div>

			<div class="row part-list">
				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart listening">
					<div class="col-3 part" id="part1">Part 1: Photo</div>
					<div class="col-3 part" id="part2">Part 2: Question-Response</div>
					<div class="col-3 part" id="part3">Part 3: Short conversation</div>
					<div class="col-3 part" id="part4">Part 4: Short talk</div>
				</div>

				<div class="col-12 col-sm-12 col-xs-12 col-lg-12 listPart reading">
					<div class="col-4 part" id="part5">Part 5: Incomplete
						Sentence</div>
					<div class="col-4 part" id="part6">Part 6: Text completion</div>
					<div class="col-4 part" id="part7">Part 7: Reading comprehen</div>
				</div>

				<div class="col-lg-10 col-sm-10 col-xs-10 col-10 questions">
					<div class="listQuestions" id="${test.getId()}">
						<div class="contentTest listeningContent">
						<div class="audio">
							<audio class="playAudio" controls> <source src="${pageContext.request.contextPath }/${test.getAudio().getAudio()}" type="audio/mpeg"></audio>
						</div>

							<div class="part1 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 1: Photo</h2> -->

<!-- 								<div class="part1_Ques">								 -->
<!-- 								</div> -->
								<!-- het part 1 -->
							</div>
							<!-- het phan cau hoi -->


							<div class="part2 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 2: Question-Response</h2> -->
<!-- 								<div class="part2_Ques"> -->
									
<!-- 								</div> -->
							</div>
							<!-- het part2 -->


							<div class="part3 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 3: Short conversation</h2> -->
<!-- 								<div class="part3_Ques"> -->
									
<!-- 								</div> -->

							</div>
							<!-- het part 3 -->


							<div class="part4 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 4: Short talk</h2> -->
<!-- 								<div class="part4_Ques"> -->
									
<!-- 								</div> -->
							</div>
							<!-- het part 4 -->

						</div>
						<!-- het phan nghe -->
						<div class="contentTest readingContent">
							<div class="part5 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 5: Incomplete Sentence</h2> -->
<!-- 								<div class="part5_Ques"> -->
									
<!-- 								</div> -->
							</div>
							<!-- het part 5 -->

							<div class="part6 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 6: Text completion</h2> -->
<!-- 								<div class="part6_Ques"> -->
								
<!-- 								</div> -->
							</div>
							<!-- het part 6 -->

							<div class="part7 partContent">
<!-- 								<hr> -->
<!-- 								<h2 id="title">Part 7: Reading comprehen</h2> -->
<!-- 								<div class="part7_Ques"> -->
									
<!-- 								</div> -->
							</div>
							<!-- het part 7 -->
						</div>
					</div>

					<button class="btn btn-primary submitTest">Submit</button>
				</div>
				<!-- het phan noi dung cau hoi -->

				<div class="col-sm-2 col-lg-2 col-xs-2 col-2 timer">
					<div class="box-answer">
						<div class="header">
							<p id="time" style="margin-bottom: 0;">2:00:00</p>
						</div>
						<div class="answers"></div>
					</div>
				</div>
				<!-- het phan thoi gian -->

			</div>
			<!-- het phan content cau hoi -->

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
	<script type="text/javascript" src="../../../resources/ajax/testAjax.js"></script>
	<script type="text/javascript" src='<c:url value="/resources/js/login.js"></c:url>'></script>

	<jsp:include page="default/footer.jsp"></jsp:include>
<%-- 	<% Import  %> --%>
	