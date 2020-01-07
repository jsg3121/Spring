<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="./resources/script/jquery/jquery.form.js"></script>
<script type = "text/javascript" src = "./resources/script/jquery/jquery-ui.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<link rel="stylesheet" href="./resources/css/mapCss.css" type="text/css">
<link rel = "stylesheet" href = "./resources/css/jquery/jquery-ui.css">
<style type="text/css">
#New_Cult tr:hover{
	text-decoration: underline;
	font-size: 12pt;
}
#Hit_Cult tr:hover{
	text-decoration: underline;
	font-size: 12pt;
}
.content>div {
	width: 447px;
	min-height: 600px;
}
.content>div>div {
	width: 448px;
}
.main_C {
	width: 440px;
	margin-left: 5px;
	margin-top: 10px;
}
#slide{     
     width: 230px;
	height: 148px;
    }
#slide div{   
     display:none;    
    }
#slide img{
      width:230px;
      height: 148px;
    } 
#txtslide{     
     width: 230px;
	height: 148px;
    }
#txtslide div{   
     display:none;    
    }

.Monimg{
	width: 130px;
	height: 148px;
}
.Mon_M{
	width: 60px;
	height: 160px;
}
.imgBtn{
	width: 10px;
	height: 10px;
	margin-right: 5px;
}
#Mons{
	width: 300px;
	height: 175px;
}
.skip{
	text-overflow:ellipsis;
	white-space: nowrap;
	overflow:hidden;
    padding-left: 10px;
}
.test{
	width: 130px;
}
#map_list_s{
	font-weight: 100;
	padding-bottom: 10px;
    padding-top: 10px;
    border: 0px;
    font-size: 11pt;
}
#map_list_s:hover{
	font-size : 12pt;
	text-decoration: underline;
    cursor: pointer;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	var imgmax=0;
	var imgnow=1;
// 	txtslide();//페이지가 로딩될때 함수를 실행 합니다
	$(document).ready(function() {
		$( "input[type = 'button']" ).button();
	    $( "input[type = 'button']" ).click( function( event ) {
	      event.preventDefault();
	});
	    var state = true;
	    $( "#map_list_s" ).on( "click", function() {
	      if ( state ) {
	        $( "#map_list_s" ).animate({
	          backgroundColor: "#aa0000",
	          color: "#fff",
	          width: 500
	        }, 1000 );
	      } else {
	        $( "#map_list_s" ).animate({
	          backgroundColor: "#fff",
	          color: "#000",
	          width: 240
	        }, 1000 );
	      }
	      state = !state;
	    });
	    
		$("#SearchBtn").on("click", function() {
			$("#m_SearchForm").submit()
		})
		//이달의 문화행사 개수 구하기 (MAX 4) 
		var params=$("#getCNTForm").serialize();
		$.ajax({
			type:"post",
			dataType:"json",
			url:"MonImg",
			data:params,
			success:function(result){
				Mons(result.getTomon);
				createMonBtn();
				ChangeMon();
				}
		})
		//문화 새소식 받기
		$.ajax({
			type:"post",
			dataType:"json",
			url:"New_Cult",
			data:params,
			success:function(result){
				New_List(result.New_Cult);
				}
		})
		//추천 문화행사 받기
		$.ajax({
			type:"post",
			dataType:"json",
			url:"Hit_Cult",
			data:params,
			success:function(result){
				Hit_List(result.Hit_Cult);
				}
		})
		$("#Mon_R").on("click",function(){
			var num=$("#getCntTomon_Num").val() * 1;
			if(num+1>$("#getCNtTomon").val()){
				$("#getCntTomon_Num").val(0);
			}else{
				$("#getCntTomon_Num").val(num+1); 
			}
			Mon_R_click();
		})
		$("#Mon_L").on("click",function(){
			var num=$("#getCntTomon_Num").val()*1;
			if(num-1<0){
				$("#getCntTomon_Num").val($("#getCNtTomon").val());
			}else{
				$("#getCntTomon_Num").val(num-1);
			}
			Mon_L_click();
		})
		$("#Mons").on("click","div",function(){
			$("#cultcode").val($(this).attr("name"));
			$("#C_moveForm").submit();
		})
		$("#New_Cult").on("click","tr",function(){
			if($(this).attr("name")!=null&&$(this).attr("name")!=""){
				$("#cultcode").val($(this).attr("name"));
				$("#C_moveForm").submit();
			}
		})
		$("#Hit_Cult").on("click","tr",function(){
			if($(this).attr("name")!=null&&$(this).attr("name")!=""){
				$("#cultcode").val($(this).attr("name"));
				$("#C_moveForm").submit();
			}
		})
	})
	function New_List(New_Cult) {
		var html="";
		
		for(i=0;i<3;i++){
			html+="<tr name=\""+New_Cult[i].CULTCODE+"\">";
			html+="<td class=\"skip\">"+New_Cult[i].TITLE+"</td>";
			html+="<td>"+New_Cult[i].DATES+"</td>";
			html+="<td>"+New_Cult[i].GCODE+"</td>";
			html+="</tr>";
		}
		$("#New_Cult").html(html);
	}
	function Hit_List(Hit_Cult) {
		var html="";
		
		for(i=0;i<3;i++){
			html+="<tr name=\""+Hit_Cult[i].CULTCODE+"\">";
			html+="<td class=\"skip\">"+Hit_Cult[i].TITLE+"</td>";
			html+="<td>"+Hit_Cult[i].DATES+"</td>";
			html+="<td>"+Hit_Cult[i].GCODE+"</td>";
			html+="</tr>";
		}
		$("#Hit_Cult").html(html);
	}
	function Mon_R_click(){
		ChangeMon();
	}
	function Mon_L_click(){
		ChangeMon();
	}
