<link rel="stylesheet" type="text/css" href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" type="text/css" href="resources/css/default.css">
<body>

	<div class="container-fluid div-parent">
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top">
			<!-- Brand -->
			<span><img class="logo" src="resources/img/logo.png"
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
					<form class="form-inline mr-auto"
						action="https://google.com/search" target="blank">
						<input class="form-control mr-sm-2 input-search active"
							type="text" placeholder="Search" name="q"> <img
							class="btn-search" src="resources/img/search.png" width="35px"
							height="35px" style="opacity: 0.9">
					</form>
					<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
					<li class="nav-item"><a class="nav-link" href="#">FORUM</a></li>
					<li class="nav-item"><a class="nav-link" href="#">TEST</a></li>
					<li class="nav-item"><a class="nav-link" href="#">ABOUT</a></li>
					<li class="nav-item">
						<div class="dropdown nav-link" data-toggle="dropdown"
							style="padding: 0">
							<a class="nav-link" href="#">${name}</a>
							<ul class="dropdown-menu" id="menu-acc">
								<li id="dangxuat-btn"><a href="dangxuat">Đăng xuất</a></li>
							</ul>
						</div>
					</li>

				</ul>
			</div>
		</nav>