<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./resources/css/topCss.css" type="text/css">
<link rel = "stylesheet" href = "./resources/css/jquery/jquery-ui.css">
<style type="text/css">
	#reviewList:hover {
   		cursor: pointer;
		background-color: #a5d5ff;
    }
	#commentList:hover {
   		cursor: pointer;
		background-color: #a5d5ff;
    }
   
</style>
<script type="text/javascript"
	src="./resources/script/jquery/jquery.form.js"></script>
<script type = "text/javascript" src = "./resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$( "input[type = 'button']" ).button();
		$( "input[type = 'button']" ).click( function( event ) {
		   event.preventDefault();
		});
		$("#AdminBtn").on("click",function(){//관리자페이지
			location.href="A_Userlist"
		})
		
		$("#login").on("click",function(){//로그인
			location.href="Login";
		})
		
		$("#logoutBtn").on("click",function(){//로그아웃
			location.href ="Logout";
		});

		$("#mypage").on("click",function(){//마이페이지 열기
			html="";
			html="<div class=\"bgbg\"></div>";
			$("html").append(html);
			
			mypageon();
		});
		$(document).on("click",".profile",function(){//프로필사진등록
			$("#file").click();
			
		})
		$(document).on("click","#intobtn",function(){
			var html="";
			var html2="";
			html+="<input type=\"text\" name=\"into\" id=\"into\" style=\"width: 410px;height: 80px;\"/>";
			html2+="<input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" id=\"intobtn2\" value=\"작성\" style = \"font-size: 9pt; background-color: #ffb36100; border: 0px; font-weight: bolder; text-shadow: 3px 2px 4px #afacac;\" />";
			$(".duce").html(html);
			$(".introMore").html(html2);
			
		});
		$(document).on("click","#intobtn2",function(){//자기소개 수정
			var params = $("#topForm").serialize();
			$.ajax({
				type  : "post",
				url : "intoduce",
				dataType : "json",
				data : params,
				
				success: function(result){
					if(result.res == "SUCCESS"){
						alert("수정되었습니다.")	
						myupdate();
					}
				}	  
			  });	  
			
		});
		$(document).on("click","#fileup",function(){//사진 업로드
			
			if($.trim($("#file").val())==""){
				alert("사진을 올려주세요")
			}else{
				
			fileUpload();
			}
			
		});
		$(document).on("click","#myreview",function(){//후기 확인
			myreviewon()
			//$("html .bgbg").remove();
		});
		$(document).on("click","#myreviewno",function(){//후기 없을때
			alert("작성한 글이없습니다");
		});
		$(document).on("click","#myreple",function(){//내가쓴 댓글
			myrepleon()
			//$("html .bgbg").remove(); 
		});
		$(document).on("click","#myrepleno",function(){//내가쓴 댓글 없을때
			alert("작성한 댓글이없습니다");
		});
		
		$(document).on("click",".myreviewbox2 tfoot tr",function(){
			
			$("#topForm").attr("action","CommuBoard");
			$("#topForm").submit();      
		});
		$(document).on("click",".myreviewbox2 tbody tr",function(){
			
			$("#topForm").attr("action","CommuBoard");
			$("#topForm").submit();      
		});
		
		$(document).on("click","#delbtn",function(){//계정 탈퇴
			$("#email").val($("#email_1").val()+"@"+$("#email_2 option:selected").text());
			if($.trim($("#pw").val()) ==""){
				alert("비밀번호를 넣어주세요")
				$("#pw").focus();
				return false; //함수 종료 선언
			}else if($.trim($("#email_1").val()) ==""){
				alert("이메일을 넣어주세요")
				$("#email_1").focus();
			}else if($.trim($("#pw").val()) !=$("#pwcheck").val()){
				alert("비밀번호가 다릅니다.")
			}else if($.trim($("#email").val()) !=$("#emailheck").val()){
				alert("이메일이 다릅니다.")
			}else{
				 if(confirm("계정을 삭제하시겠습니까?")){
					var params = $("#topForm").serialize();
					$.ajax({
	    				type  : "post",
	    				url : "deluserpage",
	    				dataType : "json",
	    				data : params,
	    				
	    				success: function(result){
	    					if(result.res == "SUCCESS"){
	    						alert("아이디가 삭제되었습니다.")	
	    						location.href="Logout";
	    					}
	    				}	  
	    			  });	  
				 }
			}
		});
		$(document).on("click","#updateBtn",function(){
			if($.trim($("#oldMemPw").val()) !=""){//기존패스워드를 입력했을때
				if($.trim($("#oldMemPw").val()) != $("#oldPw").val()){
				
					alert("기존비밀번호가 틀립니다")					
					return false; //함수 종료 선언					
			}else {
			
			if($.trim($("#newMemPw").val())=="")  { //새 비밀번호
				alert("비밀번호를 넣어주세요");
				$("#newMemPw").focus();
				
				return false; //함수 종료 선언
				
			}else if($.trim($("#newMemPw").val()) != $.trim($("#reMemPw").val())){
				alert("비밀번호 확인이 일치하지 않습니다")
				$("#reMemPw").focus();
				return false; //함수 종료 선언
			     }
			    }
			 } else {//기존비밀번호를 입력 안했을때
					if($.trim($("#oldMemPw").val()) !=""){
						alert("기존비밀번호를 넣어주세요")
						$("#oldMemPw").focus();
						return false; //함수 종료 선언
					}
				}
				if($.trim($("#oldMemPw").val())=="")  {//패스워드 업데이트
					alert("기존비밀번호를 넣어주세요");
					$("#oldMemPw").focus();
				}else if($.trim($("#newMemPw").val()).length<6){
					alert("비밀번호를 6자 이상으로 지정해 주세요.");
					$("#newMemPw").focus();
				}
				else {
					var params = $("#topForm").serialize();
					$.ajax({
						type  : "post",
						url : "pwupdate",
						dataType : "json",
						data : params,
						success: function(result){
							if(result.res == "SUCCESS"){
								alert("패스워드가 변경되었습니다.")
								var html =""
								$(".myarea_top").html(html)
								location.reload();
							}else {
								alert("불러오는데 실패");								
							}
						}	  
					});
				}
			});
	});
	function shut(){//닫기
		var html=""
			html +="";
		$(".myarea_top").css("display","none");
		$(".myarea_top").html(html)
		$("html .bgbg").remove();
	}
