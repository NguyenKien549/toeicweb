<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Management</title>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/bootstrap/bootstrap.min.css"></c:url>'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/resources/css/admin.css"></c:url>'>
</head>
<body>
<jsp:include page="../default/adminHeader.jsp"></jsp:include>
		<!-- table and button -->
		<div class="row justify-content-center" style="margin-left: 15em;">
			<!-- Khung ngoai table -->
			<div class="col-11 row justify-content-center"
				style="border: 1px black solid; margin-top: 3em; padding: 0">
				<!-- tieu de khung ngoai -->
				<div class="col-12 tableName"
					style="height: 2em; background-color: #575464; line-height: 2em">
					<span>Bảng quản lý tài liệu</span>
				</div>

				<!-- search -->
<!-- 				<div class="col-12 row justify-content-end" -->
<!-- 					style="padding-top: 1em; padding-bottom: 1em"> -->
<!-- 					<div class="col-md-8" style="text-align: right;"> -->
<!-- 						<span><input id="btnsearch" type="button" name="submit" -->
<!-- 							value="Search"></span> <input id="search" type="text" name="q" -->
<!-- 							style="border-radius: 4px"> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<!-- TABLE -->
				<div class="justify-content-center col-12 main-table contentTable">
					<table class="table table-bordered questionTable"
						style="min-width: 800px">
						<thead class="thead-dark headerTable">
							<tr class="d-flex">
								<th class="col-sm-1 col-md-1">ID</th>
								<th class="col-sm-6 col-md-6">Content</th>
								<th class="col-sm-1 col-md-1">User</th>
								<th class="col-sm-1 col-md-1">Reported Discussion</th>
								<th class="col-sm-1 col-md-1">Reported Comment</th>
								<th class="col-sm-1 col-md-1">Reported Reply</th>
								<th class="col-sm-1 col-md-1">Time</th>
							</tr>
						</thead>
						<tbody class="bodyTable">
							<c:forEach items="${reportsList}" var="report">
								<tr class="d-flex">
									<td class="col-sm-1 col-md-1">${report.getId() }</td>
									<td class="col-sm-6 col-md-6">${report.getContent() }</td>
									<td class="col-sm-1 col-md-1">${report.getUser().getUsername() }</td>
									
										<c:choose>
											<c:when test="${report.getReportedDiscussion() != null}">
												<td class="col-sm-1 col-md-1" title="${report.getReportedDiscussion().getUser().getUsername() }: ${report.getReportedDiscussion().getTitle() }"
												><a href="${pageContext.request.contextPath}/discussion/${report.getReportedDiscussion().getTitle() }/${report.getReportedDiscussion().getId() }">Access</a></td>
											</c:when>
											<c:otherwise>
												<td class="col-sm-1 col-md-1"></td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${report.getReportedComment() != null}">
												<td class="col-sm-1 col-md-1" title="${report.getReportedComment().getDiscussion().getUser().getUsername() }: ${report.getReportedComment().getDiscussion().getTitle() }"
												><a href="${pageContext.request.contextPath}/discussion/${report.getReportedComment().getDiscussion().getTitle() }/commentId=${report.getReportedComment().getId() }">Access</a></td>
											</c:when>
											<c:otherwise>
												<td class="col-sm-1 col-md-1"></td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											
											<c:when test="${report.getReportedReplyComment() != null}">
												<td class="col-sm-1 col-md-1" title="${report.getReportedReplyComment().getComment().getDiscussion().getUser().getUsername() }: ${report.getReportedReplyComment().getComment().getDiscussion().getTitle() }"
												><a href="${pageContext.request.contextPath}/discussion/${report.getReportedReplyComment().getComment().getDiscussion().getTitle() }/replyCommentId=${report.getReportedReplyComment().getId() }">Access</a></td>
											</c:when>
											<c:otherwise>
												<td class="col-sm-1 col-md-1"></td>
											</c:otherwise>
										
									</c:choose>
									
									<td class="col-sm-1 col-md-1"><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${report.getTime()}" type="Date"></fmt:formatDate></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

		<jsp:include page="../default/paginationAdmin.jsp"></jsp:include>

			</div>
<!-- 			<!-- btn delete --> -->
			<div class="col-11 row justify-content-start"
				style="margin-top: 1.5em; margin-bottom: 1em">
<!-- 				<input id="addLesson" type="button" class="test" value="Add Test" -->
<!-- 					data-toggle="modal" data-target="#myModal-addLesson" -->
<!-- 					style="padding: 0.8em 1em; background-color: #066310; color: white; border: none; border-radius: 0.5em; margin-right: 2em"> -->
<!-- 				<input id="updateLesson" type="button" class="test" value="Edit Test" -->
<!-- 					style="padding: 0.8em 1em; background-color: #c9310c; color: white; border: none; border-radius: 0.5em; margin-right: 2em"> -->
				<input id="deleteReport" class="report" type="button"
					value="Delete Report"
					style="padding: 0.8em 1em; background-color: #F70000; color: white; border: none; border-radius: 0.5em; margin-right: 2em">
<!-- 				<input id="addDocument" type="button" class="test" -->
<!-- 					value="Add Document" -->
<!-- 					style="padding: 0.8em 1em; color: white; background-color: #0000FF; border: none; border-radius: 0.5em; margin-right: 2em"> -->
<!-- 				<input id="updateDocument" type="button" class="test" -->
<!-- 					value="Update Document" -->
<!-- 					style="padding: 0.8em 1em; color: white; background-color: #c9310c; border: none; border-radius: 0.5em; margin-right: 2em"> -->
			</div>
		</div>
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
		src='<c:url value='/resources/ajax/reportManagementAdmin.js'></c:url>'></script>
</body>
</body>
</html>