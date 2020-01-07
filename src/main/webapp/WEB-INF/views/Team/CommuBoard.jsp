<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<head>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<link rel="stylesheet" href="./resources/css/CommuBoard.css" type="text/css">
<style type="text/css">
.Group {
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
#searcharea{
	width:100%;
	text-align: right;
	vertical-align: top;
}
.popup_wrapper {
	position: absolute;
    top: 50%;
    left: 50%;
    z-index:100;
    transform: translate(-50%,-50%);
    background: #fff;
    padding: 15px;
    min-width: 230px;
    border: 1px solid black;
    width:452px; 
    height:255px;
}
.row2 {
    display: inline-block;
    width: 100%;
    vertical-align: middle;
    border: 1px solid black;
}
.col {
    display: block;
    float: left;
}
.retitle {
    font-size: 18px;
    font-family: arial,sans-serif;
    font-weight: 700;
    width : 437px;
    height : 27px;
}
.close {
    text-align: center;
    cursor: pointer;
    font-family: arial,sans-serif;
    font-weight: 700;
    color: #888;
    width : 15px;
    height : 27px;
}
.reason_wrapper{
	margin: 10px;
}
.rebox {
	display: inline-block;
    cursor: pointer;
    width: 210px;
    height: 42px;
}
#cRepBtn {
	display: inline-block;
    line-height: 30px;
    text-align: center;
    font-weight: 500;
    border: 1px solid #1A70DC;
    background-color: #1A70DC;
    width: 454px;
    margin-top: 10px;
    font-size: 25px;
}
#commRepBtn {
   display: inline-block;
    line-height: 30px;
    text-align: center;
    font-weight: 500;
	border: 1px solid #1A70DC;
    background-color: #1A70DC;
    width: 454px;
    margin-top: 10px;
    font-size: 25px;
}
.label_text {
	font-size: 14px;
	font-weight: 600;
}

