<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.Toparea{
	height: 25px;
	width:1000px;
	text-align: right;
	font-size: 11pt;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#Admin_Main").on("click",function(){
		location.href="A_Userlist";
	})
	$("#Home_Main").on("click",function(){
		location.href="main";
	})
})
</script>
<div class="Toparea">
관리자 모드
	<input type="button" id="Admin_Main" value="관리자 메인">
	<input type="button" id="Home_Main" value="홈페이지">
</div>