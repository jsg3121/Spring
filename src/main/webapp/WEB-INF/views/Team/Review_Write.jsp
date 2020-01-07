<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<head>
<script type="text/javascript">
$(document).ready(function() {
	
	CKEDITOR.replace("areaCon", {
		resize_enable : false,
		language : "ko",
		enterMode : "2",
		width : "700"
	});
	
	$("#writeBtn").on("click", function() {
		$("#areaCon").val(CKEDITOR.instances['areaCon'].getData());
		
		if($.trim($("#title").val()) == "") {
			alert("제목을 입력하세요.");
			
			$("#title").focus();
		} else if($.trim($("#areaCon").val()) == "") {
			alert("내용을 입력하세요.");
			
			$("#areaCon").focus();
		} else {
			var params = $("#writeForm").serialize();
			
			$.ajax({
            	type : "post",
            	url : "WriteReview",
            	dataType : "json",
            	data : params,
            	success : function(result) {
            		if(result.res == "SUCCESS") {
            			alert("작성이 완료되었습니다");
            			location.href = "community";
            		} else {
            			alert("작성실패");
            		}
            	}
			});
		}
	});
	
	$("#cancleBtn").on("click", function() {
		history.back();
	});
});
</script>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.con{
 text-align: left;
}     
#Btnarea{
	text-align: right; 
	width: calc(43%);     
}
.content{
	text-align: center;
}
.content>table {
	width: 720px;
	margin: 0px auto;
}
.ConT input,.ConT textarea{
	width: calc(100% - 40px);
	min-height:15px;
	height: calc(100% - 10px); 
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
	<c:import url="LeftMenu.jsp"/>
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="layout right">
		<c:import url="Top.jsp"/>
		<!-- 컨탠츠 -->
		<div class="layout content">
		<h1>후기 게시판</h1><br>
		
			<form action="#" method="post" id="writeForm">
				<input type="hidden" name="nick" id="nick" value="${sNick}" />
				<input type="hidden" name="no" id="no" value="${sMemNo}" />
				<input type = "hidden" name = "cultcode" value = "${sCULTCODE}">
				<table class="ConT">
					<tr>
						<td width="68px">제목</td>
						<td style="text-align: center;"><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<td style="text-align: center;" class="con">내용</td>
					</tr>
					<tr>
						<td colspan="2" style="height: 280px;">
							<textarea name="areaCon" id="areaCon" rows="10" cols="10"></textarea>
						</td>
					</tr>
				</table>
			</form>
			<div id="Btnarea">
				<input type="button" value="작성" id="writeBtn">
				<input type="button" value="취소" id="cancleBtn">
			</div>
		</div>
		<!-- 특수구역 -->
		<div class="history">
			<c:import url="History.jsp"/>
		</div> 
	</div>
	<!-- 하단 정보 -->
	<div class="bottom">
		<c:import url="Bottom.jsp"/>
	</div>
</body>
</html>