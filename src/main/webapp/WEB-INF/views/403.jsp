<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}">
<title>Permission required</title>
</head>
<body>
<h1>You are not permission to access this url.</h1>

<a href="${pageContext.request.contextPath}">If not manually turning the page after 3 seconds, click here.</a>
</body>
</html>