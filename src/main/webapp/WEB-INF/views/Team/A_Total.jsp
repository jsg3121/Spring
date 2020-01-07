<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
</script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.content {
	width: 1100px;
}
.content>div{
	width: 250px;
	height: 220px;
}
.logbox {
	margin-left: 20px;
	border: 1px solid #9e9e9e;
	display: inline-block;
	height: 200px;
}
.boardbox {
	margin-left: 70px;
	border: 1px solid #9e9e9e;
	display: inline-block;
	height: 200px;
}
div>span{
	margin-left: 10px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="left">
		<c:import url="AdminLeft.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top2.jsp" />
		<!-- 컨탠츠 --> 
		<div class="content">
			<div style="width: 100%;height: 60px;">
				<h2>통계</h2>
			</div><br>
			<div class="logbox">
				 <h3> 접속자</h3>
				<span>금일 접속자: ${J_days} 명 </span><br /><br />
				<span>7일간 접속자: ${J_weeks} 명 </span><br /><br /> 
				<span>30일간 접속자: ${J_months} 명 </span>
			</div>
			<div class="boardbox">
				 <h3> 게시글</h3>
				<span>금일 게시글: ${B_days} 건 </span><br /><br /> 
				<span>7일간 게시글: ${B_weeks} 건 </span><br /><br /> 
				<span>30일간 게시글: ${B_months} 건 </span>
			</div>
		</div>
	</div>
</body>
</html>