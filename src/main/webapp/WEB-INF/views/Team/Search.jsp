<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"src="./resources/script/jquery/jquery.form.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css"type="text/css">
<style type="text/css">
.content>div {
	border-top: 1px solid;
	width: 900px;
}
td{
	border: 1px solid;
}
.C_img{
	width: 125px;
	height: 150px;
}
.b_l_list{
	width:893px;
	height:115px;
	vertical-align: top;
	padding:5px 5px;
}
.C_l_list{
	width: 175px;
	height: 165px;
	text-align: center;
}
#add_C,#add_B{
	font-size:10pt;
}
#add_C,#add_B:hover{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		Start();
		$("#SearchBtn").on("click",function(){
			if($("#searchTxt").val()!=null && $("#searchTxt").val()!=""){
				$("#searchText").val($("#searchTxt").val());
				Start();
			}else{
				alert("검색내용을 입력해 주세요.");
			}
		});
		$("#searchTxt").on("keypress",function(event){
			if(event.keyCode == 13){
				$("#SearchBtn").click();
			}
		});
		$("#B_list tbody").on("click","tr",function(){
			if($(this).attr("name")!=null){
				$("#B_no").val($(this).attr("name"));
				$("#no1").val($(this).attr("name"));
				$("#SearchForm").attr("action","CommuBoard");
				$("#SearchForm").submit();
			}
		});
		$("#C_list tbody").on("click","td",function(){
			if($(this).attr("name")!=null){
				$("#cultcode").val($(this).attr("name"));
				$("#SearchForm").attr("action","cul_1");
				$("#SearchForm").submit();
			};
		});
		$("#add_C").on("click",function(){
			$("#SearchForm").attr("action","C_Board");
			$("#SearchForm").submit();
		})
		$("#add_B").on("click",function(){
			$("#codename").val("0");
			$("#SearchForm").attr("action","community");
			$("#SearchForm").submit();
		})
	})
	function Start() {
		var params = $("#SearchForm").serialize();
		$.ajax({
			type : "post",
			url : "Search_S",
			dataType : "json",
			data : params,
			success : function(result) {
				drawCul(result.Search_C);
				drawBoard(result.Search_B);
				divWidth(result.cnt_C,result.cnt_B);
				addView(result.cnt_C,result.cnt_B)
				//$("#searchText").val($("#searchTxt").val());
			}
		});
	}
	function addView(cnt_C,cnt_B){
		if(cnt_C>=4){
			var html="<더보기>"
			$("#add_C").html(html);
		}else{
			$("#add_C").html();
		}
		if(cnt_B>=4){
			var html="<더보기>"
			$("#add_B").html(html);
		}else{
			$("#add_B").html("");
		}
	}
	function drawCul(Search_C) {
		var html = "";

		if(Search_C!=null&&Search_C!=""){
			for(i=0;i<Search_C.length;i++){
				html += "<tr>";
				html += "<td class=\"C_l_list\" name=\""+Search_C[i].CULTCODE+"\" rowspan=\"3\"'><img class=\"C_img\" src=\""+Search_C[i].MAIN_IMG+"\"></td>";
				html += "<td width=\"825px\">"+Search_C[i].TITLE+"</td>";
				html += "</tr>";
				html += "<tr>";
				html += "<td>"+Search_C[i].STRTDATE+" ~ "+Search_C[i].END_DATE+"</td>";
				html += "</tr>";
				html += "<tr>";
				html += "<td>";
				if(Search_C[i].GCODE!=null){
					html += Search_C[i].GCODE
				}else{
					html +="정보 없음";
				}
				html += " / "+Search_C[i].PLACE;
				html += "</td>";
				html += "</tr>";
			}
		}else{
			html+="<tr><td>해당 글이 없습니다.</td></tr>";
		}
		
		$("#C_list tbody").html(html);
	}
	function drawBoard(Search_B) {
		var html = "";
		if(Search_B != null && Search_B != ""){
			for(i=0;i<Search_B.length;i++){ 
				html += "<tr name=\""+Search_B[i].NO+"\">";
				html += "<td width=\"520px\">"+Search_B[i].TITLE+"</td>";
				html += "<td width=\"160px\">"+Search_B[i].NICK+"</td>";
				html += "<td>"+Search_B[i].WRITE_DT+"</td>";
				html += "</tr>";
				html += "<tr>"; 
				html += "<td class=\"b_l_list\" colspan=\"3\">"+Search_B[i].CON+"</td>";
				html += "</tr>";
			}
		}else{
			html+="<tr><td>해당 글이 없습니다.</td></tr>";
		}
		
		$("#B_list tbody ").html(html);
	}
	function height_cont(){
	       equalHeights( $(".layout "))
	       var l_height=$(".left").height();
	       $(".left").height(l_height+30);
	}
	function divWidth(cnt_C,cnt_B){
		var Ccnt=0;
		var Bcnt=0;
		if(cnt_C>=4){
			Ccnt=3;
		}else{
			Ccnt=cnt_C;
		}
		if(cnt_B>=4){
			Bcnt=3;
		}else{
			Bcnt=cnt_B;
		}
		//문화 게시글 크기 172 게시판 크기 159 기본css 크기 132
		var result_width=185;
		if(Ccnt==0){
			result_width+=29;
		}else{
			result_width+=(Ccnt*171)+(Ccnt*2);
		}
		if(Bcnt==0){
			result_width+=29;
		}else{
			result_width+=(Bcnt*155)+(Bcnt*2);
		}
		if(result_width<630){
			result_width=630;
		}
		
		$(".content").css("height",result_width);
		$(".right").css("height",result_width+30);
		
		$(".left").css("height",$(".right").css("height"));
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>
	<form action="#" method="post" id="SearchForm">
		<input type="hidden" name="searchText" id="searchText" value="${param.searchTxt}">
		<input type="hidden" name="cultcode" id="cultcode"><!-- 공연정보선택시 -->
		<input type="hidden" name="no" id="B_no"><!-- 게시글 선택시 -->
		<input type="hidden" name="no1" id="no1"><!-- 마이페이지 오류있어서 추가 -->		
		<input type="hidden" name="codename" id="codename">
	</form>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
		<c:import url="/LeftMenu" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="layout right">
		<c:import url="Top.jsp" />
		<!-- 컨탠츠 -->
		<div class="layout content" style="width: 900px">
				<input type="text" id="searchTxt" name="searchTxt" value=""> 
				<input type="button" id="SearchBtn" value="검색"><br> <br>
			<!-- 문화 검색 -->
			<h2>문화<span id="add_C"></span></h2>
			<div>
				<table id="C_list">
					<tbody>
					</tbody>
				</table>
			</div>
			<!-- 게시글 검색 -->
			<h2>게시글<span id="add_B"></span></h2>
			<div>
				<table id="B_list">  
					<tbody>
					</tbody>
				</table>
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