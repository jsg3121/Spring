<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src ="resources/script/jquery/jquery-ui.js"></script>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="resources/css/jquery/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.dates{
	width: 75px;
}
.searcharea{
	text-align: center;
	width: 100%;
	height: 75px;
}
.bigTable>td{
	border: 1px solid; 
}
.smallTable{
	width: 450px;
	height: 170px;
}
.img{
	width: 180px;
	text-align: center;
}
.sTitle{
	height: 30px;
}
img{
	width: 110px;
	height: 160px;
	vertical-align: middle;
}
.ui-datepicker {
	font-size: 13pt;
}
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
	height : 75px;
}
.date {
	width : 80px;
	height : 15px;
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
	height : 86px;
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
<script type="text/javascript">
$(document).ready(function(){
	$(".date").datepicker({
		dateFormat : "yy-mm-dd"
	});	
	$("#pagingArea").on("click","span", function() {
		$("#page").val($(this).attr("name"));
		
		$("#actionForm").attr("action","A_C_List");
		$("#actionForm").submit();
	});
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#actionForm").attr("action","A_C_List");
		$("#actionForm").submit();
	});
	
	$("#searchText").on("keypress",function(event){
		if(event.keyCode == 13){
			$("#searchBtn").click();
		}
	});
	
	$("#sysdates").on("click",function(){
		if($("#sysdates").is(":checked") ){
			todays();
		}else{
			$("#endDate").val("");
			$("#startDate").val("");
		}
	});
	$("#chkCul").on("click",function(){
		$.ajax({
			type  : "post",
			url : "Reload_Cult",
			dataType : "json",
			success: function(result){
				location.href="A_C_List";
			}
	  })
	})
	$(".board").on("click","img",function(){
		$("#cul_no").val($(this).parent().parent().attr("name"));
		$("#CulForm").submit();
	})
	
	 $(".board").on("click","#activebtn",function(){
		if(confirm("해당게시글을 활성화하시겠습니까?")){
			
			
		$("#cultcode").val($(this).attr("name"));
		console.log($("#cultcode").val());
		var params = $("#actionForm").serialize();
		$.ajax({
			type  : "post",
			url : "activebtnajax",
			dataType : "json",
			data : params,			
			success: function(result){
				location.reload();
			}	  
		  });	  
		
		}
	}); 
	
	$(".board").on("click","#unactivebtn",function(){
		if(confirm("해당게시글을 비활성화하시겠습니까?")){
			$("#cultcode").val($(this).attr("name"));
			console.log($("#cultcode").val());
			var params = $("#actionForm").serialize();
			$.ajax({
				type  : "post",
				url : "unactivebtnajax",
				dataType : "json",
				data : params,
				
				success: function(result){
					if(result.res == "SUCCESS"){
						
						location.reload();
					}else{
						
					}
				}	  
			  });	  
		}
		
});
	
});
	
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
<form action="cul_1" method="post" id="CulForm">
	<input type="hidden" name="cultcode" id="cul_no">
</form>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
	<c:import url="AdminLeft.jsp"/>
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top2.jsp"/>
		<!-- 컨탠츠 -->
		<div class="layout content">
			<h1 style="text-shadow: 2px 2px 4px grey;">문화 관리 - 문화 목록</h1><br>
			<div class="searcharea">
				<form action = "#" method = "post" id = "actionForm">
					<input type="hidden" id="new_conbar" value="${param.codename}">
					<input type = "hidden" name = "page" id = "page" value = "${page}">
					<input type = "hidden" name = "cultcode" id = "cultcode"> 
				<div class = "search">
			<input type="checkbox" id="sysdates">
			<input type = "text" class = "date" readonly name = "startDate" id = "startDate" value = "${param.startDate}">~ <!-- 시작날짜 (~부터)  -->
			<input type = "text" class = "date" readonly name = "endDate" id = "endDate" value = "${param.endtDate}"><!-- 마감날짜 (~까지) -->
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
						<option value = "1" selected = "selected">제목</option>
					</c:when>
					<c:otherwise>
						<option value = "1"> 지역 </option>
					</c:otherwise>
				</c:choose>
			</select> <!-- 검색 옵션바 -->
			<input type = "text" class ="Stext" placeholder="내용을 입력해주세요" name="searchText" id="searchText" value="${param.searchText}"><!-- 검색 텍스트 -->
			<input type = "button" class = "SchBtn" value = "검색" id = "searchBtn"><br/>
			
			<input type="button" value="만기 비활성화" id="chkCul">
			<input type="radio"	id="chk_info1"	 name="chk_info" value="0" <c:if test="${param.chk_info eq 0}">checked="checked"</c:if>>모두보기
			<input type="radio" id="chk_info2"	name="chk_info" value="1" <c:if test="${param.chk_info eq 1}">checked="checked"</c:if>>활성			
			<input type="radio" id="chk_info3" name="chk_info"  value="2" <c:if test="${param.chk_info eq 2}">checked="checked"</c:if>>비활성
			
		</div>
	</form>
			</div>
			<div class = "board">
				<c:forEach var = "list" items = "${list}">
					<c:choose>
						<c:when test = "${list.DEL_YN eq 0}">
							<div class = "posting" name = "${list.CULTCODE}" id="${list.DEL_YN}">
						<div class = "postimg"><img src="${list.MAIN_IMG}"> </div>
						<div class = "postRight">
							<div class = "postTitle">${list.TITLE}</div>
							<div class = "postCon">
								장소 : ${list.PLACE}<br>
								시간 : ${list.TIME}<br>
								종료일 : ${list.E_DAY}<br/>								
								<input type="button" name="${list.CULTCODE}"value="비활성" id=unactivebtn />
								</div>
						</div>
					</div>
						</c:when>
						<c:otherwise>
							<div class = "posting" name = "${list.CULTCODE}" id="${list.DEL_YN}" style="opacity: 0.4;">
						<div class = "postimg"><img src="${list.MAIN_IMG}"> </div>
						<div class = "postRight">
							<div class = "postTitle">${list.TITLE}</div>
							<div class = "postCon">
								장소 : ${list.PLACE}<br>
								시간 : ${list.TIME}<br>
								종료일 : ${list.E_DAY}<br/>	
								<input type="button" name="${list.CULTCODE}"value="활성" id=activebtn />
								</div>
						</div>
					</div>						
						</c:otherwise>
					</c:choose>
									
							
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
	</div>
</body>
</html>