<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel = "stylesheet" href = "./resources/css/jquery/jquery-ui.css">
<style type="text/css">
	.L_menu div:hover{
		cursor: pointer;
	}
	li {
	    padding-top: 3px;
    	padding-left: 10px;
    	font-size: 12pt;
    	padding-bottom : 3px;
	}
	.ui-state-active {
		border: 1px solid #003eff00 !important;
		background: #809acc !important;
	}
	ul{
	   list-style:none;
	}
</style>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="./resources/script/jquery/jquery.form.js"></script>
<script type = "text/javascript" src = "./resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		 $( ".L_menu" ).menu({
		      items: "> :not(.ui-widget-header)"
		    });
		 
		$(".L_menu").on("click","li",function(){
			var point = $(this).attr("id");
			
			switch (point) {
			case "map":
				location.href="map3";
				break;
			case "Rogo":
				location.href="main";
				break;
			case "play":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "1":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "2":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "3":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "4":
				$("#codename").val(point); 
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "5":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "6":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "7":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "8":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "9":
				$("#codename").val(point);
				$("#Cc_boardMove").attr("action","C_Board");
				$("#Cc_boardMove").submit();
				break;
			case "c_0":
				$("#codename_l").val("0");//후기게시판
				$("#Cl_boardMove").attr("action","community");
				$("#Cl_boardMove").submit();
				break;
			case "c_1":
				$("#codename_l").val("1");//후기게시판
				$("#Cl_boardMove").attr("action","community");
				$("#Cl_boardMove").submit();
				break;
			case "c_2":
				$("#codename_l").val("2");//모임게시판
				$("#Cl_boardMove").attr("action","community");
				$("#Cl_boardMove").submit();
				break;
			} 
		})
		
	})
function equalHeights( $objs )
{
	var highest = 0;

	$objs.each(function() {
		thisHeight = $(this).height();
		if(thisHeight > highest ) {
			highest = thisHeight;
		}
	});

	$objs.height( highest );
}

$(window).load(function(){
       equalHeights( $(".layout "))
       var l_height=$(".left").height();
       $(".left").height(l_height+30);
       
});
</script>
	<div name="Rogo" id="Rogo">
		<div style="height: 200px;">
			<img src="resources/upload/${logo.LOC}" width="150px" height="150px" style="width: 200px; height: 200px;">
		</div>
	</div>
<ul style="width: 200px; min-height: 560px; border: 0px;" class="L_menu">
	<!-- 로고 -->
	<!-- 메뉴 -->
	<li class="ui-widget-header" id="play" style = "padding-top: 12px;height: 40px; background: #62a1ff; color: white;">
		<div class="bigmanu">문화</div>
	</li>
	<li id="1">
		<div>문화교양/강좌</div>
	</li>
	<li id="2">
		<div>무용</div>
	</li>
	<li id="3">
		<div>뮤지컬/오페라</div>
	</li>
	<li id="4">
		<div>영화</div>
	</li>
	<li id="5">
		<div>전시/미술</div>
	</li>
	<li id="6">
		<div>축제-예술</div>
	</li>
	<li id="7">
		<div>콘서트</div>
	</li>
	<li id="8">
		<div>클래식</div>
	</li>
	<li id="9">
		<div>기타</div>
	</li>
	<li class="ui-widget-header" id="map" style = "padding-top: 12px;height: 40px; background: #62a1ff; color: white;">
		<div class="bigmanu">문화지도</div>
	</li>
	<li class="ui-widget-header" id="c_0" style = "padding-top: 12px;height: 40px; background: #62a1ff; color: white;">
		<div class="bigmanu">문화소통</div> 
	</li>
	<li id="c_1">
		<div>후기</div>
	</li>
	<li id="c_2">
		<div>모임</div>
	</li>
</ul>

<form action="#" method="post" id="Cl_boardMove">
	<input type="hidden" name="codename" id="codename_l">
</form>
<form action="#" method="post" id="Cc_boardMove">
	<input type="hidden" name="codename" id="codename">
</form>