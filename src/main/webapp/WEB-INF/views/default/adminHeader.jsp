<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- HEADER -->
	<nav class="navbar navbar-expand bg-dark navbar-dark fixed-top">
		<div class="container-fluid">
			<!-- Brand -->
			<a class="navbar-brand" href="${pageContext.request.contextPath}/admin/accountManagement/1">BKTOEIC ADMIN</a>

			<!-- Navbar links -->
			<div class=" navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li id="mail" class="nav-item"><a class="nav-link mr-100"
						href="#"><img class="ico-header"
							src='<c:url value="/resources/img/email-icon.png"></c:url>'></a></li>
					<li id="acc" class="nav-item">
						<div class="dropdown nav-link" data-toggle="dropdown">
							<img class="ico-header" src='<c:url value="/resources/img/account-icon.png"></c:url>'>
							<ul class="dropdown-menu" id="menu-acc">
								<li id="userView">User View</li>
								<li id="dangxuat-btn">Logout</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- body -->
	<div class="container-fluid" style="padding-top: 50px;">
		<!-- menu left -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li> <a href="${pageContext.request.contextPath}/admin/accountManagement/1" class="choice"><img class="ico-manag"
						src='<c:url value="/resources/img/account-manager.png"></c:url>'>Quản lý tài khoản</a>
				</li>
				<li><a href="${pageContext.request.contextPath}/admin/lessonManagement/practice/1"  class="choice"><img class="ico-manag"
						src='<c:url value="/resources/img/baihoc-manager.png"></c:url>'>Quản lý bài học</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/questionManagement/part1/1"  class="choice"><img class="ico-manag"
						src='<c:url value="/resources/img/baihoc-manager.png"></c:url>'>Quản lý ngân hàng câu hỏi</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/discussionManagement/1"  class="choice"><img class="ico-manag"
						src='<c:url value="/resources/img/btl-manager.png"></c:url>'>Quản lý bài thảo luận</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/reportManagement/1"  class="choice"><img class="ico-manag"
						src='<c:url value="/resources/img/btl-manager.png"></c:url>'>Quản lý report</a></li>
			</ul>
		</div>