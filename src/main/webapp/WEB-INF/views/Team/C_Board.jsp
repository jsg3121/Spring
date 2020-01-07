<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<link rel="stylesheet" href="./resources/css/jquery/jquery-ui.css">
<style type="text/css">
.categori {
	width : 100%;
	height : 50px;
	font-size: 20pt;
	text-shadow: 2px 2px 4px grey;
    font-weight: bold;
	padding-top: 10px;
	margin-bottom : 30px; 
	display: inline-block;
}
.search {
	text-align: center;
	width : 900px;
	height : 40px;
}
.date {
	width : 80px;
	height : 27px;
	display: inline-block;
    margin-left: 15px;
    margin-top: 5px;
    margin-right: 15px;
}
.Scate {
	width : 13%;
	height : 30px;
	display: inline-block;
	margin-left: 50px;
    margin-right: 20px;
    border-radius: 10px;
    margin-top: 5px;
}
.Stext {
	width : 25%;
	height : 30px;
	border-radius: 8px;
	box-shadow : none;
	border: 1px solid #AAA;
    outline: none;
}
.SchBtn{
	width : 7%;
	height : 30px;
	margin-top: 5px;
	margin-left:7px;
	margin-right : 7px;
	border-radius: 7px;
	background-color: #fff;
	outline: none;
}
.board {
	width: 900px;
    height: 415px;
    margin: 10px 45px 0px 45px;
}
.posting {
	width : 380px;
	height : 140px;
	border : 1px solid #9e9e9e;
}
.postimg {
	width : 120px;
	height : 140px;
}
.postimg img{
	width: 100px;
	height: 130px;
	margin-left: 5px;
	margin-top: 5px;
}
.postRight {
	width : 240px;
	height : 108px;
	padding-top: 7px;
}
.postTitle {
 	display: block;
	width : 238px;
	height : 30px;
	font-size: 10pt;
	text-overflow:ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.postCon{
	width : 238px;
	height : 80px;
	text-align: justify;
	padding-top: 5px;
	text-overflow:ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.ui-datepicker {
	font-size: 13pt;
}
#pagingArea {
	width : 100%;
	text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src ="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".date").datepicker({
		dateFormat : "yy-mm-dd"
	});
	if($("#new_conbar").val() == 1){
		$("#1").css('background-color','#a0cbff');
		$("#1").css('font-weight','bold');
		$("#1").css('pointer-events','none');
		$("#1").css('cursor','default');
		$("#1").css('color','white');
		
	}
	if($("#new_conbar").val() == 2){
		$("#2").css('background-color','#a0cbff');
		$("#2").css('font-weight','bold');
		$("#2").css('pointer-events','none');
		$("#2").css('cursor','default');
		$("#2").css('color','white');
	}
	if($("#new_conbar").val() == 3){
		$("#3").css('background-color','#a0cbff');
		$("#3").css('font-weight','bold');
		$("#3").css('pointer-events','none');
		$("#3").css('cursor','default');
		$("#3").css('color','white');
	}
	if($("#new_conbar").val() == 4){
		$("#4").css('background-color','#a0cbff');
		$("#4").css('font-weight','bold');
		$("#4").css('pointer-events','none');
		$("#4").css('cursor','default');
		$("#4").css('color','white');
	}
	if($("#new_conbar").val() == 5){
		$("#5").css('background-color','#a0cbff');
		$("#5").css('font-weight','bold');
		$("#5").css('pointer-events','none');
		$("#5").css('cursor','default');
		$("#5").css('color','white');
	}
	if($("#new_conbar").val() == 6){
		$("#6").css('background-color','#a0cbff');
		$("#6").css('font-weight','bold');
		$("#6").css('pointer-events','none');
		$("#6").css('cursor','default');
		$("#6").css('color','white');
	}
	if($("#new_conbar").val() == 7){
		$("#7").css('background-color','#a0cbff');
		$("#7").css('font-weight','bold');
		$("#7").css('pointer-events','none');
		$("#7").css('cursor','default');
		$("#7").css('color','white');
	}
	if($("#new_conbar").val() == 8){
		$("#8").css('background-color','#a0cbff');
		$("#8").css('font-weight','bold');
		$("#8").css('pointer-events','none');
		$("#8").css('cursor','default');
		$("#8").css('color','white');
	}
	if($("#new_conbar").val() == 9){
		$("#9").css('background-color','#a0cbff');
		$("#9").css('font-weight','bold');
		$("#9").css('pointer-events','none');
		$("#9").css('cursor','default');
		$("#9").css('color','white');
	}
	$("#pagingArea").on("click","span", function() {
		$("#page").val($(this).attr("name"));
		
		$("#actionForm").attr("action","C_Board");
		$("#actionForm").submit();
	});

	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#actionForm").attr("action","C_Board");
		$("#actionForm").submit();
	});
	$("#searchText").on("keypress",function(event){
		if(event.keyCode == 13){
			$("#searchBtn").click();
		}
	});
	
	$(".posting").on("click", function() {
		$("#cultcode").val($(this).attr("name"));
		console.log($("#cultcode").val());
		
		$("#actionForm").attr("action","cul_1");
		$("#actionForm").submit();
	});
	$("#sysdates").on("click",function(){
		if($("#sysdates").is(":checked") ){
			todays();
		}else{
			$("#endDate").val("");
			$("#startDate").val("");
		}
	})
});
$(window).load(function(){
	var new_conbar=$("#new_conbar").val();
	if(new_conbar == ""||null){
		new_conbar="play";
	}
	switch (new_conbar) {
	case "play":
		$("#board_topname").html("문화 - 전체")
		break;
	case "1":
		$("#board_topname").html("문화 - 문화교양 / 강좌") 
		break;
	case "2":
		$("#board_topname").html("문화 - 무용")
		break;
	case "3":
		$("#board_topname").html("문화 - 뮤지컬/오페라")
		break;
	case "4":
		$("#board_topname").html("문화 - 영화")
		break;
	case "5":
		$("#board_topname").html("문화 - 전시 / 미술")
		break;
	case "6":
		$("#board_topname").html("문화 - 축제 - 문화·예술")
		break;
	case "7":
		$("#board_topname").html("문화 - 콘서트")
		break;
	case "8":
		$("#board_topname").html("문화 - 클래식")
		break;
	case "9":
		$("#board_topname").html("문화 - 기타")
		break;
	}  
})
function todays(){
	var todate=new Date()
	
	if((todate.getMonth()+5)>12){
		var Mon=(todate.getMonth()+5)-12
		var now_day=(todate.getFullYear()+1)+"-"+Mon+"-"+todate.getDate();
	}else{
		var now_day=todate.getFullYear()+"-"+(todate.getMonth()+5)+"-"+todate.getDate();
	}
	if((todate.getMonth()-3)<1){
		var Mon=(todate.getMonth()-3)+12
		var old_day=(todate.getFullYear()-1)+"-"+Mon+"-"+todate.getDate();
	}else{
		var old_day=todate.getFullYear()+"-"+(todate.getMonth()-3)+"-"+todate.getDate();
	}
	$("#endDate").val(now_day);
	$("#startDate").val(old_day);
}
</script>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
	<c:import url="LeftMenu.jsp"></c:import>
		
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
	<c:import url="Top.jsp"></c:import>
		<!-- 컨탠츠 -->
		<div class="layout content">
		<!-- 현재 카테고리 -->
		<div class = "categori"><span id="board_topname">  </span> </div>
			<!-- 검색 조건  -->
	<form action = "#" method = "post" id = "actionForm">
	<input type="hidden" id="new_conbar" value="${param.codename}">
	<input type = "hidden" name = "page" id = "page" value = "${page}">
	<input type = "hidden" name = "cultcode" id = "cultcode"> 
		<div class = "search">
			<input type="checkbox" id="sysdates"> 최근 날짜
			<input type = "text" class = "date" readonly name = "startDate" id = "startDate" value = "${param.startDate}">~ <!-- 시작날짜 (~부터)  -->
			<input type = "text" class = "date" readonly name = "endDate" id = "endDate" value = "${param.endDate}"><!-- 마감날짜 (~까지) -->
			<select class = "Scate" name = "searchGbn">
				<c:choose>
					<c:when test = "${param.searchGbn eq 0}">
						<option value = "0" selected = "selected">제목</option>
					</c:when>
					<c:otherwise>
						<option value = "0"> 제목 </option>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test = "${param.searchGbn eq 1}">
						<option value = "1" selected = "selected">지역</option>
					</c:when>
					<c:otherwise>
						<option value = "1"> 지역 </option>
					</c:otherwise>
				</c:choose>
			</select> <!-- 검색 옵션바 -->
			<input type = "text" class ="Stext" placeholder="내용을 입력해주세요" name="searchText" id="searchText" value="${param.searchText}"><!-- 검색 텍스트 -->
			<input type = "button" class = "SchBtn" value = "검색" id = "searchBtn">
		</div>
	</form>
			<!-- 게시물 목록 -->
			<div class = "board">
				<c:forEach var = "list" items = "${list}">
					<div class = "posting" name = "${list.CULTCODE}">
						<div class = "postimg"><img src="${list.MAIN_IMG}"> </div>
						<div class = "postRight">
							<div class = "postTitle">${list.TITLE}</div>
							<div class = "postCon">
								장소 : ${list.PLACE}<br>
								시간 : ${list.TIME}<br>
								종료일 : ${list.E_DAY}
							</div>
						</div>
					</div>
            </c:forEach>
			<div id = "pagingArea">
				<c:if test = "${page ne 1}">
					<span name = "1"> <b><<</b> </span> &nbsp;
	              	<span name = "${page - 1}"> <b><</b></span> &nbsp;
	         	</c:if>
				<c:forEach var = "i" begin = "${paging.startPcount}" end = "${paging.endPcount}" step = "1">
					<c:choose>
						<c:when test = "${i eq page}">
							<span name = "${i}"><b>${i}</b></span> &nbsp;
						</c:when>
						<c:otherwise>
							<span name = "${i}">${i}</span> &nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test = "${page ne paging.maxPcount}">
					<span name = "${page + 1 }"><b>></b></span>&nbsp;
					<span name = "${paging.maxPcount}"><b>>></b></span>&nbsp;
				</c:if>
			</div>
            </div>
		</div>
		<!-- 특수구역 -->
		<div class="history">
		<c:import url="History.jsp"></c:import>
		</div>
	</div>
	<!-- 하단 정보 -->
	<div class="bottom">
	<c:import url="Bottom.jsp"></c:import>
	</div>
</body>
</html>