<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; //휴대폰 번호 정규식
				$("#idcheck").on("click", function() {

					var params = $("#inForm").serialize();

					$.ajax({
						type : "post",
						url : "idcheck",
						dataType : "json",
						data : params,

						success : function(result) {

							if (result.res == "SUCCESS") {
								alert("사용가능한 아이디입니다");
								$("#chval").val(1);//체크가 완료 되면 1
							} else {
								alert("존재 하는 아이디 입니다.");
								$("#chval").val(0);//존재하는 아이디면 다시 확인해야 한다.
							}
						}
					});
				});
				$("#memberup").on("click",function() {
							if ($.trim($("#name").val()) == "") {
								alert("이름를 입력해주세요");
								$("#name").focus();
							}else if ($.trim($("#nick").val()) == "") {
								alert("닉네임을 입력해주세요");
								$("#nick").focus();
							}else if ($.trim($("#id").val()) == "") {
								alert("아이디를 입력해주세요");
								$("#id").focus();
							}else if($.trim($("#id").val()).length<7){
								alert("아이디를 7자 이상으로 지정해 주세요.");
								console.log($("#id").val())
								console.log($.trim($("#id").val()).length);
								$("#id").focus();
							}else if ($.trim($("#pw").val()) == "") {
								alert("비밀번호를 넣어주세요");
								$("#pw").focus();
							}else if($.trim($("#pw").val()).length<6){
								alert("비밀번호를 6자 이상으로 지정해 주세요.");
								$("#pw").focus();
							}else if($.trim($("#pwc").val()) == "") {
								alert("비밀번호 확인을 입력해주세요.");
								$("#pwc").focus();
							}else if($.trim($("#pwc").val()) != $.trim($("#pw").val())){
								alert("비밀번호가 일치하지 않습니다.");
								$("#pwc").focus();
							}else if ($.trim($("#email_1").val()) == "") {
								alert("이메일을 넣어주세요");
								$("#email_1").focus();
							}  else if ($.trim($("#chval").val()) == 0) {
								alert("중복확인을 해주세요");
								$("#id").focus();
							} else {
								var a = '.'
								var date = $("#birth1").val().substring(2, 4)
										+ a + $("#birth2").val() + a
										+ $("#birth3").val()
								$("#borndate").val(date)
								$("#loc").val($("#locs option:selected").text());
								$("#inemail").val($("#email_1").val()+"@"+$("#email_2 option:selected").text());
								
								var params = $("#inForm").serialize();

								$.ajax({
									type : "post",
									url : "insertup",
									dataType : "json",
									data : params,

									success : function(result) {
										console.log(result);
										if (result.res == "SUCCESS") {
											location.href = "Login"
										} else {
											alert("회원가입에 실패했습니다");
										}
									}
								});

							}
						});
			});
</script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css"
	type="text/css">
<style type="text/css">
.main_C {
	width: 440px;
	margin-left: 5px;
	margin-top: 10px;
}
.member {
	width: 450px;
	height: 523px;
	border: 1px solid #9e9e9e;
	background-color: lightgray;
}
.member>input {
	vertical-align: top;
	border: 1px;
	height: 30px;
	width: 360px;
}
.member td{
	text-align: left;
}
select {
	height: 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
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
		<div class="layout content" style="text-align: center;">
			<form action="actionForm" method="post" id="inForm">
				<input type="hidden" name="loc" id="loc">
				<input type="hidden" name="inemail" id="inemail">
				<div class="member">
					<h4>회원가입( * 필수 )</h4>
					<input type="hidden" id="chval" />
					<!--체크여부 -->
					<input type="hidden" name="borndate" id="borndate" />
					<!-- 생일 입력 -->
					*<input type="text" placeholder="이름" name="name" id="name" style="width: 172px;" /> 
					*<input type="text" placeholder="닉네임" name="nick" id="nick" style="width: 178px; margin-bottom: 20px;" /><br>
					*<input type="text" placeholder="아이디" name="id" id="id" style="width: 286px; margin-bottom: 20px;" /> 
					<input type="button" value="중복확인" id="idcheck" style="width: 70px;" /><br />
					*<input type="password" placeholder="패스워드" name="pw" id="pw" style=" margin-bottom: 20px;" /><br />
					*<input type="password" placeholder="패스워드재입력" name="pwc" id="pwc"/><br />

					<table style="width: 420px;margin-left: 40px;">
						<tr>
							<td>* 생년월일</td>
							<td style="width: 170px">* 지역</td>
						</tr>
					</table>

					<select name="birth1" id="birth1" style="width: 60px;">
						<c:forEach var="i" begin="0" end="${2018-1900}">
							<c:set var="yearOption" value="${2018-i}" />
							<option value="${yearOption}">${yearOption}</option>
						</c:forEach>
					</select> 년 <select name="birth2" id="birth2" style="width: 60px;">
						<c:forEach var="i" begin="1" end="12" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select> 월 
					<select name="birth3" id="birth3" style="width: 60px;">
						<c:forEach var="i" begin="1" end="31" step="1">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select> 일 
					<select name="loc" id="locs" style="width: 105px;">
						<option value="0">강남구</option>
						<option value="1">강동구</option>
						<option value="2">강북구</option>
						<option value="3">강서구</option>
						<option value="4">관악구</option>
						<option value="5">광진구</option>
						<option value="6">구로구</option>
						<option value="7">금천구</option>
						<option value="8">노원구</option>
						<option value="9">도봉구</option>
						<option value="10">동대문구</option>
						<option value="11">동작구</option>
						<option value="12">마포구</option>
						<option value="13">서대문구</option>
						<option value="14">서초구</option>
						<option value="15">성동구</option>
						<option value="16">성북구</option>
						<option value="17">송파구</option>
						<option value="18">양천구</option>
						<option value="19">영등포구</option>
						<option value="20">용산구</option>
						<option value="21">은평구</option>
						<option value="22">종로구</option>
						<option value="23">중구</option>
						<option value="24">중량구</option>
					</select><br />
					
					<br />*<input type="text" id="email_1" placeholder="이메일" style="width: 230px;" /> @ 
					<select name="searchEmail" id="email_2" style="width: 105px;">
						<option value="0">naver.com</option>
						<option value="1">blog.com</option>
						<option value="2">cacao.com</option>
					</select><br />
					<br /> <input type="text" placeholder="휴대전화" name="phone" id="phone"/><br />
					<br /> <input type="text" name="addr" id="addr" placeholder="주소"><br />
					<br /> <input type="button" value="회원가입" id="memberup" style="width: 260px;">
				</div>

			</form>
		</div>

		<!-- 특수구역 -->
	</div>
	<!-- 하단 정보 -->
	<div class="bottom">
		<c:import url="Bottom.jsp" />
	</div>
</body>
</html>