.myarea{
	width: 0px;
	height: 0px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on("click",".close",function(){
		comshut();
	})
	
   $(".BtnDiv").on("click","#Move_CULT",function(){
		$("#comentForm").attr("action","cul_1");
		$("#comentForm").submit();
	})
	
   comenton()
   
   $("#uploadBtn").on("click", function() {
	   if($.trim($("#ComentNo").val()) != ""){
		 var params = $("#commentForm").serialize();
         $.ajax({
            type : "post",
            url : "changeBoardComment",
            dataType : "json",
            data : params,
            success : function(result) {
               if(result.res == "SUCCESS") {
                  alert("수정되었습니다");
                  location.reload();
               } else {
                  alert("수정되지 않았습니다");
               }
            }
         });
      } else {
         if($("#smemNo").val() ==null || $("#smemNo").val()==""){
            alert("로그인 후 이용해주세요.");
         }else{
            if($.trim($("#con").val()) == "") {
               alert("내용을 입력하세요.");
               $("#con").focus();
            } else {
               var params = $("#commentForm").serialize();
               $.ajax({
                     type : "post",
                     url : "insertAjax",
                     dataType : "json",
                     data : params,
                     success : function(result) {
                        if(result.res == "SUCCESS") {
                           $("#comentForm").attr("action","CommuBoard");
                           $("#bno").attr("name","no");
                           $("#no").attr("name","#");
                           $("#comentForm").submit();
                        } else {
                           alert("작성실패");
                        }
                     }
               });
            }
         }
      }
   });
   //comenton();
   
   $("#repBtn").on("click",function() { //게시글 신고 버튼
      if($("#smemNo").val() ==null || $("#smemNo").val()==""){
         alert("로그인 후 이용해주세요.");
      } else {
         var html =""
         var html2=""
         
		 html2+="<div class=\"bgbg\"></div>"
         html+="<div id=\"popup\" class=\"report\">";
         html+="   <div class=\"dimmed\"></div>";
         html+="   <div class=\"popup_wrapper\">";
         html+="      <div class=\"col col_1\">";
         html+="         <div class=\"retitle\">신고</div>";
         html+="      </div>";
         html+="      <div class=\"col col_2\">";
         html+="         <div class=\"close\" \">X</div>";
         html+="      </div>";
         html+="      <div class=\"row2\">";
         html+="         <div class=\"report_body row\">";
         html+="            <div class=\"reason_wrapper\">";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" checked=\"checked\" name=\"A\" value=\"1\">";
         html+="                  <span class=\"label_text\">영리목적/홍보성</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"2\">";
         html+="                  <span class=\"label_text\">불법정보</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"3\">";
         html+="                  <span class=\"label_text\">음란/선정성</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"4\">";
         html+="                  <span class=\"label_text\">욕설/인신공격</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"5\">";
         html+="                  <span class=\"label_text\">개인정보노출</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"6\">";
         html+="                  <span class=\"label_text\">같은 내용의 반복 게시(도배)</span>";
         html+="               </label>";
         html+="               <label class=\"rebox\">";
         html+="                  <input type=\"radio\" name=\"A\" value=\"7\">";
         html+="                  <span class=\"label_text\">기타</span>";
         html+="               </label>";
         html+="            </div>";
         html+="         </div>";
         html+="      </div>";
         html+="      <div class=\"submit_wrapper row\">";
         html+="         <input type=\"button\" name=\"cRepBtn\" id=\"cRepBtn\" value=\"신고\" style=\"color: white;\"/>";
         html+="      </div>";
         html+="   </div>";
         html+="</div>";
         
         $(".myarea").html(html);
         $("body").append(html2)
      }
   });
   
   $(document).on("click","input[name='A']" ,function() {//게시글 신고
	   $("input[name='A']").removeAttr("checked");
		$(this).prop("checked", true);
   });
   
   $(document).on("click","input[name='B']" ,function() {//댓글 신고
	   $("input[name='B']").removeAttr("checked");
		$(this).prop("checked", true);
   });
   
   $(document).on("click","#cRepBtn" ,function() {//게시글 신고 경고창
	  $("#rno").val($("input[name='A']:checked").val());
	  $("#wtMode").val(1);
      if(confirm("신고하시겠습니까?")) {         
         var params = $("#comentForm").serialize();
         console.log(params);
         $.ajax({
            type : "post",
            url : "reportAjax",
            dataType : "json",
            data : params,
            success : function(result) {
                  if(result.res == "SUCCESS") {
                     alert("신고되었습니다.");
                     location.reload();
                     
                  } else {
                     alert("error")                     
                  }
            }
         });
      }
   });
   
   $(document).on("click","#reportBtn" ,function() {//댓글 신고 버튼
	   $("#CommentName").val($(this).parent().parent().attr("name"));
	   $("#CommentNumber").val($(this).parent().parent().attr("id"));
	   $("#CommentCon").val($(this).attr("name"));
	   if($("#smemNo").val() ==null || $("#smemNo").val()==""){
		   alert("로그인 후 이용해주세요.");
		   } else {
			var html =""
			var html2=""
			html2+="<div class=\"bgbg\"></div>"
	         var cn =$("#CommentName").val()
	         var cno=$("#CommentNumber").val()
	         html+="<input type = \"hidden\" name = \"CommentName\" id = \"CommentName\">";
	         html+="<input type = \"hidden\" name = \"CommentNumber\" id = \"CommentNumber\">";
	         html+="<input type = \"hidden\" name = \"CommentCon\" id = \"CommentCon\">";
	         html+="<div id=\"popup\" class=\"report\">";
	         html+="   <div class=\"dimmed\"></div>";
	         html+="   <div class=\"popup_wrapper\">";
	         html+="      <div class=\"col col_1\">";
	         html+="         <div class=\"retitle\">신고</div>";
	         html+="      </div>";
	         html+="      <div class=\"col col_2\">";
	         html+="         <div class=\"close\">X</div>";
	         html+="      </div>";
	         html+="      <div class=\"row2\">";
	         html+="         <div class=\"report_body row\">";
	         html+="            <div class=\"reason_wrapper\">";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_1\" value=\"1\">";
	         html+="                  <span class=\"label_text\">영리목적/홍보성</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_2\" value=\"2\">";
	         html+="                  <span class=\"label_text\">불법정보</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_3\" value=\"3\">";
	         html+="                  <span class=\"label_text\">음란/선정성</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_4\" value=\"4\">";
	         html+="                  <span class=\"label_text\">욕설/인신공격</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_5\" value=\"5\">";
	         html+="                  <span class=\"label_text\">개인정보노출</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_6\" value=\"6\">";
	         html+="                  <span class=\"label_text\">같은 내용의 반복 게시(도배)</span>";
	         html+="               </label>";
	         html+="               <label class=\"rebox\">";
	         html+="                  <input type=\"radio\" name=\"B\" id=\"reason_7\" value=\"7\">";
	         html+="                  <span class=\"label_text\">기타</span>";
	         html+="               </label>";
	         html+="            </div>";
	         html+="         </div>";
	         html+="      </div>";
	         html+="      <div class=\"submit_wrapper row\" id=\""+cno+"\">";
	         html+="         <input type=\"button\" name=\""+cn+"\" id=\"commRepBtn\" value=\"신고\" style=\"color: white;\"/>";
	         html+="      </div>";
	         html+="   </div>";
	         html+="</div>";
	         
	         $(".myarea").html(html)
	         $("body").append(html2)
	      }
	   });
	   
	   
	   $(document).on("click","#commRepBtn" ,function() {//댓글 신고 경고창
		   
		   $("#CommentNumber").val($(this).parent().attr("id"));
		   $("#CommentName").val($(this).attr("name"));
		   
		   console.log($("#CommentName").val());
           console.log($("#CommentNumber").val());
		   $("#rno").val($("input[name='B']:checked").val());
		   $("#wtMode2").val(2);
		   
	      if(confirm("신고하시겠습니까?")) {
	    	
	         var params = $("#comentForm").serialize();
	         console.log(params)
	         $.ajax({
	            type : "post",
	            url : "reportCommentAjax",
	            dataType : "json",
	            data : params,
	            success : function(result) {
	                  if(result.res == "SUCCESS") {
	                     alert("신고되었습니다.");
	                     location.reload();
	                    
	                  } else {
	                     alert("error")
	                     console.log($("#CommentName").val());
	                     console.log($("#CommentNumber").val());
	                  }
	            }
	         });
	      }
	   });
   
   
  
   
   
   $(document).on("click","#deleteCommentBtn" ,function() {
      $("#CommentNo").val($(this).parent().parent().attr("id"));
      $("#ComentMemNo").val($(this).parent().attr("name"));
      if($("#smemNo").val() ==null || $("#smemNo").val()==""){
         alert("로그인 후 이용해주세요.");
         location.reload();
      } else {
         if(confirm("삭제하시겠습니까?")) {
            var params = $("#comentForm").serialize();
            
            $.ajax({
               type : "post",
               url : "deleteComment",
               dataType : "json",
               data : params,
               success : function(result) {
                  alert("삭제되었습니다.");
                  location.reload();
               }
            });
         }
      }
   });
   $(document).on("click","#updateCommentBtn" ,function() {
      $("#ComentMemNo").val($(this).parent().attr("name"));
      if($("#smemNo").val() ==null || $("#smemNo").val()==""){
         alert("로그인 후 이용해주세요.");
         location.reload();
      } else {
         $("#ComentNo").val($(this).parent().parent().attr("id"));
         $("#con").val($("div[name = 'com" + $(this).parent().parent().attr("id") + "']").html());
      }
   });
   
   
   $("#delBtn").on("click", function() {
      if (confirm("삭제하시겠습니까?")) {
         var params = $("#comentForm").serialize();

			$.ajax({
				type : "post",
				url : "deleteAjax",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						location.href = "community";
            		}
				}
			});
		}
	});
	
	$("#upBtn").on("click", function(){
		$("#comentForm").attr("action", "boardUpdate");
		$("#comentForm").submit();
	});
	$("#backBtn").on("click",function(){
		location.href = "community";
	});
	
	
});
 function comentarea(retext){
	
	var html =""
		
	for(var i=0; i <retext.length; i++){
		
		html+="<hr><div class=\"reples\" id =\""+retext[i].NO+"\"  name=\""+retext[i].NICKNAME+" \">";
		html+=""+retext[i].NICKNAME+"("+retext[i].WRITE_DT+")<div class = \"commenter\" name = \"" + retext[i].MEM_NO + "\">";
		if(retext[i].MEM_NO=="${sMemNo}") {
			html+= "<input type = \"button\" id = \"deleteCommentBtn\" value = \"삭제\" class = \"deleteCommentBtn\">&nbsp;";
			html+= "<input type = \"button\" id = \"updateCommentBtn\" value = \"수정\" class = \"updateCommentBtn\">&nbsp;";
		}
		html+="<input type = \"button\" value = \"신고\" class = \"reportBtn\" id=\"reportBtn\" name=\""+retext[i].CON+ "\"/>";
		html+="</div><br>";
		html+="<div class = \"commentCon\" id = \" CommentCon\" name = \"com" + retext[i].NO + "\">";
		html+=""+retext[i].CON+""
		html+="</div>";
		html+="</div>";
	}
	html+="<hr>";
	$(".replearea").html(html)
}
function comenton(){
	var params = $("#comentForm").serialize();

	$.ajax({
		type  : "post",
		url : "reple",
		dataType : "json",
		data : params,
		success: function(result){
			if(result.res == "SUCCESS"){
				comentarea(result.retext);
			} else {
				alert("불러오는데 실패");
				
			}
		}	  
	});
	}
