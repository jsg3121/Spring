<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="./script/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#updateBtn").on("click",function(){
		/* location.href="MyPageUpdate.jsp"; */
		window.close();
	});
	
	$("#backBtn").on("click",function(){
		window.close();
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
.pwbox {
   display: inline-block;
   height: 400px;
   width: 440px;
   margin: 10px;
   background-color: rgb(224, 224, 224);
   border: 1px solid #6c6c6c;
   top: calc(50% -  350px);
   left: calc(50% - 220px);
}
.pwbox1 {
   display: inline-block;
   width: 420px;
   height: 50px;
   margin: 10px 10px;
   color: black;
   font-size: 26px;
   font-weight: bolder;
}
.pwbox2 {
   width: 420px;
   height: 200px;
   margin: 10px 10px;
   text-align: center;
}
.pwbox3 {
   width: 420px;
   height: 80px;
   margin: 10px 10px;
   text-align: center;
}
</style>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
</head>
<body style="overflow-x: hidden">
	<div class="pwbox">
		<div class="pwbox1" align="center">비밀번호 변경</div>
			<div class="pwbox2">
			<input type="password" id="oldMemPw" placeholder="현재 비밀번호" style="width: 330px; height: 40px; margin-bottom: 15px;">
			<input type="password" id="newMemPw" placeholder="새 비밀번호" style="width: 330px; height: 40px; margin-bottom: 15px;">
			<input type="password" id="reMemPw" placeholder="비밀번호 확인" style="width: 330px; height: 40px; margin-bottom: 15px;">
			</div>
		<div class="pwbox3">
			<input type = "button" value = "변경" id = "updateBtn" style="width: 100px; height: 40px; border-radius: 5px; background-color: #3498db; color: white; font-size: 24px;"/>
			<input type = "button" value = "취소" id = "backBtn" style="width: 100px; height: 40px; border-radius: 5px; background-color: #5e5e5e; color: white; font-size: 24px;"/>
		</div>
	</div>
</body>
</html>