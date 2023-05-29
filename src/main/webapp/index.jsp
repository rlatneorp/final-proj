<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INDEX</title>
</head>
<body>
	<h1>HOLLOSEKKI 로고</h1>
	<script>
		window.onload =()=>{
			location.replace("${pageContext.servletContext.contextPath}/home.do")
		}
	</script>
</body>
</html>