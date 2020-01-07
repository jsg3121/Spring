<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#insert").on("click",function(){
		location.href="insert";
	}) 
	$("#find").on("click",function(){
		location.href="findID";
	}) 
	
	$("#loginBtn").on("click", function() {
		if($.trim($("#memId").val()) == "") {
			
			alert("아이디를 입력해 주세요.")
			
			$("#memId").focus();
		} else if($.trim($("#memPw").val()) == "") {
			alert("비밀번호를 입력해 주세요.");
			
					$("#memPw").focus();
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "loginAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res) {
						location.href = "main";
					} else {
						alert("아이디나 비밀번호가 틀립니다.");
					}
				}
			});
		}
	});
	
	$("#actionForm").on("keypress", "input", function(event) {
		if(event.keyCode == 13) {
			$("#loginBtn").click();
		}
	});
});
</script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css"
	type="text/css">
<style type="text/css">
.lines:hover{
	cursor: pointer;
}
.main_C {
	width: 440px;
	margin-left: 5px;
	margin-top: 10px;
}
.Login_box {
	height: 346px;
    width: 365px;
    margin: calc(300px - 175px) 0px;
}
td,.bottom>div{
	font-size: 11pt;
}
.Login_box1 {
	margin-top: 20px;
	font-size: 42px;
	font-weight: bolder;
} 
.Login_box>div {
	display: inline-block;
	width: 370px;
	height: 100px;
}

.lines {
	margin-top: 15px;
}
.lines:hover {
	margin-top: 15px;
	font-weight: bold;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
		<!-- 좌측 메뉴 -->
		<div class="left">
			<c:import url="LeftMenu.jsp" />
		</div>
		<!-- 우측 컨탠츠 -->
		<div class="right">
			<c:import url="Top.jsp" />
			<!-- 컨탠츠 -->
			<div class="content" style="text-align: center;">
				<div class="Login_box">
					<div class="Login_box1" style="height: 80px">로그인</div>
					<div>
						<form action="#" id="actionForm" method="post" style="display: inline-block;">
							<input type="text" autocomplete="off" name="memId" id="memId" placeholder="아이디"
							style="width: 300px; height: 30px; outline: none; border: 2px solid #03a6ff;"><br> <br>
							<input type="password" name="memPw" id="memPw" placeholder="비밀번호"
							style="width: 300px; height: 30px; outline:none; border: 2px solid #03a6ff;">
						</form>
					</div>
					<div style="height: 60px;">
						<br> <span class="lines" id="find">아이디/비밀번호 찾기</span>&nbsp <span
							class="lines" id="insert">회원가입</span>
					</div>
					<div>
						<input type="button" value="로그인" id="loginBtn"
							style="width: 200px; font-size: 15pt !important; background-color: #03a6ff !important; color: white !important; border: 0px !important; " />
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 정보 -->
		<div class="bottom">
			<c:import url="Bottom.jsp" />
		</div>
</body>
</html>