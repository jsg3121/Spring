<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function popupOpen(){
	var popUrl = "deluser";	//팝업창에 출력될 페이지 URL
	var popOption = "width=638px, height=500px, resizable=no, scrollbars=no, status=no;,top=230,left=400";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
<head> 
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<!-- <link rel="stylesheet" href="baseCss.css" type="text/css"> -->
<style type="text/css">
.content>div {
	min-height: 0px;
}

.delbox {
	display: inline-block;
	height: 420px;
	width: 580px;
	background-color: rgb(224, 224, 224);
	border: 1px solid #6c6c6c;
	z-index: 200;
	
}

.delbox1 {
	display: inline-block;
	width: 512px;
	height: 50px;
	margin: 10px 10px;
	color: black;
	font-size: 42px;
	font-weight: bolder;
}
.delbox2{
margin-top:40px;
	margin-left: 150px;
	
}
.delbtbox{
	margin-top: 40px;
	text-align: center;
	margin-left: 20px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body style="overflow-x: hidden">
	<div class="delbox">
		<div class="delbox1" align="center">회원탈퇴</div>
		
		<div class="delbox2">
		
		<input type="text"  id="pw" placeholder="비밀번호 입력" style="width: 239px; height: 33px;"/>
		<br/><br/>
		<input type="text" name="email" id="email" placeholder="이메일" style="width: 239px; height: 33px;"/><select name="searchEmail" style="width: 120px; height: 38px;">
					<option value="0">@gmail.com</option>
					<option value="1">@naver.com</option>
					<option value="2">@cacao.com</option>
					</select>
					<br/><br/>
					<div class="delbtbox">
					<input type="button" id="delbtn"value="탈퇴" style="width: 100px; height: 33px;"/>  <input type="button" id="cancelbtn"value="취소" style="width: 100px; height: 33px;"/>
					</div>
					</div>
	</div>
</body>
</html>