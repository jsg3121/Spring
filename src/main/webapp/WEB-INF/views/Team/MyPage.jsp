<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.content>div {
	min-height: 0px;
}

.box {
	display: inline-block;
	height: 420px;
	width: 580px;
	background-color: rgb(224, 224, 224);
	border: 1px solid #6c6c6c;
	top: calc(50% - 50px);
	left: calc(50% - 100px);
	z-index: 200;
	
}

.line1 { /* 칸 정리(좌) */
	/* border: 1px solid black; */
	width: 240px;
	height: 400px;
}

.line2 { /* 칸 정리(우) */
	width: 320px;
	height: 400px;
	margin-top: 30px;
}

.box1 {
	display: inline-block;
	width: 220px;
	height: 320px;
	font-size: 10px;
	font-weight: bolder;
	border: 1px solid #ef8e84;
	background-color: #ef8e84;
}

.box2 {
	display: inline-block;
	width: 110px;
	height: 25px;
	font-size: 18px;
	padding: 30px 10px 10px 10px;
}

.circle {
	display: inline-block;
	width: 100px;
	height: 100px;
	border-radius: 10em;
	border: 1px solid black;
}

.box3 {
	display: inline-block;
	width: 160px;
	height: 100px;
	font-size: 18px;
	border: 1px solid black;
	margin: 10px 10px 10px 10px;
}

.btn1 {
	display: inline-block;
	width: 240px;
	height: 30px;
	margin: 10px 0px;
	text-align: center;
}

.box4 {
	display: inline-block;
	width: 180px;
	height: 320px;
	font-size: 10px;
	font-weight: bolder;
	border: 1px solid white;
	background-color: #ef8e84;
}

.hu {
	border: 1px solid black;
	width: 320px;
	height: 110px;
}

.dat {
	border: 1px solid black;
	width: 320px;
	height: 110px;
}

.mo {
	border: 1px solid black;
	width: 320px;
	height: 110px;
}

.huMore {
	text-align: right;
	width: 229px;
}

.datMore {
	text-align: right;
	width: 229px;
}

.moMore {
	text-align: right;
	width: 214px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body style="overflow-x: hidden">
	<div class="box">
		<div class="line1">
			<!-- 죄측 -->
			<div class="box1" align="center" style="margin: 10px;">
				<div class="box2" align="center">개인프로필</div>
				<div class="circle">이미지넣을곳</div>
				<div class="box3" align="center">자기소개</div>
			</div>
			<div class="btn1">
				<!-- 회원정보변경 버튼 -->
				<button style="width: 100px; height: 50px; font-size: 13px; border-radius: 10px; background-color: rgb(52, 152, 219); color: white;">회원정보변경</button>
			</div>
		</div>
		<div class="line2">
			<!-- 우측 -->
			<div class="btn2">
				<button style="width: 80px; height: 20px; font-size: 8px; border-radius: 10px; background-color: #9b59b6; color: white; margin-left: 25px;">내가 쓴 후기</button>
				<button style="width: 80px; height: 20px; font-size: 8px; border-radius: 10px; background-color: #9b59b6; color: white;">내가 쓴 댓글</button>
				<button style="width: 83px; height: 20px; font-size: 8px; border-radius: 10px; background-color: #9b59b6; color: white;">내가 속한 모임</button>
			</div>
			<div class="hu" style="margin-top: 10px;">
				내가 쓴 후기
				<div class="huMore" align="right">+ 더보기</div>
				<ul>
					<li>테스트</li>
					<li>test</li>
					<li>xptmxm</li>
				</ul>
			</div>
			<div class="dat">
				내가 쓴 댓글
				<div class="datMore">+ 더보기</div>
				<ul>
					<li>테스트</li>
					<li>test</li>
					<li>xptmxm</li>
				</ul>
			</div>
			<div class="mo">
				내가 속한 모임
				<div class="moMore">+ 더보기</div>
				<ul>
					<li>테스트</li>
					<li>test</li>
					<li>xptmxm</li>
				</ul>
			</div>
		</div>
		</div>
</body>
</html>