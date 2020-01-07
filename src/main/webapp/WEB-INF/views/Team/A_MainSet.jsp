<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="./resources/script/jquery/jquery.form.js"></script>	
<script type="text/javascript">
	$(document).ready(function() {

		$("#logobtn").on("click",function(){
			if($.trim($("#logofile").val())==""){
				alert("사진을 올려주세요")
			}else{
				
				logoupload();
			}
		});
		$("#imgupbtn").on("click",function(){
			cimgupload();
		});
		$("#idupload-1").on('change',function(){
		   $("#imgNO1").val("1");
		});
		$("#idupload-2").on('change',function(){
			$("#imgNO2").val("2");
		});
		$("#idupload-3").on('change',function(){
			$("#imgNO3").val("3");
		});
		$("#idupload-4").on('change',function(){
			$("#imgNO4").val("4");
		});
		
		$("#imgdelbtn").on("click",function(){
			/* if($("input:checkbox[id='imgdel1']").is(":checked") == true){
				$("#imgdel1").val(1)
			}
			if($("input:checkbox[id='imgdel2']").is(":checked") == true){
				$("#imgdel2").val(2)
			}
			if($("input:checkbox[id='imgdel3']").is(":checked") == true){
				$("#imgdel3").val(3)
			}
			if($("input:checkbox[id='imgdel4']").is(":checked") == true){
				$("#imgdel4").val(4)
			} */
			
			
		
			var params = $("#cimgup").serialize();
			
			$.ajax({
				type  : "post",
				url : "imgdelajax",
				dataType : "json",
				data : params,
				
				success: function(result){
					if(result.res == "SUCCESS"){
						alert("이미지 삭제")	
						location.href="A_MainSet";
						
					}else{
						alert("삭제실패")
					}
				}	  
			  });	  
		});
	});
	
	function logoupload(){
		$("#logoup").attr("action","fileUploadAjax");
		
		var logoup = $("#logoup");	
			logoup.ajaxForm({ //보내기전 validation check가 필요할경우
			beforeSubmit : function(data,frn,opt){//전송전에 처리하는거
				return true;
			},
			
			success : function(responseText,statusText,fileFullName){//성공시
				if(responseText.result =="SUCCESS"){
					console.log(fileFullName)
				var fileName=$("#logofile").val();
					
				$("#logoatt").val(responseText.fileName);
				
				var params = $("#logoup").serialize();
				
				$.ajax({
		              type : "post",
		              url : "logoinsert",
		              dataType : "json",
		              data : params,
		              success: function(result){
		            	  if(result.res =="SUCCESS"){
		            		location.href="A_MainSet";
		            	  }else {
		            		  alert("업데이트 실패!");
		            	  }
		              }
					});
				}else {
					alert("저장실패");				
				}				
			},//ajax error
			error: function(){
				alert("에러발생!");
			}			
		});
			logoup.submit();
		// ajax form 실행
	}
	function imagepreview(input){
	    if(input.files && input.files[0]){
	        var filerd = new FileReader();
	        filerd.onload=function(e){	        	
	            $('#imgpreview' + $(input).attr('id').slice(-1)).attr('src', e.target.result);
	        };
	        filerd.readAsDataURL(input.files[0]);
	    }
	  }
	function cimgupload(){//프로필 사진 업데이트
		$("#cimgup").attr("action","fileUploadAjax");
		
		var cimgup = $("#cimgup");	
		
			//폼을 ajax 형태로 지정 해주는거
			cimgup.ajaxForm({ //보내기전 validation check가 필요할경우
			beforeSubmit : function(data,frn,opt){//전송전에 처리하는거
				//alert("전송전!!")
				return true;
			},//submit이후처리
			
			success : function(responseText,statusText){//성공시
				if(responseText.result =="SUCCESS"){
					//alert("저장완료");
				var fileName="";
					
				$("#imgatt").val(responseText.fileName);
				
				
				var params = $("#cimgup").serialize();
				
				$.ajax({
		              type : "post",
		              url : "cimgupinsert",
		              dataType : "json",
		              data : params,
		              success: function(result){
		            	  if(result.res =="SUCCESS"){
		            		 location.href="A_MainSet";
		            	  }else {
		            		  alert("업데이트 실패!");
		            		console.log($("#imgatt").val());
		            		
		            	  }
		              }
					});

				}else {
					alert("저장실패");	
					
				}				
			},//ajax error
			error: function(){
				alert("에러발생!");
			}			
		});
			cimgup.submit();
		// ajax form 실행
	}
	function imagepreview(input){
	    if(input.files && input.files[0]){
	        var filerd = new FileReader();
	        filerd.onload=function(e){	        	
	            $('#imgpreview' + $(input).attr('id').slice(-1)).attr('src', e.target.result);
	        };
	        filerd.readAsDataURL(input.files[0]);
	    }
	  }