$(window).load(function(){
	var new_conbar='${param.codename}';
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
	function Saerch(){
		$("#SaerchForm").submit();
	}
})
 function comshut(){//닫기
         $("#popup").remove();
         $("html .bgbg").remove();
     }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
</head>
<body>

	<!-- 좌측 메뉴 -->
	<div class="layout left">
	<c:import url="LeftMenu.jsp"/>
	</div>
	<!-- 우측 컨탠츠 -->
	<div class="layout right">
		<c:import url="Top.jsp"/>
		<div class="layout content">
			<div class = "title"><span id="board_topname"></span></div>
				<div class = "info">
					<div class = "titleInfo">제목 : ${detail.TITLE}</div>
					<div class = "writerInfo">작성자 : ${detail.NICK}</div>
					<div class = "dateInfo">작성일 : ${detail.WRITE_DT}</div>
					<div class = "hitInfo">조회수 : ${detail.HIT}</div>
				</div>
				<div class = "con">
					${detail.CON}
				</div>
				<div class = "BtnDiv">
					<c:if test="${!empty detail.CUL_NO}">
						<input type="button" id="Move_CULT" value="해당 문화 이동">
					</c:if>
				<input type = "button" id="backBtn" value="목록" class = "Btn">
				<c:if test="${!empty sMemNo}">
					<c:if test="${detail.MEM_NO eq sMemNo}"><!-- 로그인 일치하면 버튼 생성 -->
						<input type = "button" id="delBtn" value="삭제" class = "Btn">
						<input type = "button" id="upBtn" value="수정" class = "Btn">
					</c:if>
				</c:if>		
				<input type = "button" id="repBtn" value="신고" class = "Btn">				
				</div>
				<div class = "comment">
				<div style="width: 100%">
					댓글<br>
					<form action="#" method="post" id="commentForm">
					<input type="hidden" name="bno" id="C_BNo" value="${detail.NO}">
					<input type="hidden" name="no" id="smemNo" value="${sMemNo}">					
					<input type = "hidden" id="ComentNo" name="ComentNo"/>
					<input type = "hidden" id="ComentMemNo" name="ComentMemNo"/>
					<textarea name="con" id="con" class="textarea" placeholder="댓글을 입력하세요."></textarea>
					<input type = "button" value = "작성" id = "uploadBtn" class="uploadBtn"/>
					</form> 
				</div>
				</div>
				<div class = "replearea">
				</div>
			</div> 
		</div>
		<!-- 특수구역 -->
		<div class="history">
			<c:import url="History.jsp"/>
		</div>
	<!-- 하단 정보 -->
	<div class="bottom">
		<c:import url="Bottom.jsp"/>
	</div>
