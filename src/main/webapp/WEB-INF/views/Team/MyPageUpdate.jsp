<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="./script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".upPw").on("click",function(){
		/* location.href="PwUpdate.jsp"; */
		window.open("PwUpdate.jsp","_blank", "width=465,height=425");
	});
	
	$("#main").on("click",function(){
		location.href="MyPage.jsp";
	});
});
</script>	
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.content>div {
	min-height: 0px;
}
.mypagebox {
	display: inline-block;
	height: 420px;
	width: 580px;
	background-color: rgb(224, 224, 224);
	border: 1px solid #6c6c6c;
	z-index: 200;
	margin: 10px;
}
.mypagebox1 {
	width: 512px;
	height: 50px;
	margin: 10px 10px;
	color: black;
	font-size: 42px;
	font-weight: bolder;
}

.mypagebox2 {
	display: inline-block;
	width: 130px;
	height: 338px;
	font-size: 10px;
	font-weight: bolder;
	border-right: 1px solid black;
	border-top: 1px solid black;
}
.none{
	width: 170px;
	height: 60px;
}
.profile{
	font-size : 12px;
	text-align : right;
	width: 130px;
	height: 60px;
}
.upPw{
	font-size : 12px;
	text-align : right;
	width: 130px;
	height: 60px;
}
.delUser{
	font-size : 12px;
	text-align : right;
	width: 130px;
	height: 60px;
}
.mypagebox3 {
	display: inline-block;
	width: 430px;
	height: 338px;
	font-size: 10px;
	font-weight: bolder;
	margin: 10px 0px 0px 10px;
}

.photo{
	font-size : 12px;
	text-align : left;
	width: 430px;
	height: 20px;/* 220 */
}
.photoMore{
	text-align: right;
	width: 343px;
	font-size: 8px;
}
.img{
	width: 430px;
	height: 200px;/* 220 */
	text-align: center;
	
}
.circle {
	width: 150px;
	height: 150px;
	border-radius: 10em;
	border: 1px solid black;
}
.intro{
	font-size : 12px;
	text-align : left;
	width: 430px;
	height: 20px;/* 120 */
}
.introMore{
	text-align: right;
	width: 359px;
	font-size: 8px;
}
.duce{
	font-size : 12px;
	text-align : left;
	width: 410px;
	height: 80px;
	border: 1px solid black;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 변경</title>
</head>
<body style="overflow-x: hidden">
	    <div class="mypagebox">
		<div class="mypagebox1" align="left">회원정보변경</div>
		<input type="button" value="뒤로" id="main" style="border-radius: 5px; background-color: #3498db; color: white;"/>
		<div class="mypagebox2" align="center" style="margin: 10px 0px 0px 0px;">
		<div class="none"></div>
		<div class="profile">프로필사진 변경</div>
		<div class="upPw">비밀번호 변경</div>
		<div class="delUser">회원 탈퇴</div>
		</div>
		<div class="mypagebox3">
		<div class="photo">프로필 사진
		<div class="photoMore" value="변경" id="photoMore">변경</div>		
	    </div>
		<div class="img">
		<div class="circle">이미지</div>
		</div>
		<div class="intro">자기소개
		<div class="introMore" value="변경" id="introMore">변경</div>
		</div>
		<div class="duce">
		</div>
		</div>
	    </div>
</body>
</html>