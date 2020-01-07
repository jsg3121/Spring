<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css"
	type="text/css">
<style type="text/css">
.content>div {
}
.f_box {
	height: 455px;
	width: 440px;
	background-color: rgb(224, 224, 224);
	border: 1px solid #6c6c6c;
	text-align: center;
	margin-top: calc(300px - 228px) ;
	margin-left: calc(450px - 221px);
}
.header {
	width: 420px;
	height: 50px;
	margin: 10px 10px;
	color: black;
	font-size: 30px;
	font-weight: bolder;
}
input[type='text'] {
	width: 350px;
	height: 28px;
	margin-top: 8px;
}
.f_box>div>input[type='button'] {
	width: 100px;
	height: 30px;
	font-size: 20px;
	border-radius: 10px;
	background-color: rgb(52, 152, 219);
	color: white;
	margin-top: 10px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#pwfind").on("click",function(){
		if($.trim($("#name").val()) == "") {
				
			alert("이름을 입력해 주세요");
			$("#name").focus();
			
		} else if($.trim($("#id").val()) == "") {
			
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			
		} else if($.trim($("#email_1").val()) == "") {
			
			alert("이메일을 입력해 주세요.");
			$("#email_1").focus();

		}else{
			if($("#email_2").val()==10){
				$("#pwemail").val($("#email_1").val());
			}else{
				$("#pwemail").val($("#email_1").val()+"@"+$("#email_2 option:selected").text());
			}
			
			var params=$("#pwfindform").serialize();
			
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"pwfind",
				data:params,
				success:function(result){
					if(result.pw==null){
						alert("입력한 정보의 회원이 없습니다.");
					}else{
						alert("회원님의 비밀번호는 '"+result.pw.substring(0,result.pw.length-4)+"****'입니다.");
					}
				}
			})
		}
	})
	
	$("#idfind").on("click",function(){
		if($.trim($("#iname").val()) == "") {
				
			alert("이름을 입력해 주세요");
			$("#iname").focus();
			
		} else if($.trim($("#iemail_1").val()) == "") {
			
			alert("이메일을 입력해 주세요.");
			$("#iemail_1").focus();

		}else{
			if($("#iemail_2").val()==10){
				$("#iemail").val($("#iemail_1").val());
			}else{
				$("#iemail").val($("#iemail_1").val()+"@"+$("#iemail_2 option:selected").text());
			}
			var params=$("#idfindform").serialize();
			
			$.ajax({
				type:"post",
				dataType:"json",
				url:"idfind",
				data:params,
				success:function(result){
					if(result.id==null){
						alert("입력한 정보의 회원이 없습니다.");
					}else{
						alert("회원님의 아이디는 '"+result.id.substring(0,result.id.length-4)+"****'입니다.");
					}
				}
			})
		}
	})
})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계정찾기</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
		<c:import url="LeftMenu.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top.jsp" />
		<!-- 컨탠츠 -->
		<div class="layout content">
			<div class="f_box">
				<div class="header" align="left">● 비밀번호 찾기</div>
				<div>
					<form action="#" method="post" id="pwfindform">
					<input type="text" name="name" id="name" placeholder="이름"><br> 
					<input type="text" name="id" id="id" placeholder="아이디">
					<input type="hidden" name="pwemail" id="pwemail">
					</form>
					<div>
						<input type="text" placeholder="email" id="email_1" style="width: 175px; height: 28px;"> @ 
						<select id="email_2" style="width: 150px; height: 32px;">
							<option value="1">naver.com</option>
							<option value="2">hanmail.net</option>
							<option value="3" selected="selected">gmail.com</option>
							<option value="4">hotmail.com</option>
							<option value="5">nate.com</option>
							<option value="6">yahoo.co.kr</option>
							<option value="7">empas.com</option>
							<option value="8">korea.com</option> 
							<option value="9">paran.com</option>
							<option value="10">직접입력</option>
						</select>
					</div>
						<input type="button" value="확인" id="pwfind"/>
				</div>
				<div>
					<div class="header" align="left">● 아이디 찾기</div>
					<div>
						<form action="#" method="post" id="idfindform">
						<input type="text" name="iname" id="iname" placeholder="이름">
						<input type="hidden" name="iemail" id="iemail">
						</form>
					</div>
					<div>
						<input type="text" placeholder="email" id="iemail_1" style="width: 175px; height: 28px;"> @
						<select id="iemail_2" style="width: 150px; height: 32px;">
							<option value="1">naver.com</option>
							<option value="2">hanmail.net</option>
							<option value="3" selected="selected">gmail.com</option>
							<option value="4">hotmail.com</option>
							<option value="5">nate.com</option> 
							<option value="6">yahoo.co.kr</option>
							<option value="7">empas.com</option>
							<option value="8">korea.com</option>
							<option value="9">paran.com</option>
							<option value="10">직접입력</option>
						</select>
					</div>
					<input type="button" value="확인" id="idfind"/>
				</div>
			</div>
		</div>
		<!-- 특수구역 -->
		<div class="history">
			<c:import url="History.jsp" />
		</div>
	</div>
	<!-- 하단 정보 -->
	<div class="bottom">
		<c:import url="Bottom.jsp" />
	</div>
</body>
</html>