<%@page import="com.bktoeic.model.Account"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href='<c:url value="/resources/css/default.css"></c:url>'>

<!-- Modal -->
	<div class="modal fade" id="login-box" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<form method="post" class="login-content form-login"
						action="${pageContext.request.contextPath}/checklogin">
						<div class="form-group">
							<label>Username</label> <input class="form-control"
								name="usernameLogin" type="text" placeholder="Username"
								required="required"></input>
						</div>

						<div class="form-group">
							<label>Password</label> <input class="form-control"
								name="passwordLogin" type="password" placeholder="Password"
								required="required"></input>
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>
			</div>

		</div>
	</div>
	<!-- het login-dialog -->

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top">
			<!-- Brand -->
			<span><img class="logo" src='<c:url value="/resources/img/logo.png"></c:url>'
				width="40px" height="40px" style="opacity: 0.8"> <a
				class="navbar-brand" href="${pageContext.request.contextPath}">BKTOEIC</a></span>

			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse justify-content-end"
				id="collapsibleNavbar">
				<ul class="navbar-nav">
					
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/home">HOME</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/BKForum">FORUM</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/user/test">TEST</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/forUs">ABOUT</a></li>
					<li class="nav-item">
					
					<% Account acc = (Account) session.getAttribute("logAcc");
						if(acc!=null)
							session.setAttribute("type", acc.getType());
					%>
					<c:choose>
						<c:when test="${name != null }">
							<div class="dropdown nav-link" data-toggle="dropdown"
								style="padding: 0">
								<a class="nav-link" href="#">${name}</a>
								<ul class="dropdown-menu" id="menu-acc">
								<% if( session.getAttribute("type").equals("Admin")) 
									out.print("<li  class=\"adminPage\"><span >Admin View</span></li>");
								%>
									
<!-- 									<li ><span class="accountManagement">Account Management</span></li> -->
									<li id="dangxuat-btn"><span class="logout">Logout</span></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link login-window"
								data-target="#login-box" data-toggle="modal" href="#">LOGIN</a></li>
						</c:otherwise>
					</c:choose>
						
					</li>

				</ul>
			</div>
		</nav>