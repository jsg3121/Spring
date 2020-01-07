<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style style="text/css">
	#A_menu tr:hover{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#A_menu tr").on("click",function(){
			var move_P=$(this).attr("id");
			switch (move_P) {
			case "A_user":
				location.href="A_Userlist";
				break;
			case "A_board":
				location.href="A_Board";
				break;
			case "A_repot":
				location.href="A_Reort";
				break;
			case "A_cul":
				location.href="A_C_List";
				break;
			case "A_main":
				location.href="A_MainSet";
				break;
			 case "A_total":
				location.href="A_Total";
				break;
			} 
		})
	})
</script>
<table style="width: 200px; min-height: 560px" id="A_menu">
	<!-- 메뉴 -->
	<tr id="A_user" style="margin-top: 20px;">
		<td class="bigmanu">회원/게시글</td>
	</tr>
	<tr id="A_user">
		<td>회원목록</td>
	</tr>
	<tr id="A_board">
		<td>게시글목록</td>
	</tr>
	<tr id="A_repot">
		<td>신고목록</td>
	</tr>
	<tr id="A_cul">
		<td class="bigmanu">문화관리</td>
	</tr>
	<tr id="A_cul">
		<td>문화목록</td>
	</tr>
	<tr id="A_main">
		<td>메인관리</td>
	</tr>
	<tr id="A_total">
		<td class="bigmanu">통계</td>
	</tr>
</table>