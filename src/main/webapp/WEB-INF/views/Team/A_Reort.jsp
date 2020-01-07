<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src ="resources/script/jquery/jquery-ui.js"></script>
<link rel="stylesheet" href="resources/css/jquery/jquery-ui.css">
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">

.content {
	width: 1100px;
	min-height: 700px;
}
.content>div {
	width: 447px;
	min-height: 620px;
}
.content>div>div {
	width: 217px;
	height: 95px;
}
table{
	margin: 0px auto;
}
thead { 
	background-color: lightgray;
}
.box td {
	border-bottom: 1px solid #9e9e9e;
	text-align: center;
	cursor: pointer;
}

.box{
	border: 1px solid #9e9e9e;
	width: 400px;
	height: 620px;
	margin-left: 30px;
}

.page {
	text-align: center;
	font-size: 13pt;
	margin-top: 7px;
	margin-left: 60px;
}
.box>table>tbody>tr{
	height: 78px;
}
.re_list{
	width: 100%;
	height: 580px;
}
.re_list>tbody>tr>td{
	border: 1px solid;
	height : 118px;
}
.re_one{
	width: 100px;
}
.re_top{
	height: 30px;
	width: 100%;
}
.re_top>table {
	width: 100%;
}
#pagingArea{
	text-align: center;
	width: 100%
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	$("#pagingArea").on("click","span", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
		/* $("#actionForm").attr("action","A_Reort"); */ 
		/* $("#actionForm").submit(); */
	});
	$("#repotysearchbtn").on("click",function(){
		$("#page").val("1");
		
		reloadList();
	});
	 
	$("tbody").on("click", "tr", function() {
		$("#ReportNo").val($(this).attr("name"));
		
		var params = $("#actionForm").serialize();
		
		$.ajax({
			type : "post",
			url : "ReportUserInfo",
			dataType : "json",
			data : params,
			success : function(result) {
				ReportInfo(result.ReportInfo);
			}
		});
	});
	
	$("#BanBtn").on("click", function () {
		if($.trim($("#ReportNo").val()) == "" || $.trim($("#ReportNo").val()) == null ) {
			alert("탈퇴시킬 회원이 없습니다");
		} else {
			var params = $("#actionForm").serialize();
			
			$.ajax({
				type : "post",
				url : "BanUser",
				dataType : "json",
				data : params,
				success : function(result) {
					ReportInfo(result.ReportInfo);
				}
			});
		}
	});
});

function ReportInfo(ReportInfo) {
	
	var html = "";
	
		html+= "<tr>";
		html+= "<td class=\"re_one\">내용</td>";
		html+= "<td>" + ReportInfo.RE_CON + "</td>";
		html+= "</tr>";
		html+= "<tr>";
		html+= "<td class=\"re_one\">사유</td>";
		html+= "<td>" + ReportInfo.DETAIL_CON + "</td>";
		html+= "</tr>";
		html+= "<tr>";
		html+= "<td class=\"re_one\">작성자</td>";
		html+= "<td>" + ReportInfo.WT_MEM + "</td>";
		html+= "</tr>";
		html+= "<tr>";
		html+= "<td class=\"re_one\">신고일</td>";
		html+= "<td>" + ReportInfo.RE_DATE + "</td>";
		html+= "</tr>";		
		html+= "<tr>";
		html+= "<td class=\"re_one\">신고된 글 유형</td>";
		if(ReportInfo.WT_MODE == 1){
			html+="<td>게시판</td>";
		} else if (ReportInfo.WT_MODE == 2){
			html+="<td>댓글</td>";
		}
		html+="</tr>";
		
		$(".re_list").html(html);
}
function reloadList() {

	var params = $("#actionForm").serialize();

	$.ajax({
		type : "post",
		url : "ReportUserList",
		dataType : "json",
		data : params,
		success : function(result) {
			drawList(result.ReportList);
			drawPaging(result.paging);
		}
	});
}

function drawList(ReportList) {
	var html = "";
		
	for (var i = 0; i < ReportList.length; i++) {
		html += "<tr name = " + ReportList[i].NO + ">";
		html += "<td>"+ ReportList[i].DETAIL_CON + "</td>";
		html += "<td>" + ReportList[i].RE_DATE + "</td>";
		html += "<td>" + ReportList[i].WT_MEM + "</td>";
		html += "</tr>";
	}
	$("#UserList tbody").html(html);
}

function drawPaging(pb) {

	var html = "";

	if ($("#page").val() != "1") {
		html += "<span name = \"1\"> <b><<</b> </span> &nbsp;";
		html += "<span name = " + ($("#page").val() - 1) + "> <b><</b></span> &nbsp;";
	}
	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<span name = " + i + "><b>" + i + "</b></span> &nbsp;";
		} else {
			html += "<span name = " + i + ">" + i + "</span> &nbsp;";
		}
	}
	if ($("#page").val() != pb.maxPcount) {
		html += "<span name = " + ${page + 1 } + "><b>></b></span>&nbsp;";
		html += "<span name = " + pb.maxPcount + "><b>>></b></span>&nbsp;";
	}
	$("#pagingArea").html(html);
}
</script>
<head>
<!-- 기본 css 설정파일 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="left">
		<c:import url="AdminLeft.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top2.jsp" />
		<!-- 컨탠츠 -->  
		<div class="content">
		<form action="#" method = "post" id = "actionForm">
			<input type="hidden" name="page" id="page" value="1" />
			<input type="hidden" name="ReportNo" id="ReportNo"/>
		
			<h2 style="text-shadow: 2px 2px 4px grey;">회원게시글/신고목록</h2>
			<div class="box">
				<div style=" width: 100%; height:28px;padding-top:3px ">
					<select name="reportsearc"style="width: 109px; height: 25px;margin-left: 15px;" >
						<option value="0">전체보기</option>
						<option value="1">영리목적/홍보성</option>
						<option value="2">불법정보</option>
						<option value="3">음란/선정성</option>
						<option value="4">욕설/인신공격</option>
						<option value="5">개인정보노출</option>
						<option value="6">같은 내용의 반복 게시(도배)</option>
						<option value="7">기타</option>
					</select>
					<input type="button" value="보기" id="repotysearchbtn"/>
				</div>
				
				
				<br>
				<table id = "UserList">
					<colgroup>
						<col width="140">
						<col width="140;">
						<col width="150;">
					</colgroup>
					<thead>
						<tr height="74">
							<th>신고사유</th>
							<th>신고일</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div id = "pagingArea"></div>
			</div>
			
			<div class="box" style="margin-left: 50px;">
				<table class="re_list">
					<tr>
						<td class="re_one">내용</td>
						<td>-</td>
					</tr>
					<tr>
						<td class="re_one">사유</td>
						<td>-</td>
					</tr>
					<tr>
						<td class="re_one">작성자</td>
						<td>-</td>
					</tr>
					<tr>
						<td class="re_one">신고일</td>
						<td>-</td>
					</tr>					
					<tr>
						<td class="re_one">신고된 글 유형</td>
						<td>-</td>
					</tr>
				</table>
			</div>
			</form>
		</div>
	</div>
</body>
</html>