function mypageon(){//마이페이지 ajax
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "mypageim",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				mypage(result.mem,result.myrp,result.myre);				
			}else {
				alert("불러오는데 실패");
			}
		}	  
	});	
}	
function myreviewon(){//내가쓴 후기
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "myreviewcheck",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				myreviewpage(result.myre);
			}else {
				alert("불러오는데 실패");
				
			}
		}	  
	});	
}	
function myrepleon(){//내가쓴 댓글
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "myreplecheck",
		dataType : "json",
		data : params,
		
		success: function(result){
			if(result.res == "SUCCESS"){
				myreplepage(result.myrp);								
			}else {
				alert("불러오는데 실패");
				
			}
		}	  
	});	
}	

function myupdate(){
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "mypageim",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				myupdatebtn(result.mem);
			}else {
				alert("불러오는데 실패");				
			}
		}	  
	});
}	
function pwupdateon(){
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "mypageim",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				pwupdate(result.mem);
			}else {
				alert("불러오는데 실패");
				
			}
		}	  
	});
}	
function deluseron(){
	var params = $("#topForm").serialize();
	$.ajax({
		type  : "post",
		url : "mypageim",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				deluser(result.mem);				
			}else {
				alert("불러오는데 실패");
				
			}
		}	  
	});
}	
	
	function mypage(mem,myrp,myre){
		
			var html=""
			html+="	<div class=\"box\">";
			html+="<div class=\"line1\"> <div style=\"margin-left: 560px;\" onclick=\"shut();\">X</div>";
			html+="<div class=\"box1\" align=\"center\" style=\"margin: 10px;\">";
			html+="<div class=\"box2\" align=\"center\"></div>";
			html+="<div class=\"circle\"><img src=\"./resources/upload/"+mem.PICTURE+"\"></div>";
			html+="<div class=\"box3\" align=\"center\">"+mem.INTRODUCE+"</div>";	
			
			html+="</div>";
			html+="<div class=\"btn1\">";
			html+="<button onclick=\"myupdate();\" type=\"button\" style=\"height: 50px; font-size: 23px; font-family: 'Nanum Pen Script', cursive; border-radius: 10px; box-shadow: 2px 2px 15px 0px #a5b2ff;background-color: #dadffd; border: 0px; cursor: pointer;\" class = \"ui-button ui-widget ui-corner-all \">회원정보변경</button>";
			html+="</div>";
			html+="</div>";
			html+="<div class=\"line2\">";
			html+="<div class=\"btn2\">";
			if(myre.length==0){
				html+="<input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" id=\"myreviewno\" style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 13px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 14pt;\" value=\"내가 쓴 후기\">";
			}else{				
			html+="<input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" id=\"myreview\" style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 13px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 14pt;\" value=\"내가 쓴 후기\">";
			}
			if(myrp.length==0){
				html+="<input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" id=\"myrepleno\"style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 37px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 14pt;\" value=\"내가 쓴 댓글\">";							
			}else{
				
			html+="<input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" id=\"myreple\"style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 37px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 14pt;\" value=\"내가 쓴 댓글\">";			
			}
			html+="</div>";
			html+="<div class=\"hu\" style=\"margin-top: 10px;\">";
			html+="내가 쓴 후기";
			html+="<div class=\"huMore\" align=\"right\"></div>";
			html+="<ul>";
			if(myre.length==0){
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
			}else if(myre.length==1){				
			html+="<li style=\" overflow: hidden;\">"+myre[0].TITLE+"</li>";
			html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
			html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";
			}else if(myre.length==2){
				html+="<li style=\" overflow: hidden;\">"+myre[0].TITLE+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myre[1].TITLE+"</li>";
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";
			}else{
				html+="<li style=\" overflow: hidden;\">"+myre[0].TITLE+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myre[1].TITLE+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myre[2].TITLE+"</li>";				
			}
			html+="</ul>";
			html+="</div>";
			html+="<div class=\"dat\">";
			html+="내가 쓴 댓글";
			html+="<div class=\"datMore\"></div>";
			html+="<ul>";				
			if(myrp.length==0){
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
			}else if(myrp.length==1){				
			html+="<li style=\" overflow: hidden;\">"+myrp[0].CON+"</li>";
			html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";	
			html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";
			}else if(myrp.length==2){
				html+="<li style=\" overflow: hidden;\">"+myrp[0].CON+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myrp[1].CON+"</li>";
				html+="<li style=\" overflow: hidden;\">작성한글이없습니다.</li>";
			}else{
				html+="<li style=\" overflow: hidden;\">"+myrp[0].CON+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myrp[1].CON+"</li>";
				html+="<li style=\" overflow: hidden;\">"+myrp[2].CON+"</li>";				
			}					
			html+="</ul>";
			html+="</div>";	
			html+="</div>";
		 
	$(".myarea_top").css("display","block");
	$(".myarea_top").html(html)
	
	}
	function myreviewpage(myre){//내가쓴 후기
		var html=""	
		html+="<div class=\"myreviewbox\">";
		html+="<input type=\"hidden\" name=\"no\" value=\""+myre[0].MEM_NO+"\" />"
		html+="<div style = \"font-family: 'Nanum Pen Script', cursive;font-size: 24px; margin-top: 7px; \"> &nbsp; 내가쓴후기("+myre.length+") </div>"
		html+="<input type=\"hidden\" id=\"no2\" name=\"no1\" />" 
		html+="<input type=\"button\" onclick=\"mypageon();\" class = \"ui-button ui-widget ui-corner-all\" value=\"뒤로\" id=\"main\" style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 13px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 11pt; float: right; font-weight: bold; margin-top: 6px; margin-right: 7px;\"/>";
		html+="<br/>"
		html+="<div class = \"myreviewbox2\">"
		html+="<table>";
		html+="<colgroup>            ";
		html+="<col width =\"70\">    ";
		html+="<col width =\"300\">   ";
		html+="<col width =\"120\">   ";
		html+="<col width =\"70\">   ";
		html+="</colgroup>           ";
		html+="<tr>";
		html+="<th>번호</th>";
		html+="<th>제목</th>";
		html+="<th>작성일</th>";
		html+="<th>조회수</th>";
		html+="</tr>";
		html+="<tfoot >";
		for(var i=0;i<myre.length;i++){		
		html+="<tr name=\""+myre[i].NO+"\" id = \"reviewList\">";	
		html+="<td>"+myre[i].NO+"</td>"
		html+="<td>"+myre[i].TITLE+"</td>"
		html+="<td>"+myre[i].WRITE_DT+"</td>"
		html+="<td>"+myre[i].HIT+"</td>"
		html+="</tr>";
		}
		html+="</tfoot>";
		html+="</table>";
		html+="</div>"
		html+="</div>"
		$(".myarea_top").html(html)
	}
	function myreplepage(myrp){//내가쓴 댓글
		var html=""	
		html+="<div class=\"myreviewbox\">";
		html+="<input type=\"hidden\" name=\"no\" value=\""+myrp[0].MEM_NO+"\" />"
		html+="<div style = \"font-family: 'Nanum Pen Script', cursive;font-size: 24px; margin-top: 7px; \"> &nbsp; 내가쓴댓글("+myrp.length+") </div>"
		html+="<input type=\"hidden\" id=\"no2\" name=\"no1\" />"
		html+="<input type=\"button\" onclick=\" mypageon();\" class = \"ui-button ui-widget ui-corner-all\" value=\"뒤로\" id=\"main\" style=\"box-shadow: 2px 2px 17px #a5b2ff; border-radius: 10px; background-color: #dadffd; margin-left: 13px; border: 0px; font-family: 'Nanum Pen Script', cursive; font-size: 11pt; float: right; font-weight: bold; margin-top: 6px; margin-right: 7px;\"/>";
		html+="<br/>"
		html+="<div class = \"myreviewbox2\">"
		html+="<table>";
		html+="<colgroup>            ";
		html+="<col width =\"70\">    ";
		html+="<col width =\"300\">   ";
		html+="<col width =\"120\">   ";
		html+="<col width =\"70\">   ";
		html+="</colgroup>           ";
		html+="<tbody>";
		html+="<tr>";
		html+="<th>번호</th>";
		html+="<th>제목</th>";
		html+="<th>작성일</th>";
		html+="</tr>";
		for(var i=0;i<myrp.length;i++){		
		html+="<tr name=\""+myrp[i].BOARD_NO+"\" id = \"commentList\">";	
		html+="<td>"+myrp[i].NO+"</td>"
		html+="<td>"+myrp[i].CON+"</td>"
		html+="<td>"+myrp[i].WRITE_DT+"</td>"
		html+="</tr>";
		}
		html+="</tbody>";
		html+="</table>";
		html+="</div>"
		html+="</div>"
		$(".myarea_top").html(html)
	}
	function myupdatebtn(mem){
		var html ="";
		html+="<div class=\"mypagebox\">";
		html+="<div class=\"mypagebox1\" align=\"left\">회원정보변경</div>";
		html+="<input type=\"button\" onclick=\" mypageon();\" class = \"ui-button ui-widget ui-corner-all\" value=\"뒤로\" id=\"main\" style=\"border-radius: 10px; box-shadow: 2px 2px 15px 0px #a5b2ff; font-family: 'Nanum Pen Script', cursive; font-weight: bold; background-color: #dadffd; border: 0px; margin-top: 6px;\"/>";
		html+="<div class=\"mypagebox2\" align=\"center\" style=\"margin: 10px 0px 0px 0px;\">";
		html+="<div class=\"none\"></div>";
		html+="<div class=\"profile\" style=\"cursor: pointer;\">프로필사진 변경</div>";
		html+="<input type=\"file\" id=\"file\" name=\"file\" style=\"display:none; \" />"
		html+="<div class=\"upPw\" onclick=\"pwupdateon()\" style=\"cursor: pointer;\">비밀번호 변경</div>";
		html+="<div class=\"delUser\" onclick=\"deluseron()\" style=\"cursor: pointer;\">회원 탈퇴</div>";
		html+="</div>";
		html+="<div class=\"mypagebox3\">";
		html+="<div class=\"photo\">";
		html+="<div class=\"photoMore\" value=\"변경\" id=\"photoMore\"><input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" value=\"변경\" id=\"fileup\" style = \"font-size: 9pt; background-color: #ffb36100; border: 0px; font-weight: bolder; text-shadow: 3px 2px 4px #afacac;\"/> </div>";		
		html+="</div>";
		html+="<div class=\"img\">";
		html+="<div class=\"mypagecircle\"><img src=\"resources/upload/"+mem.PICTURE+ "\"></div>";
		html+="</div>";
		html+="<div class=\"intro\">자기소개";
		html+="<div class=\"introMore\" id=\"introMore\"><input type=\"button\" class = \"ui-button ui-widget ui-corner-all\" value=\"변경\" id=\"intobtn\" style=\"font-size: 9pt; background-color: #ffb36100; border: 0px; font-weight: bolder;text-shadow: 3px 2px 4px #afacac;\"/></div>";   
		html+="</div>";
		html+="<div class=\"duce\">"+mem.INTRODUCE+"";
	
		html+="</div>";
		html+="</div>";
		html+="</div>";
		$(".myarea_top").html(html)
	}
	function pwupdate(mem){
		var html ="";
		html+="<div class=\"pwbox\" align=\"center\">";
		html+="<div class=\"pwbox1\" align=\"center\">비밀번호 변경</div>";
		html+="<input type=\"button\" onclick=\" myupdate();\"  value=\"뒤로\" id=\"main\" style=\" font-size: 13px; border-radius: 10px; box-shadow: 2px 2px 15px 0px #a5b2ff; background-color: #dadffd; border: 0px; margin-top: 6px;\"/>";
		html+="<div class=\"pwbox2\">";
		html+="<input type=\"hidden\" name=\"oldPw\" id=\"oldPw\" value=\""+mem.PASSWORD+"\" \">";
		html+="<input type=\"password\" name=\"oldMemPw\" id=\"oldMemPw\" placeholder=\"현재 비밀번호\" style=\"width: 330px; height: 40px; margin-bottom: 15px;\">";
		html+="<input type=\"password\" name=\"newMemPw\" id=\"newMemPw\" placeholder=\"새 비밀번호\" style=\"width: 330px; height: 40px; margin-bottom: 15px;\">";
		html+="<input type=\"password\" name=\"reMemPw\" id=\"reMemPw\" placeholder=\"비밀번호 확인\" style=\"width: 330px; height: 40px; margin-bottom: 15px;\">";
		html+="</div>";
		html+="<div class=\"pwbox3\">";
		html+="<input type = \"button\" class = \"ui-button ui-widget ui-corner-all\" value = \"변경\" id = \"updateBtn\" style=\"background-color: #5cbef3; font-size: 24px; text-shadow: 3px 2px 4px #afacac; border: 0px; width : 120px;\"/>";
		html+="<input type = \"button\" class = \"ui-button ui-widget ui-corner-all\" value = \"취소\" onclick=\"shut();\" id = \"backBtn\" style=\"border: 0px; font-size: 24px;text-shadow: 3px 2px 4px #afacac; width : 120px;\"/>";
		html+="</div>";
		html+="  </div>";
		
		$(".myarea_top").html(html)
	}
	function fileUpload(){//프로필 사진 업데이트
		$("#topForm").attr("action","fileUploadAjax");

		var topForm = $("#topForm");
		//폼을 ajax 형태로 지정 해주는거
			topForm.ajaxForm({ //보내기전 validation check가 필요할경우
			beforeSubmit : function(data,frn,opt){//전송전에 처리하는거
				//alert("전송전!!")
				return true;
			},//submit이후처리
			
			success : function(responseText,statusText){//성공시
				if(responseText.result =="SUCCESS"){
					//alert("저장완료");
				var fileName="";
					
				$("#att").val(responseText.fileName);
				
				var params = $("#topForm").serialize();
				
				$.ajax({
		              type : "post",
		              url : "fileinsert",
		              dataType : "json",
		              data : params,
		              success: function(result){
		            	  if(result.res =="SUCCESS"){
		            		  alert("성공")
		            	  }else {
		            		  alert("작성 실패!");
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
			topForm.submit();
		// ajax form 실행
	}
	function deluser(mem){
		var html=""
		html+="<div class=\"delbox\">";
		html+="<div class=\"delbox1\" align=\"center\">회원탈퇴</div>";	
		html+="<input type=\"button\" onclick=\" myupdate();\"  value=\"뒤로\" id=\"main\" style=\"font-size: 13px; border-radius: 10px; box-shadow: 2px 2px 15px 0px #a5b2ff; background-color: #dadffd; border: 0px; margin-top: 6px;\"/>";
		html+="<div class=\"delbox2\">";		
		html+="<input type=\"hidden\" id=\"emailheck\" value=\""+mem.EMAIL+"\" />";
		html+="<input type=\"hidden\" id=\"pwcheck\" value=\""+mem.PASSWORD+"\" />";
		html+="<input type=\"password\" name=\"pw\" id=\"pw\" placeholder=\"비밀번호 입력\" style=\"width: 239px; height: 33px;\"/>";
		html+="<br/><br/>";
		html+="<input type=\"text\" id=\"email_1\" placeholder=\"이메일\" style=\"width: 239px; height: 33px;\"/> @ <select name=\"searchEmail\" id=\"email_2\" style=\"width: 120px; height: 38px;\">";
		html+="<option value=\"0\">gmail.com</option>";
		html+="<option value=\"1\">naver.com</option>";
		html+="	<option value=\"2\">cacao.com</option>";
		html+="	</select>";
		html+="	<br/><br/>";
		html+="	<div class=\"delbtbox\">";
		html+="	<input type=\"button\" id=\"delbtn\"value=\"탈퇴\" class = \"ui-button ui-widget ui-corner-all\" style=\"background-color: #5cbef3; font-size: 24px; text-shadow: 3px 2px 4px #afacac; border: 0px; width : 120px;\"/>";  
		html+="<input type=\"button\" id=\"cancelbtn\" class = \"ui-button ui-widget ui-corner-all\" value=\"취소\" onclick=\"shut();\" style=\" border: 0px; font-size: 24px; text-shadow: 3px 2px 4px #afacac; width : 120px;\"/>";
		html+="	</div>";
		html+="	</div>";
		html+="</div>";
		$(".myarea_top").html(html)
	}
	
</script>
<form action="#" id="topForm" method="post" enctype="multipart/form-data">
<div class="Toparea">
	<c:choose>
			<c:when test="${empty sMemNo}">
				<input type="button" id="login" value="로그인" style = " font-size: 10pt !important; background-color: #03a6ff !important; color: white !important; border: 0px !important;">
			</c:when>
			<c:when test="${sGrade eq 1}">
				${sNAME}님 어서오세요. 
				<input type="button" value="관리자페이지" id="AdminBtn"style = " font-size: 10pt !important; background-color: #03a6ff !important; color: white !important; border: 0px !important;"  />
				<input type="button" value="로그아웃" id="logoutBtn"style = " font-size: 10pt !important; background-color: #03a6ff !important; color: white !important; border: 0px !important;"  /> 
				<input type="button" value="마이페이지" id="mypage"style = " font-size: 10pt !important; background-color: #03a6ff !important; color: white !important; border: 0px !important;"  />
			</c:when>
			<c:otherwise>
			 ${sNAME}님 어서오세요.<input type="button" value="로그아웃" id="logoutBtn" /> 
			<input type="button" value="마이페이지" id="mypage"/> 
			</c:otherwise>
		</c:choose>
</div>
<div class="myarea_top" ></div>
<input type="hidden" id="no" name="no" value="${sMemNo}">
<input type="hidden" id="att" name="att">
<input type="hidden" name="email" id="email">
</form>