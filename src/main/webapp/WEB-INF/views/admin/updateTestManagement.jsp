<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Test Management</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/bootstrap/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/admin.css"></c:url>'>
</head>
<body>
<jsp:include page="../default/adminHeader.jsp"></jsp:include>

		<div class="infoTest row" style="margin-left: 20em; margin-top: 1em">
			<div class="col-12 form-group row">
				<span class="col-12" style="margin-left: 37%; font-size: 2em;">Update
					Test</span>
			</div>
			<div class="col-12 form-group row">
				<span class="col-1">Id: </span> <input
					class="col-4 form-control testIdUpdate" value="${test.getId()}"
					readonly="readonly">
				<div class="col-1"> Selected Question:</div>
				<div class="col-2" style="font-size: 20px"> Audio: <span class="audioSelected">0</span></div>
				<div class="col-2" style="font-size: 20px">Part 5: <span class="part5Selected">0</span></div>
				<div class="col-2" style="font-size: 20px">Total: <span class="totalSelected">0</span></div>
			</div>

			<div class="col-12 form-group row">
				<span class="col-1">Title: </span> <input
					class="col-4  form-control" value="${test.getTitle() }"
					readonly="readonly">
				<div class="col-1"></div>
				<div class="col-2" style="font-size: 20px">Part 6: <span class="part6Selected">0</span></div>
				<div class="col-2" style="font-size: 20px">Part 7: <span class="part7Selected">0</span></div>
			</div>
		</div>
		<!-- table and button -->
		<div class="row justify-content-center" style="margin-left: 16em;">
			<!-- Khung ngoai table -->
			<div class="col-6 currentTest"
				style="border-right: 1px solid grey; padding-left: 0;">
				<div class="title col-12">
					<span style="margin-left: 39%; font-size: 1.5em;">Current
						Test</span>
				</div>
				<span style="font-size: 18px;">Audio:</span>
				<div class="audios currentAudios row">
					<c:choose>
						<c:when test="${test.getAudio() != null}">
							<input type="checkbox" class="audioCheckBox"
								id="${test.getAudio().getId()}"
								style="margin-top: 1%; margin-left: 5%; height: 18px; width: 18px;"
								checked="checked" value="100">
							<audio controls>
								<source
									src="${pageContext.request.contextPath}/${test.getAudio().getAudio()}">
							</audio>
						</c:when>
						<c:otherwise>
							<p style="    margin-left: 3%;">No data.</p>
						</c:otherwise>
					</c:choose>

				</div>
				<span style="font-size: 18px; margin-top: 1%">Part 5:</span>
				<div class="part5s currentPart5s"
					style="max-height: 40em; overflow: auto; margin-bottom: 2%;">
					<c:choose>
						<c:when test="${test.getListPart5().size() >0}">
							<c:set scope="page" var="countPart5" value="1"></c:set>
							<c:forEach items="${test.getListPart5()}" var="part5">
								<div class="part5Questions par5Question${countPart5} row"
									style="margin-right: 0%;">
									<input type="checkbox" class="part5CheckBox"
										id="${part5.getId()}"
										style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;"
										checked="checked" value="1">
									<div class="paraContent col-11"
										style="max-height: 3em; overflow: hidden;">${part5.getQuestion()}
									</div>

								</div>
								<hr>
								<c:set scope="page" var="count" value="${countPart5 +1 }"></c:set>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>No data.</p>
						</c:otherwise>
					</c:choose>


				</div>
				<span style="font-size: 18px; margin-top: 1%">Paragraph
					Part6:</span>
				<div class="paragraphPart6s currentParagraphPart6"
					style="max-height: 25em; overflow: auto; margin-bottom: 2%;">
					<c:choose>
						<c:when test="${test.getListParagraph().size() >0}">
							<c:set scope="page" var="countPara" value="1"></c:set>

							<c:forEach items="${test.getListParagraph()}" var="para">
								<c:choose>
									<c:when test="${para.getPart() == 6 }">
										<div class="paragraph paragraph${countPara} row"
											style="margin-right: 0%;">
											<input type="checkbox" class="paragraphCheckBox part6"
												id="${para.getId()}"
												style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;"
												checked="checked" value="${para.getPart6().size()}">
											<div class="paraContent col-11"
												style="max-height: 3em; overflow: hidden;" title="${para.getPart6().size()} questions">${para.getParagraph() }</div>
										</div>
										<hr>
										<c:set scope="page" var="countPara" value="${countPara +1 }"></c:set>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>No data.</p>
						</c:otherwise>
					</c:choose>


				</div>

				<span style="font-size: 18px; margin-top: 1%">Paragraph
					Part7:</span>
				<div class="paragraphPart7s currentParagraphPart7"
					style="max-height: 30em; overflow: auto; margin-bottom: 2%;">

					<c:choose>
						<c:when test="${test.getListParagraph().size() >0}">
							<c:set scope="page" var="countPara" value="1"></c:set>

							<c:forEach items="${test.getListParagraph()}" var="para">
								<c:choose>
									<c:when test="${para.getPart() == 7 }">
										<div class="paragraph paragraph${countPara} row"
											style="margin-right: 0%;">
											<input type="checkbox" class="paragraphCheckBox part7"
												id="${para.getId()}"
												style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;"
												checked="checked" value="${para.getPart7().size()}">
											<div class="paraContent col-11"
												style="max-height: 3em; overflow: hidden;" title="${para.getPart7().size()} questions">${para.getParagraph() }</div>

										</div>
										<hr>
										<c:set scope="page" var="countPara" value="${countPara +1 }"></c:set>
									</c:when>
								</c:choose>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>No data.</p>
						</c:otherwise>
					</c:choose>

				</div>

			</div>

			<div class="col-6 testDocument">
				<div class="title col-12">
					<span style="margin-left: 39%; font-size: 1.5em;">Document</span>
				</div>
				<span style="font-size: 18px;">Audio:</span>
				<div class="audios audioDocuments"
					style="max-height: 20em; overflow: auto; margin-bottom: 2%;">
					<c:set scope="page" var="count" value="1"></c:set>
					<c:forEach items="${audioDocuments}" var="audio">
						<div class="audio audioDocument${count} row"
							style="margin-right: 2%;">
							<input type="checkbox" class="audioCheckBox"
								id="${audio.getId()}"
								style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;" value="100">
							<audio controls>
								<source
									src="${pageContext.request.contextPath}/${audio.getAudio()}">
							</audio>
						</div>
						<hr>
						<c:set scope="page" var="count" value="${count +1 }"></c:set>
					</c:forEach>


				</div>
				<span style="font-size: 18px; margin-top: 1%">Part 5:</span>
				<div class="part5s part5Questions"
					style="max-height: 40em; overflow: auto; margin-bottom: 2%;">
					<c:set scope="page" var="countPart5" value="1"></c:set>
					<c:forEach items="${part5Documents}" var="part5">
						<div class="part5Question par5Question${countPart5} row"
							style="margin-right: 0%;">
							<input type="checkbox" class="part5CheckBox"
								id="${part5.getId()}"
								style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;" value="1">
							<div class="paraContent col-11"
								style="max-height: 3em; overflow: hidden;">${part5.getQuestion()}
							</div>

						</div>
						<hr>
						<c:set scope="page" var="count" value="${countPart5 +1 }"></c:set>
					</c:forEach>
				</div>
				<span style="font-size: 18px; margin-top: 1%">Paragraph
					Part6:</span>
				<div class="paragraphPart6s paragraphPart6Documents"
					style="max-height: 25em; overflow: auto; margin-bottom: 2%;">
					<c:set scope="page" var="countPara" value="1"></c:set>

					<c:forEach items="${part6Documents}" var="para">
						<c:choose>
							<c:when test="${para.getPart() == 6 }">
								<div class="paragraph paragraph${countPara} row"
									style="margin-right: 0%;">
									<input type="checkbox" class="paragraphCheckBox part6"
										id="${para.getId()}"
										style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;"
										value="${para.getPart6().size()}">
									<div class="paraContent col-11"
										style="max-height: 3em; overflow: hidden;" title="${para.getPart6().size()} questions">${para.getParagraph() }</div>

								</div>
								<hr>
								<c:set scope="page" var="countPara" value="${countPara +1 }"></c:set>
							</c:when>
						</c:choose>

					</c:forEach>
				</div>

				<span style="font-size: 18px; margin-top: 1%">Paragraph
					Part7:</span>
				<div class="paragraphPart7s paragraphPart7Documents"
					style="max-height: 30em; overflow: auto; margin-bottom: 2%;">
					<c:set scope="page" var="countPara" value="1"></c:set>

					<c:forEach items="${part7Documents}" var="para">
						<c:choose>
							<c:when test="${para.getPart() == 7 }">
								<div class="paragraph paragraph${countPara} row"
									style="margin-right: 0%;">
									<input type="checkbox" class="paragraphCheckBox part7"
										id="${para.getId()}"
										style="margin-top: 1%; margin-left: 3%; height: 18px; width: 18px;"
										value="${para.getPart7().size()}">
									<div class="paraContent col-11"
										style="max-height: 3em; overflow: hidden;" title="${para.getPart7().size()} questions">${para.getParagraph() }</div>

								</div>
								<hr>
								<c:set scope="page" var="countPara" value="${countPara +1 }"></c:set>
							</c:when>
						</c:choose>

					</c:forEach>
				</div>
			</div>
		</div>

		<input id="updateTestDocumentSubmit" type="button" class="test"
			value="Update"
			style="padding: 0.8em 1em; color: white; background-color: #c9310c; border: none; border-radius: 0.5em; margin: 2% 0 3% 53%; width: 12%;">


	</div>


	<!-- footer -->
	<script type="text/javascript"
		src='<c:url value="/resources/js/jquery-3.2.1.min.js"></c:url>'></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/js-for-admin-acc.js"></c:url>'></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script type="text/javascript"
		src='<c:url value="/resources/js/bootstrap/bootstrap.min.js"></c:url>'></script>
	<script type="text/javascript"
		src='<c:url value='/resources/ajax/lessonManagement.js'></c:url>'></script>
</body>
</body>
</html>