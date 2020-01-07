<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.title {
	width : 100%;
	height : 50px;
	font-size: 20pt !important;
	text-shadow: 2px 2px 4px grey;
    font-weight: bold;
	display: inline-block;
	padding-top: 20px;
	margin-bottom: 20px;
}
.Group {
	width : 900px;
	border-top : 5px solid #9e9e9e;
	text-align: center;
}
th {
	height : 40px;
	font-weight: bold;
}
.Group td {
	border-top: 1px solid #b8b8b845;
	height : 40px;
}
.page {
	text-align: center;
	font-size: 13pt;
	margin-top: 7px;
}
</style>
<script type="text/javascript">
//세션값 넘겨 받는 것
$(document).ready(function() {
	C_title();
	if($("#codenames").val() == 1){
		$("#c_1").css('background-color','#a0cbff');
		$("#c_1").css('font-weight','bold');
		$("#c_1").css('pointer-events','none');
		$("#c_1").css('cursor','default');
		$("#c_1").css('color','white');
	}
	if($("#codenames").val() == 2){
		$("#c_2").css('background-color','#a0cbff');
		$("#c_2").css('font-weight','bold');
		$("#c_2").css('pointer-events','none');
		$("#c_2").css('cursor','default');
		$("#c_2").css('color','white');
	}
	$("tbody").on("click","tr",function(){
		$("#no").val($(this).attr("name"));
		$("#no1").val($(this).attr("name"));
		$("#CommuForm").attr("action","CommuBoard");
		$("#CommuForm").submit();
	});  
	
	$("#paging_area").on("click", "span", function() {
		$("#page").val($(this).attr("name"));
		$("#CommuForm").attr("action", "community");
		$("#CommuForm").submit();
	});
	$("#WriteBtn").on("click",function(){
		if($("#sMemNo").val()!=null && $("#sMemNo").val()!=""){
			$("#CommuForm").attr("action", "boardWrite");
			$("#CommuForm").submit();
		}else{
			alert("로그인 후 이용하세요.");
		}
	})
	$("#SaerchBtn").on("click",function(){
		Saerch();
	})
});
function C_title(){
var new_conbar=$("#codenames").val();
	if(new_conbar==null||new_conbar==''){
		new_conbar="0";
	}
	switch (new_conbar) {
	case "0":
		$("#board_topname").html("게시판 모아보기")
		break;
	case "1":
		$("#board_topname").html("후기 게시판")
		break;
	case "2":
		$("#board_topname").html("모임 게시판")
		break;
	}
};
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
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
${param.codename }
<form action="#" method="post" id="CommuForm">
<input type="hidden" id="page" name="page" value="${page}"/>
<input type="hidden" name="codename" id="codenames" value="${param.codename}">
<input type = "hidden" id = "sMemNo" value="${sMemNo}"/>
<input type = "hidden" id = "no" name="no"/>
<input type="hidden" id="no1" name="no1" />
</form>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
	<c:import url="LeftMenu.jsp"/>
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top.jsp"/>
		<!-- 모임게시판-->
		<div class="layout content">
			<div class = "title"><span id="board_topname">  </span></div>
			<div class = "Group">
				<table class="list">
					<colgroup>
						<col width = "80">
						<col width = "520">
						<col width = "120">
						<col width = "100">
						<col width = "80">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:if test="${!empty list}">
						<c:forEach var="list" items="${list}">
							<tr name="${list.NO}"> 
								<td>${list.NO}</td>  
								<c:choose>
									<c:when test="${list.CLASS eq 1}">
										<td>[후기] ${list.TITLE}</td>
									</c:when>
									<c:when test="${list.CLASS eq 2}">
										<td>[모임] ${list.TITLE}</td>
									</c:when>
								</c:choose>
								<td>${list.NICK}</td>
								<td>${list.WRITE_DT}</td>
								<td>${list.HIT}</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5">게시글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				</table>
				<div style="text-align: right;width: 100%;border-top : 5px solid #9e9e9e;padding-top:3px;">
					<c:if test="${param.codename eq 2}">
						<input type="button" id="WriteBtn" value="글쓰기">
					</c:if>
				</div>
				<!--게시판 페이징 -->
				<div class = "page" id="paging_area">
					<c:if test="${page ne 1}">
						<span name="1">≪</span>&nbsp;
						<span name="${page - 1}">＜</span>&nbsp;					
					</c:if>
					<c:forEach var="i" begin="${pb.startPcount}" end="${pb.endPcount}" step="1">
						<c:choose>
							<c:when test="${i eq page}">
								<span name="${i}" style="color: red"><b>${i}</b></span>&nbsp;
							</c:when>
							<c:otherwise>
								<span name="${i}">${i}</span>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${page ne pb.maxPcount}">
						<span name="${page + 1}">＞</span>&nbsp;
						<span name="${pb.maxPcount}">≫</span>&nbsp;
					</c:if>
				</div>
				<!-- 검색 구역 -->
				<div style="width: 100%;">
					<form action="community" method="post" id="SaerchForm">
						<input type="hidden" name="codename" id="codenames" value="${param.codename}">
						<input type="hidden" id="page" name="page" value="${page}"/>
						<select name="searchGbn" >
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
									<option value = "1" selected = "selected">내용</option>
								</c:when>
								<c:otherwise>
									<option value = "1"> 내용 </option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test = "${param.searchGbn eq 2}">
									<option value = "2" selected = "selected">작성자</option>
								</c:when>
								<c:otherwise>
									<option value = "2"> 작성자 </option>
								</c:otherwise>
							</c:choose>
						</select>
						<input step="text" name="searchText" id="searchText" value="${param.searchText }">
						<input type="button" id="SaerchBtn" value="검색">
					</form>
				</div>
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