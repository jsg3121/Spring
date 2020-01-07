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
.title {
	width: 100%;
	height: 50px;
	font-size: 20pt !important;
	text-shadow: 2px 2px 4px grey;
	font-weight: bold;
	display: inline-block;
	padding-top: 40px;
	margin-bottom: 30px;
}

.list {
	width: 800px;
	height: 231px;
	padding-bottom: 10px;
	margin-left: 25px;
	border-bottom: 3px solid #00000030;
	border-top: 3px solid #00000030;
	text-align: center;
}

.list th {
	height: 35px;
}

.list td {
	height: 35px;
	border-top: 1px solid #00000030;
}

.search {
	text-align: right;
	width: 400px;
	float: right;
	margin-right: 130px;
	margin-bottom: 10px;
}

.Scate {
	width: 80px;
	height: 30px;
	border-radius: 7px;
}

.text {
	width: 200px;
	height: 25px;
	border-radius: 7px;
	box-shadow: none;
	border: 1px solid #AAA;
	outline: none;
	margin-left: 10px;
	margin-right: 10px;
}

.SBtn {
	width: 60px;
	height: 27;
}

.page {
	text-align: center;
	font-size: 13pt;
	margin-top: 10px;
}

.profile {
	width: 801px;
	height: 530px;
	border-top: 3px solid #0000003b;
	border-bottom: 3px solid #0000003b;
}

.info {
	width: 145px;
	height: 105px;
	float: left;
	display: table-row !important;
	border-bottom: 1px solid #0000003b;
}

.info div {
	display: table-cell !important;
	vertical-align: middle;
	height: 106px;
	width: 145px;
}

.infoVal {
	width: 254px;
	height: 105px;
	float: left;
	border-left: 1px solid #0000003b;
	border-bottom: 1px solid #0000003b;
}

.infoVal div {
	display: table-cell !important;
	vertical-align: middle;
	width: 255px;
	height: 106px;
}

.a {
	height: 105px;
	border-right: 1px solid #0000003b;
}

.Btn {
	width: 100%;
	height: 28px;
	text-align: right;
	float: right;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	reloadList();
	$("#pagingArea").on("click", "span", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});

	$(".list tbody").on("click","tr",function() {
		$("#no").val($(this).attr("name"));

		reloadInfo();
	});
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		$("#searchForm").attr("action", "A_Userlist");
		$("#searchForm").submit();
	});
	$("#Delarea").on("click", "input", function() {
		if ($(this).attr("id") == "delBtn") {
			var params = $("#delForm").serialize();

			$.ajax({
				type : "post",
				url : "userDelet",
				dataType : "json",
				data : params,
				success : function(result) {
                    if(result.res == "SUCCESS") {
						reloadList();
						
						html="<input type=\"button\" id=\"un_delBtn\" value=\"복구\">";
						
						$("#Delarea").html(html);
                    } else {
                        alert("탈퇴 실패");
                    }
				}
			});

		}
		if ($(this).attr("id") == "un_delBtn") {
			var params = $("#delForm").serialize();

			$.ajax({
				type : "post",
				url : "user_unDelet",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						reloadList();
						
						html="<input type=\"button\" id=\"delBtn\" value=\"탈퇴\">";

						$("#Delarea").html(html);
					} else {
					    alert("복구 실패");
					}
				}
			});
		}
	})
	$("#Gradarea").on("click", "input[type='button']", function() {
		var params = $("#delForm").serialize();
		$.ajax({
			type : "post",
			url : "grade_update",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS") {
					reloadList();
					reloadInfo();
				} else {
				    alert("변경 실패");
				}
			}
		});
	})
});
function reloadInfo() {
	var params = $("#searchForm").serialize();

	$.ajax({
		type : "post",
		url : "userInfo",
		dataType : "json",
		data : params,
		success : function(result) {
			UserInfo(result.userInfo, result.userBoard,
					result.userReport,
					result.userComent);
		}
	});
}
function reloadList() {

	var params = $("#searchForm").serialize();

	$.ajax({
		type : "post",
		url : "listpage",
		dataType : "json",
		data : params,
		success : function(result) {
			drawList(result.userlist);
			drawPaging(result.paging);
		}
	});
}

