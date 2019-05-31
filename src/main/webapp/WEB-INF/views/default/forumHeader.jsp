<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="login-box" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Username</label> <input class="form-control" type="text"
							id="usernameLogin" placeholder="Username" required="required"></input>
					</div>

					<div class="form-group">
						<label>Password</label> <input class="form-control"
							id="passwordLogin" type="password" placeholder="Password"
							required="required"></input>
					</div>
					<button type="button" class="btn btn-primary loginButton">Login</button>
				</div>
			</div>

		</div>
	</div>
	<!-- het login-dialog -->

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top"
			style="background-color: #0033c3"> <!-- Brand --> <span><img
			class="logo" src='<c:url value="/resources/img/forum_icon.png"></c:url>' width="40px"
			height="40px" style="opacity: 0.8"> <a class="navbar-brand"
			href="${pageContext.request.contextPath}/BKForum">BKForum</a></span> <!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/user/test">TEST</a></li>
				<li class="nav-item">
					<c:choose>
						<c:when test="${name != null }">
							<div class="dropdown nav-link" data-toggle="dropdown"
						style="padding: 0">
						<a class="nav-link user" href="#" id="${user.getUsername() }">${name}</a>
						<ul class="dropdown-menu" id="menu-acc">
							<li id="information">Account Management</li>
							<li id="dangxuat-btn">Đăng xuất</li>
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