function imgslide_start(){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"slide",
		success:function(result){
			imgmax = result.imglistcnt; //총 이미지 개수를 가져옵니다
			
			html="";
			 
			for(i=0;i<imgmax;i++){
				html+="<div style=\"display:none\" id=\"img"+(i+1)+"\">";
				html+="<img src=\"resources/upload/"+result.imglist[i].LOC+"\">";
				html+="</div>"; 
			}
			$("#slide").html(html);
			
			$("#img1").css("display","block");
			 
			setTimeout('imgslide()',4000);
		} 
	})
}
function imgslide(i){

	$("#img"+imgnow).hide(); //현재 이미지를 사라지게 합니다.
	
	if( imgnow == imgmax ){ imgnow = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	
	else{ imgnow++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	
	$("#img"+imgnow).fadeIn(500); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	
	setTimeout('imgslide()',4000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
	
}
// function txtslide(){
//   $val = $("#txtslide").attr("val"); //현재 이미지 번호를 가져옵니다

//   $mx = $("#txtslide").attr("mx"); //총 이미지 개수를 가져옵니다

// 	$("#solidtxt"+$val).hide(); //현재 이미지를 사라지게 합니다.

// 	if( $val == $mx ){ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.

// 	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다

// 	$("#solidtxt"+$val).fadeIn(500); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.

// 	$("#txtslide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.

// 	setTimeout('txtslide()',4000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
// }
	function Mons(getTomon){
		var html="";
		
		for(i=0;i<=$("#getCNtTomon").val();i++){
			html+="<div name=\""+getTomon[i].CULTCODE+"\"><img id=\"mon"+i+"\" class=\"Monimg\" src=\""+getTomon[i].MAIN_IMG+"\"></div>";
			html+="<div name=\""+getTomon[i].CULTCODE+"\" id=\"mon_t"+i+"\" >"+getTomon[i].TITLE+"</div>";
		}
		
		$("#Mons").html(html);
	}
	function createMonBtn(){
		var html="";
		for(i=0;i<=$("#getCNtTomon").val();i++){
			html+="<img class=\"imgBtn\" id=\"mon_b_"+i+"\" name=\"mon_b_"+i+"\" src=\"resources/images/MonBtn_off.png\">";
		}
		
		$("#Monarea").html(html);
	}
	function ChangeMon(){
		var num=$("#getCntTomon_Num").val();
		for(i=0;i<=$("#getCNtTomon").val();i++){
			$("#mon"+i).css("display","none"); 
			$("#mon_t"+i).css("display","none"); 
			$("#mon_b_"+i).attr("src","resources/images/MonBtn_off.png");
		}
		$("#mon"+num).css("display","block");
		$("#mon_t"+num).css("display","block");
		$("#mon_b_"+num).attr("src","resources/images/MonBtn_on.png");
	}
</script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a34fb1a44115ceb8abf8ead58e8d119&libraries=services"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>

<body>
<form action="#" method="post" id="getCNTForm">
<input type="hidden" name="Mon_Cnt" id="Mon_Cnt" value="${getCNtTomon}">
</form>
<form action="cul_1" method="post" id="C_moveForm">
<input type="hidden" name="cultcode" id="cultcode">
</form>
	<!-- 좌측 메뉴 -->
	<div class="layout left">
		<c:import url="/LeftMenu" />
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="right">
		<c:import url="Top.jsp" />
		<!-- 컨탠츠 -->
		<div class="layout content" style = "padding-left: 30px;">
			<div style="display: inline-block;">
				<table>
					<tr>
						<!-- 검색 -->
						<td>
							<div class="main_C" style="text-align: center;">
								<form action="Search" method="post" id="m_SearchForm">
									<input style="width: 320px; width: 320px; height: 25px; border: 3px solid #62a1ff; font-size: 11pt;" type="text" name="searchTxt" id="SearchTxt" autocomplete="off" placeholder = "원하시는 행사 명을 입력해주세요"> 
									<input style="width: 60px; margin-bottom: 3px; background-color: #03a6ff; color: white; border: 0px;" id="SearchBtn" type="button" value="검색">
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<!-- 이달의 문화 행사 -->
						<td>
							<table class="main_C" style="height: 210px; text-align: center;">
								<tr>
									<td style="text-align: left; height: 25px; font-weight: bold; font-size: 13pt;" colspan="2">이달의 문화행사</td>
								</tr>
								<tr>
									<td>
										<div id="Mon_L" class="Mon_M">
										<img src="resources/images/Main_Mon_Left.png">
										</div>
										<div id="Mons">
										</div>
										<div id="Mon_R" class="Mon_M">
										<img src="resources/images/Main_Mon_Right.png">
										</div>
									</td>
								</tr>
								<tr>
									<td style="text-align: center;" id="Monarea">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<!-- 문화 새소식 -->
						<td>
							<table class="main_C" style="height: 160px;table-layout: fixed; border-bottom: 0.5px solid #03a6ff;">
								<colgroup>
									<col width="280">
									<col width="80"> 
									<col width="70">
								</colgroup> 
								<thead>
									<tr>
										<td colspan="3" style="height: 25px;
										    padding-bottom: 5px;
										    font-size: 13pt;
										    font-weight: bold;
										    border-bottom: 0.5px solid #03a6ff;">문화 새소식</td>
									</tr>
								</thead>
								<tbody id="New_Cult">
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<!-- 추천문화행사 -->
						<td>
							<table class="main_C" style="height: 160px;table-layout: fixed; border-bottom: 0.5px solid #03a6ff;">
								<colgroup>
									<col width="280">
									<col width="80"> 
									<col width="70">
								</colgroup> 
								<thead>
									<tr>
										<td colspan="3" style="height: 25px;
										    padding-bottom: 5px;
										    font-size: 13pt;
										    font-weight: bold;
										    border-bottom: 0.5px solid #03a6ff;
										    z-index: 10;">추천 문화행사</td>
									</tr>
								</thead>
								<tbody id="Hit_Cult">
								</tbody>
							</table> 
						</td>
					</tr>
				</table>
			</div>
			<div style="display: inline-block;">
				<!-- 문화행사 관련사진 -->
				<div style="margin-top: 15px;">
					<table class="main_C" style="height: 250px;">
						<tr>
							<td style="text-align: center;">
								<div id="slide">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- 주변행사 공연 -->
				<div style="margin-top: 10px; font-size: 13pt; font-weight: bold;">
					<div style = "height: 25px;font-size: 13pt; margin-bottom: 5px; font-weight: bold;">주변 행사 / 공연</div>
					<table class="main_C" style="height: 230px; border-top: 0.5px solid #03a6ff; margin-top: 1.2px;">
						<tr>
							<td>
							<table class="skip test" style="table-layout: fixed; padding: 0px; width: 130px; z-index: 100">
							</table>
							</td>
							<td rowspan="5">
								<div class="map_wrap" style="margin-left: 5px;">
									<div id="maps" style="width: 300px; height: 350px; position: relative; overflow: hidden;"></div>
										<ul id="category">
											<li id="CT1" data-order="4"><span class="category_bg cafe">
											</span> 문화
										</li>
									</ul>
								<script type="text/javascript" src="./resources/script/jquery/mapjs.js"></script>
								</div>
							</td>
						</tr>
					</table>
				</div>
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
	<input type="hidden" id="getCNtTomon" value="${getCNtTomon -1}">
	<input type="hidden" id="getCntTomon_Num" value="0">
</body>
</html>