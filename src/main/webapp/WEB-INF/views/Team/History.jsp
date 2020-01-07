<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	.his_table{
	border: 1px solid;
	font-size: 0pt;
	}
	.his_top{
	background-color: #62a1ff;
	height: 25px;
	}
	.his_table>td{
		font-size: 11pt;
		
	} 
	.img_h{
	width: 150px;
	height:150px;
	cursor: pointer;
	}	
	.historyS{
	width: 150px;
    text-align: center;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    margin-bottom: 2px;
    color: white;
    font-weight: bold;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	 
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition_t = parseInt($("#his_table").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
 
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition_t + "px";
 
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
 
		$("#his_table").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
	
	$(".his_table").on("click", "img", function() {
		if($(this).attr("name")!=null && $(this).attr("name")!=""){
			$("#cultcode1").val($(this).attr("name"));
			$("#hisform").attr("action","cul_1");
			$("#hisform").submit();
		}
	});
});
</script>

<form action="#" id="hisform" method="post">
	<input type="hidden" name="cultcode" id="cultcode1" />
</form>
<table class="his_table" id="his_table" cellspacing=0>
	<tr>
		<th class="his_top">내가 본 정보</th>
	</tr>
	<tr style="height: 250px; vertical-align: top;">
		<td>
			<c:choose>
				<c:when test="${!empty historyimg1}">
					<img class="img_h" src="${historyimg1}" name="${historyno1}"><br>
					<div class="historyS">${historytitle1}</div>
					<br/>
				</c:when>
				<c:otherwise>
					<img width="150px" height="150px" style = "border: 1px solid #5f313100;">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!empty historyimg2}">
					<img class="img_h" src="${historyimg2}" name="${historyno2}"><br>
					<div class="historyS">${historytitle2}</div>
				</c:when>
				<c:otherwise>
					<img width="150px" height="150px">
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${!empty historyimg3}">
					<img class="img_h" src="${historyimg3}" name="${historyno3}"><br>
					<div class="historyS">${historytitle3}</div>
				</c:when>
				<c:otherwise>
					<img width="150px" height="150px">
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table> 