function drawList(userlist) {
	var html = "";

	for (var i = 0; i < userlist.length; i++) {
		html += "<tr name = " + userlist[i].NO + ">";
		html += "<td>" + userlist[i].NO + "</td>";
		html += "<td>" + userlist[i].ID + "</td>";
		html += "<td>" + userlist[i].NAME + "</td>";
		html += "<td>" + userlist[i].NICKNAME + "</td>";
		html += "<td>" + userlist[i].EMAIL + "</td>";
		html += "<td>" + userlist[i].LOCAL + "</td>";
		html += "<td>";
		if (userlist[i].GRADE == 1) {
			html += "<b>관리자</b>";
		} else {
			html += "-";
		}
		html += "</td><td>";
		if (userlist[i].DEL_YN == 1) {
			html += "<b>탈퇴</b>";
		} else {
			html += "-";
		}
		html += "</td></tr>";
	}
	if (userlist.length % 5 != 0) {
		for (var i = 0; i < 5 - (userlist.length % 5); i++) {
			html += "<tr>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<td></td>";
			html += "<tr>";
		}

	}

	$("table").css("height", "244px");
	$("td").css("border-top", "1px solid #00000030");

	$(".list tbody").html(html);
}

function drawPaging(pb) {

	var html = "";

	if ($("#page").val() != "1") {
		html += "<span name = \"1\"> <b><<</b> </span> &nbsp;";
		html += "<span name = " + ($("#page").val() - 1)
				+ "> <b><</b></span> &nbsp;";
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
function UserInfo(userInfo, userBoard, userReport, userComent) {
	$("#del_no").val(userInfo.NO);

	var html = "";

	html += "<div class = \"info\"><div>회원번호</div></div>"
	html += "<div class = \"infoVal\"><div class = \"a\">" + userInfo.NO
			+ "</div></div>"
	html += "<div class = \"info\"><div>아이디</div></div>"
	html += "<div class = \"infoVal\"><div>" + userInfo.ID + "</div></div>"
	html += "<div class = \"info\"><div>이름</div></div>"
	html += "<div class = \"infoVal\"><div class = \"a\">" + userInfo.NAME
			+ "</div></div>"
	html += "<div class = \"info\"><div>지역</div></div>"
	html += "<div class = \"infoVal\"><div>" + userInfo.LOCAL
			+ "</div></div>"
	html += "<div class = \"info\"><div>생년월일</div></div>"
	html += "<div class = \"infoVal\"><div class = \"a\">"
			+ userInfo.BORNDATE + "</div></div>"
	html += "<div class = \"info\"><div>누적 신고수</div></div>"
	html += "<div class = \"infoVal\"><div>" + userReport.REPORT
			+ "</div></div>"
	html += "<div class = \"info\"><div>게시글 수</div></div>"
	html += "<div class = \"infoVal\"><div class = \"a\">"
			+ userBoard.BOARD + "</div></div>"
	html += "<div class = \"info\"><div>댓글 수 </div></div>"
	html += "<div class = \"infoVal\"><div> " + userComent.COMENT
			+ " </div></div>"
	html += "<div class = \"info\"><div>등급</div></div>"
	if (userInfo.GRADE == 0) {
		html += "<div class = \"infoVal\"><div class = \"a\">회원</div></div>"
	} else {
		html += "<div class = \"infoVal\"><div class = \"a\">관리자</div></div>"
	}
	html += "<div class = \"info\"><div></div></div>"
	html += "<div class = \"infoVal\"><div></div></div>"

	/* 등급에 따른 select/버튼 추가 */
	var grade_a="";
	
	grade_a+="<select name=\"user_Grade\">";
	if(userInfo.GRADE==0){
		grade_a+="<option selected=\"selected\" value=\"0\">회원</option>";
		grade_a+="<option value=\"1\">관리자</option>";
	}
	if(userInfo.GRADE==1){
		grade_a+="<option  value=\"0\">회원</option>";
		grade_a+="<option selected=\"selected\" value=\"1\">관리자</option>";
	}
	grade_a+="<input type=\"button\" value=\"등급수정\" id=\"gradeBtn\">";
	
	/* 삭제여부에 따른 버튼 추가 */
	var btnhtml = "";
	
	if (userInfo.DEL_YN == 0) {
		btnhtml = "<input type=\"button\" id=\"delBtn\" value=\"탈퇴\">";
	} else {
		btnhtml = "<input type=\"button\" id=\"un_delBtn\" value=\"복구\">";
	}

	$("#Gradarea").html(grade_a);
	$("#Delarea").html(btnhtml);
	$(".profile").html(html);

}
</script>
</head>
<body>
	<!-- 좌측 메뉴 -->
	<div class="left">
		<c:import url="AdminLeft.jsp" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top2.jsp" />
		<!-- 회원/게시글-회원목록  -->
		<div class="title">회원/게시글-회원목록</div>
		<form action="#" method="post" id="searchForm">
			<div class="search">
				<select class="Scate" name="searchGbn">
					<c:choose>
						<c:when test="${param.searchGbn eq 0}">
							<option value="0" selected="selected">이메일</option>
						</c:when>
						
					</c:choose>
					<c:choose>
						<c:when test="${param.searchGbn eq 1}">
							<option value="1" selected="selected">이름</option>
						</c:when>
						<c:otherwise>
							<option value="1">이름</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${param.searchGbn eq 2}">
							<option value="2" selected="selected">닉네임</option>
						</c:when>
						<c:otherwise>
							<option value="2">닉네임</option>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${param.searchGbn eq 3}">
							<option value="3" selected="selected">지역</option>
						</c:when>
						<c:otherwise>
							<option value="3">지역</option>
						</c:otherwise>
					</c:choose>
				</select>
				<!-- 검색 옵션바 -->
				<input type="text" class="text" name="searchText" value="${param.searchText}">
				<!-- 검색 텍스트 -->
				<input type="button" class="SBtn" value="검색" id="searchBtn">
			</div>
			<input type="hidden" name="page" id="page" value="1" /> <input
				type="hidden" name="no" id="no">
		</form>
		<div class="list">
			<table>
				<colgroup>
					<col width="100">
					<col width="130">
					<col width="100">
					<col width="130">
					<col width="200">
					<col width="70">
					<col width="60">
					<col width="60">
				</colgroup>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>지역</th>
						<th>등급</th>
						<th>탈퇴</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<div id="pagingArea">
				<c:if test="${page ne 1}">
					<span name="1"> <b><<</b>
					</span> &nbsp;
	              	<span name="${page - 1}"> <b><</b></span> &nbsp;
	         	</c:if>
				<c:forEach var="i" begin="${paging.startPcount}"
					end="${paging.endPcount}" step="1">
					<c:choose>
						<c:when test="${i eq page}">
							<span name="${i}"><b>${i}</b></span> &nbsp;
						</c:when>
						<c:otherwise>
							<span name="${i}">${i}</span> &nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page ne paging.maxPcount}">
					<span name="${page + 1 }"><b>></b></span>&nbsp;
					<span name="${paging.maxPcount}"><b>>></b></span>&nbsp;
				</c:if>
			</div>
			<div class="Btn">
				<form action="#" method="post" id="delForm">
					<input type="hidden" name="no" id="del_no">
					<div id="Gradarea"></div>
					<div id="Delarea"></div>
				</form>
			</div>

			<div class="profile">
				<div class="info">
					<div>회원번호</div>
				</div>
				<div class="infoVal">
					<div class="a">-</div>
				</div>
				<div class="info">
					<div>아이디</div>
				</div>
				<div class="infoVal">
					<div>-</div>
				</div>
				<div class="info">
					<div>이름</div>
				</div>
				<div class="infoVal">
					<div class="a">-</div>
				</div>
				<div class="info">
					<div>지역</div>
				</div>
				<div class="infoVal">
					<div>-</div>
				</div>
				<div class="info">
					<div>생년월일</div>
				</div>
				<div class="infoVal">
					<div class="a">-</div>
				</div>
				<div class="info">
					<div>누적 신고수</div>
				</div>
				<div class="infoVal">
					<div>-</div>
				</div>
				<div class="info">
					<div>게시글 수</div>
				</div>
				<div class="infoVal">
					<div class="a">-</div>
				</div>
				<div class="info">
					<div>댓글 수</div>
				</div>
				<div class="infoVal">
					<div>-</div>
				</div>
				<div class="info">
					<div>등급</div>
				</div>
				<div class="infoVal">
					<div class="a">-</div>
				</div>
				<div class="info">
					<div></div>
				</div>
				<div class="infoVal">
					<div></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>