</script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<style type="text/css">
.content {
	width: 1100px;
	min-height: 600px;
}
.imgbox1 {
	margin-left: 20px;
	border: 1px solid #9e9e9e;
	display: inline-block;
	width: 315px;
	height: 275px;
}
.content>div {
	width: 447px;
	min-height: 600px;
}
.imgbox2 {
	margin-left: 70px;
	border: 1px solid #9e9e9e;
	display: inline-block;
	width: 315px;
	height: 275px;
}
.content>div>div {
	width: 448px;
}
.imgbox1>div>div {
	margin-left: 30PX;
	margin-top: 20PX;
	border: 1px solid #9e9e9e;
	display: inline-block;
	width: 170px;
	height: 170px;
}
.imgbox4 {
	margin-left: 70px;
	margin-top: 70px;
	border: 1px solid #9e9e9e;
	display: inline-block;
	width: 300px;
	height: 300px;
}
.btnarea>input{
	width: 62px;
	height: 26px;
	margin-right: 15px;
}
h3{
	margin-left: 25px;
}
.imgbox3 div{
	margin-left: 30PX;
	margin-top: 20PX;
	border: 1px solid #9e9e9e;
	display: inline-block;
	width: 170px;
	height: 170px;
}
.imgbox3 img{
	width: 170px;
	height: 170px;
}
.imgspan img{
width: 15px;
height: 15px;
}
</style>
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
			<h1 style="text-shadow: 2px 2px 4px grey;">문화관리-메인관리</h1>
			<div class="imgbox1">
			<form action="#" id="cimgup" method="post" enctype="mltipart/form-data">
			<input type="hidden" name="imgatt" id="imgatt" />
			<input type="hidden" name="imgNO1" id="imgNO1" />
			<input type="hidden" name="imgNO2" id="imgNO2" />
			<input type="hidden" name="imgNO3" id="imgNO3" />
			<input type="hidden" name="imgNO4" id="imgNO4" />
			<input type="hidden" name="cnt" value="2"/>

				<h3>문화이미지관리</h3>
				
				<div class="imgbox3">
					<div class="imgbox3-1">
						<c:if test="${!empty imglist[0].LOC}">
							<img id="imgpreview1" src="resources/upload/${imglist[0].LOC} ">
						</c:if>
						<c:if test="${empty imglist[0].LOC}">
							<img id="imgpreview1" src="resources/upload/first_P.png ">						
						</c:if>
					</div>

					<div class="imgbox3-2">
						<c:if test="${!empty imglist[1].LOC}">
							<img id="imgpreview2" src="resources/upload/${imglist[1].LOC}">
						</c:if>
						<c:if test="${empty imglist[1].LOC}">
							<img id="imgpreview2" src="resources/upload/first_P.png ">						
						</c:if>
					</div>

					<div class="imgbox3-3">
						<c:if test="${!empty imglist[2].LOC}">
							<img id="imgpreview3" src="resources/upload/${imglist[2].LOC} ">
						</c:if>
						<c:if test="${empty imglist[2].LOC}">
							<img id="imgpreview3" src="resources/upload/first_P.png ">						
						</c:if>
					</div>

					<div class="imgbox3-4">
						<c:if test="${!empty imglist[3].LOC}">
							<img id="imgpreview4" src="resources/upload/${imglist[3].LOC}">
						</c:if>
						<c:if test="${empty imglist[3].LOC}">
							<img id="imgpreview4" src="resources/upload/first_P.png ">						
						</c:if>
					</div>
				</div>
				<br/><br/>
				
					<span class="imgspan">
					<input type="file" id="idupload-1" name="idupload"onchange="imagepreview(this);" /><input type="checkbox"  name="imgdel"  id="imgdel1" value="1">
					<input type="file" id="idupload-2" name="idupload2"onchange="imagepreview(this);" /><input type="checkbox" name="imgdel" id="imgdel2" value="2">	
					<input type="file" id="idupload-3" name="idupload3"onchange="imagepreview(this);" /><input type="checkbox" name="imgdel" id="imgdel3" value="3">
					<input type="file" id="idupload-4" name="idupload4"onchange="imagepreview(this);" /><input type="checkbox" name="imgdel" id="imgdel4" value="4">
					</span>
				<br /><br/>
				<div align="right" class="btnarea">
					<input type="button" value="삭제" id="imgdelbtn">
					<input type="button" id="imgupbtn" value="추가">
				</div>
				</form>
			</div>
			<div class="imgbox2">
			<form action="#" id="logoup" method="post" >
			<input type="hidden" name="old" value="${logo.LOC }">
			<input type="hidden" name="logoatt" id="logoatt" />
				<h3>로고이미지관리</h3>
				<div>
					<div class="imgbox4"><img src="resources/upload/${logo.LOC}" style="width: 300px;height: 300px;"></div>
					<br /><br />
					
					<span style="padding-left: 30px">
						<input type="file" id="logofile" name="logofile">
					</span>
				
					<br /><br />
				</div>
				<div align="right" class="btnarea">
					<input type="button" value="변경" id="logobtn">
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>