<form action="#" method="post" id="comentForm">
<input type = "hidden" name = "no" id = "no" value = "${param.no}">
<input type = "hidden" name="memno" id="smemNo" value="${sMemNo}">
<input type = "hidden" id="bno" name="bno" value="${detail.NO}"/>
<input type="hidden" name="no1" id="smemNo1" value="${detail.NO}">
<input type = "hidden" id="bnick" name="bnick" value="${detail.NICK}"/>
<input type = "hidden" id="title" name="title" value="${title}"/>
<input type = "hidden" id="CommentNo" name="CommentNo"/>
<input type = "hidden" id="CommentName" name="CommentName"/>
<input type = "hidden" id="CommentNumber" name="CommentNumber"/>
<input type = "hidden" id="CommentCon" name="CommentCon"/>
<input type = "hidden" id="wtMode" name="wtMode" value="1"/>
<input type = "hidden" id="wtMode2" name="wtMode2" value="2"/>
<input type = "hidden" id="rno" name="rno" value="1"/>
<input type = "hidden" id="reCon" name="reCon" value="${detail.CON}"/>
<input type = "hidden" id="cul_no" name="cultcode" value="${detail.CUL_NO}"/>
<div class="myarea"></div>
<input type = "hidden" id="codename" name="codename" value="${param.codename}"/>
</form>
</body>
</html>