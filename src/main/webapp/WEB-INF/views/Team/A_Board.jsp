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
<link rel="stylesheet" href="./resources/css/CommuBoard.css"
	type="text/css">
<style type="text/css">
.title {
	width: 100%;
	height: 50px;
	font-size: 20pt !important;
	text-shadow: 2px 2px 4px grey;
	font-weight: bold;
	display: inline-block;
	padding-top: 20px;
	margin-bottom: 20px;
}

.Group {
	text-align: center;
}

th {
	height: 40px;
	font-weight: bold;
}

.Group td {
	border-top: 1px solid #b8b8b845;
	height: 40px;
}

.page {
	text-align: center;
	font-size: 13pt;
	margin-top: 7px;
}

#searcharea {
	width: 100%;
	text-align: right;
	vertical-align: top;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#searchBtn").on("click",function(){
		$("#page").val("1");
		
		reloadPage();
	});
	$("[name ='searchText']").on("keypress",function(event){
		if(event.keyCode ==13){
			
			$("#searchBtn").click();
			
			return false;
		}
	});
		reloadPage();
		$("#paging_area").on("click", "button", function() {
			if ($(this).attr("name") != $("#page").val()) {
				$("#page").val($(this).attr("name"));
				reloadPage();
			}
		})
		$(".list tbody").on("click", "tr", function() {
			$("#b_listNo").val($(this).attr("name"));
			$("#c_listNo").val($(this).attr("name"));
			drawBoardlist();
		})
		$("#alldelbtn").on("click",function(){
			 checkalldel();
		});
		$("#unalldelbtn").on("click",function(){
			 uncheckalldel();
		});
		$("#Boardlist").on("click", "#B_del_Btn", function() {
			B_delete();
		})
		$("#Boardlist").on("click", "#B_undel_Btn", function() {
			B_undelete();
		})
		$("#Boardlist").on("click", "#C_del_Btn", function() {
			$("#b_listNo").val($(this).parent().parent().attr("name"));
			C_delete();
		})
		$("#Boardlist").on("click", "#C_undel_Btn", function() {
			$("#b_listNo").val($(this).parent().parent().attr("name"));
			C_undelete();
		})
	});
	function B_delete() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			url : "deleteAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if (result.res == "SUCCESS") {
					reloadPage(result);
					drawBoardlist(result);
				}
			}
		});
	}
	function B_undelete() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			url : "un_deleteAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if (result.res == "SUCCESS") {
					reloadPage(result);
					drawBoardlist(result);
				}
			}
		});
	}
	function C_delete() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			url : "C_delete",
			dataType : "json",
			data : params,
			success : function(result) {
				if (result.res == "SUCCESS") {
					drawBoardlist(result);
				}
			}
		});
	}
	function C_undelete() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			url : "C_undelete",
			dataType : "json",
			data : params,
			success : function(result) {
				if (result.res == "SUCCESS") {
					drawBoardlist(result);
				}
			}
		});
	}
	function reloadPage() {
		var params = $("#SearchForm").serialize();

		$.ajax({
			type : "post",
			dataType : "json",
			url : "A_Board_search",
			data : params,
			success : function(result) {
				drawList(result.list);
				drawPaging(result.pb);
			}
		})
	}
	function drawBoardlist() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			dataType : "json",
			url : "A_Board_list",
			data : params,
			success : function(result) {
				drawBoard(result.detail);
				drawComent(result.retext);
			}
		})
	}
	function drawList(list) {
		var html = "";

		for (i = 0; i < list.length; i++) {
			html += "<tr name=\""+list[i].NO+"\">";
			html += "<td>" + list[i].NO + "</td>";
			html += "<td>" + list[i].TITLE + "</td>";
			html += "<td>" + list[i].NICK + "</td>";
			html += "<td>" + list[i].WRITE_DT + "</td>";
			html += "<td>" + list[i].HIT + "</td>";
			html += "<td>" + list[i].MEM_NO + "</td>";
			
			if (list[i].DEL_YN == 1) {
				html += "<td><b>삭제</b></td>";
			} else {
				html += "<td>-</td>";
			}
			html += "<td>" + list[i].REPORT + "</td>";
			if (list[i].CLASS == 2) {
				html += "<td><b>관리자</b></td>";
			} else {
				html += "<td>회원</td>";
			}
			html += "<td>" + list[i].CUL_NO + "</td>";
			html+="<td><input type=\"checkbox\" name=\"alldela\"  value=\""+list[i].NO+"\"/></td>";
			html += "</tr>";
		}
		$(".list tbody").html(html);
	}
	function drawPaging(pb) {
		var html = "";

		html += "<button id=\"firstPage\" name=\"1\"> << </btutton>";
		if ($("#page").val() == "1") {
			html += "<button id=\"beforePage\" name=\"1\"> < </btutton>";
		} else {
		html+="<button id=\"beforePage\" name=\""+($("#page").val()*1-1)+"\"> < </btutton>";
		}

		for (var i = pb.startPcount; i <= pb.endPcount; i++) {
			if (i == $("#page").val()) {
			html+="<button name=\""+i+"\"disabled=\"disabled\">"+i+"</button>";
			} else {
				html += "<button name=\""+i+"\">" + i + "</button>";
			}
		}

		if ($("#page").val() == pb.maxPcount) {
			html += "<button id=\"nexePage\" name=\""+pb.maxPcount+"\"> > </button>";
		} else {
		html+="<button id=\"nexePage\" name=\""+($("#page").val()*1+1)+"\"> > </button>";
		}

		html += "<button id=\"endPage\" name=\""+pb.maxPcount+"\"> >> </button>";

		$("#paging_area").html(html);
	}
	function drawBoard(detail) {
		var html = "";

		html += "<div>";
		html += "<input type=\"button\" id=\"B_del_Btn\" value=\"삭제\">";
		html += "<input type=\"button\" id=\"B_undel_Btn\" value=\"복구\">";
		html += "</div>";
		html += "<div class = \"info\">";
		html += "<div class = \"titleInfo\">제목 :" + detail.TITLE + "</div>";
		html += "<div class = \"dateInfo\">작성일 :" + detail.WRITE_DT + "</div>";
		html += "<div class = \"hitInfo\">조회수 :" + detail.HIT + "</div>";
		html += "<div class = \"writerInfo\">작성자 :" + detail.NICK + "</div>";
		html += "</div>";
		html += "<div class = \"con\">" + detail.CON + "</div>";
		html += "<div class = \"replearea\">";
		html += "</div>";

		$("#Boardlist").html(html);
	}
	function drawComent(retext) {
		var html = "";
		for (var i = 0; i < retext.length; i++) {
			html += "<div class=\"reples\" name=\""+retext[i].NO+"\">"
		html+=""+retext[i].
		NICKNAME+"("+retext[i].WRITE_DT+")<div class = \"commenter\">";
			if (retext[i].DEL_YN == 0) {
				html += "<input type = \"button\" value = \"삭제\" class = \"commentBtn\" id=\"C_del_Btn\" />";
			} else {
				html += "[삭제된 댓글] <input type = \"button\" value = \"복구\" class = \"commentBtn\" id=\"C_undel_Btn\" />";
			}
			html += "</div><br>";
			html += "<div class = \"commentCon\">";
			html += "" + retext[i].CON + "";
			html += "</div>";
			html += "</div>";
		}
		$(".replearea").html(html);
	}
	function checkalldel(){
		var params = $("#alldelForm").serialize();
		
		$.ajax({
			type : "post",
			url : "alldeleteAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS") {
					alert("다중삭제 완료");
					location.href="A_Board"
	    		}else{
	    			alert("실패")
	    		}
			}
		});		
	}
	function uncheckalldel(){
		var params = $("#alldelForm").serialize();
		
		$.ajax({
			type : "post",
			url : "unalldeleteAjax",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS") {
					alert("다중복구 완료");
					location.href="A_Board"
	    		}else{
	    			alert("실패")
	    		}
			}
		});		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
		<c:import url="AdminLeft.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top2.jsp" />
		<!-- 모임게시판-->
		<div class="layout content">
			<div class="title">게시글 목록</div>
			<div class="Group">
				<div id="searcharea">
					<form action="#" method="post" id="SearchForm">
						<input type="hidden" name="no" id="b_listNo">
						<input type="hidden" name="bno" id="c_listNo">
						<input type="hidden" name="page" id="page" value="1">
						<select class="Scate" name="searchGbn" style="padding-top: 1px; padding-bottom: 3px">
							<option value="0" selected="selected">제목</option>
							<option value="1">글번호</option>
							<option value="2">닉네임</option>
							<option value="3">내용</option>
							<option value="4">회원번호</option>
							<option value="5">문화번호</option>
					</select>
						<input type="text" class ="Stext" name="searchText" id="searchText"
								style="padding-top: 4px;padding-bottom: 0px;" value="${param.searchText}">
						<input type="button" id="searchBtn" value="검색">
					</form>
				</div>
				<form action="#" method="post" id="alldelForm">
					<table class="list">
						<colgroup>
							<col width="70">
							<col width="270">
							<col width="80">
							<col width="120">
							<col width="50">
							<col width="75">
							<col width="70">
							<col width="55">
							<col width="70">
							<col width="70">
							<col width="70">

						</colgroup>
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>닉네임</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>회원번호</th>
								<th>삭제여부</th>
								<th>신고수</th>
								<th>회원등급</th>
								<th>문화 번호</th>
								<th>체크</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</form>
				<!--게시판 페이징 -->
				<div class="page" id="paging_area"></div>
				<input type="button" id="alldelbtn" value="선택삭제" />
				<input type="button" id="unalldelbtn" value="선택복구" />
			</div>
			<!-- 게시글 정보 -->
			<div id="Boardlist"></div>
		</div>
	</div>
</body>
</html>