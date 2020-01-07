<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function myFunction() {//마이페이지 버튼
	var myWindow = window.open("http://localhost:8088/ang/MyPage.jsp","_blank", "width=605,height=445");
}
</script>
<head>
<style type="text/css">
html {
	height: 100%;
}

body {
	width: 1200px;
	height: 100%;
	margin: 0px auto;
	font-size: 0pt;
}

div {
	display: inline-block;
	vertical-align: top;
}

body>div, .right>div {
	font-size: 11pt;
}

.left {
	width: 200px;
	min-height: 625px;
	background-color: green;
}

.right {
	width: 1000px;
	min-height: 625px;
	font-size: 0pt;
}

.content {
	width: 900px;
	min-height: 600px;
	background-color: red;
}

.bottom {
	width: 1200px;
	height: 150px;
	background-color: blue;
}

.history {
	width: 100px;
	min-height: 600px;
	background-color: green;
}

.Rogo {
	width: 200px;
	height: 200px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
	<button onclick="myFunction()">마이 페이지</button><!-- 마이페이지버튼 클릭 시 -->
</body>
</html>