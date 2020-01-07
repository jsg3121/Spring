<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
   src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 기본 css 설정파일 -->
<link rel="stylesheet" href="./resources/css/baseCss.css" type="text/css">
<head>

<style type="text/css">
.m_table {
   width: 920px;
}
.b_list {
   width: 442px;
   height: 250px;
   border: 1px solid;
   font-size: 12pt;
   display: inline-block;
}
.b_list tr td {
   width: 444px;
}
.popup_wrapper {
	position: fixed;
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
.top_table>tbody>tr>td{
	border: 1px solid;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화정보</title>
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src ="resources/script/jquery/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	apisearch();
	
	$("#backBtn").on("click",function(){
		$("#actionForm").attr("action","C_Board");
		console.log($("#actionForm"));
		$("#actionForm").submit();
		
	})
	
	$("#move_Site").on("click",function(){
		window.open($("#SiteUrl").val(), '_blank');
	})
	$("#sendBtn").on("click", function() {
		if($.trim($("#CommentNo").val()) != ""){
			var params = $("#commentForm").serialize();
						
				$.ajax({
					type : "post",
					url : "changeComment",
					dataType : "json",
					data : params,
					success : function(result) {
						if(result.res == "SUCCESS") {
							alert("수정되었습니다");
							$("#commentForm").attr("action","cul_1");
							$("#commentForm").submit();
						} else {
							alert("수정되지 않았습니다");
						}
					}
				});
		} else {
			if($.trim($("#memNo").val()) != "") {
				if($.trim($("#comment").val()) != "") {
					var params = $("#commentForm").serialize();
					
					$.ajax({
						type : "post",
						url : "updateComment",
						dataType : "json",
						data : params,
						success : function(result) {
							if(result.res == "SUCCESS") {
								$("#commentForm").attr("action","cul_1");
								$("#commentForm").submit();
							} else {
								alert("작성실패");
							}
						}
					}); 
				} else {
					alert("댓글 내용을 작성하세요");
				}
			} else {
				alert("로그인 후 이용해 주세요");
			}
		}
	}); 
	
	$("#commentArea").on("click", "#repot", function() {
		$("#CommentNo").val($(this).parent().parent().attr("name"));
		$("#CommentName").val($(this).parent().attr("id"));
		$("#CommentNumber").val($(this).parent().attr("name"));
		$("#CommentCon").val($(this).parent().parent().attr("id"));
		console.log($("#CommentName").val());
		console.log($("#CommentNumber").val());
		console.log($("#CommentCon").val());
		
		if($("#memNo").val() ==null || $("#memNo").val()==""){
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
		         html+="         <div class=\"close\" onclick=\"culshut();\">X</div>";
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
		         html+="      <div class=\"submit_wrapper row\" id=\""+cno+"\" name=\""+cno+"\">";
		         html+="         <input type=\"button\" name=\""+cn+"\" id=\"commRepBtn\" value=\"신고\" style=\"color: white;\"/>";
		         html+="      </div>";
		         html+="   </div>";
		         html+="</div>";
		         
		         $(".myarea").css("display","block");
		         $(".myarea").html(html)
		         $("html").append(html2)
		      }
		/* var params = $("#commentForm").serialize();
		
		$.ajax({
			type : "post",
			url : "repotComment",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS") {
					alert("신고 완료");
					$("#commentForm").attr("action","cul_1");
					$("#commentForm").submit();
				} else {
					alert("신고실패");
				}
			}
		}); */
	});
	
	
	
	
	 $(document).on("click","#commRepBtn" ,function() {//댓글 신고 경고창
		   
		   $("#CommentName").val($(this).attr("id"));
		   $("#CommentNumber").val($(this).parent().attr("name"));
		   console.log($("#CommentNumber").val())
		   $("#rno").val($("input[name='B']:checked").val());
		   $("#wtMode2").val(2);
		   
	      if(confirm("신고하시겠습니까?")) {
	    	
	         var params = $("#commentForm").serialize();
	         console.log(params)
	         $.ajax({
	            type : "post",
	            url : "repotComment",
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
	 
	$("#commentArea").on("click", "#delete", function() {
		$("#CommentNo").val($(this).parent().parent().attr("name"));
		
		var params = $("#commentForm").serialize();
			
			$.ajax({
				type : "post",
				url : "deleteComment",
				dataType : "json",
				data : params,
				success : function(result) {
					if(result.res == "SUCCESS") {
						alert("삭제 완료");
						$("#commentForm").attr("action","cul_1");
						$("#commentForm").submit();
					} else {
						alert("삭제실패");
					}
				}
			});
	});
	
	$("#commentArea").on("click", "#update", function() {
		$("#CommentNo").val($(this).parent().parent().attr("name"));
		$("#comment").val($("td[name='com" + $(this).parent().parent().attr("name") + "']").html());
	});
	
	$("#ReviewBoard").on("click", "td", function() {
		$("#ReviewB").val($(this).parent().attr("name"));
		$("#no1").val($(this).parent().attr("name"));
		$("#commentForm").attr("action","CommuBoard");
		$("#commentForm").submit();
	});
	$(".b_list .api").on("click","tr",function(){
		$("#goblog").val($(this).attr("name"));
		var a = $("#goblog").val();
		window.open(a, '_blank');
		  
	});
	
	$("#ReviewBtn").on("click", function () {
		$("#ReviewB").val($(this).parent().attr("name"));
		$("#commentForm").attr("action","Review_Write");
		$("#commentForm").submit();
	});
	
	$("#SYMPATHYBtn").on("click",function(){
		if($("#memNo").val() ==null || $("#memNo").val()==""){
            alert("로그인 후 이용해주세요.");
         }else{
        	 
         
		var params = $("#commentForm").serialize();
		
		$.ajax({
			type : "post",
			url : "SYMPATHYhit",
			dataType : "json",
			data : params,
			success : function(result) {
				if(result.res == "SUCCESS") {
					location.reload();
				}
				if(result.res == "SUCCESS2") {
					alert("이미 공감을 하셨습니다.");
				}
				if(result.res == "ERROR") {
					alert("페이지에 오류가있습니다. 새로고침을 해주세요.");
				}
			}
		});
         }
	});

});


function apisearch(){
	var params = $("#commentForm").serialize();
	
	$.ajax({
		type : "post",
		url : "apiajax",
		dataType : "json",
		data : params,
		success : function(result) {
		reloadapi(result.items);
		}
	});
}
function reloadapi(items){
	var html=""
	
	for(var i=0; i<5; i++){
	html+="<tr name=\""+items[i].link+"\">"	
	html +="<a><td>제목:"+items[i].title+"</td></a>"
	html+="</tr>"	
	}
	$(".b_list .api").html(html);
}
function culshut(){//닫기
    var html=""
    html +="";

    $(".myarea").css("display", "none");
    $(".myarea").html(html)
    $("html .bgbg").hide();
 }
</script>
</head>
<body>
   <!-- 좌측 메뉴 -->
   <div class="layout left">
      <c:import url="LeftMenu.jsp" />
   </div>
  
   <!-- 우측 컨탠츠 -->
   <div class="right">
      <c:import url="Top.jsp" />
      <!-- 컨탠츠 -->
      <form action = "#" method = "post" id = "actionForm">
    	<input type = "hidden" name = "cultcode" value = "${sCULTCODE}">
    	<input type = "hidden" name = "page" value = "${param.page}">
    	<input type = "hidden" name = "searchGbn" value = "${param.searchGbn}">
    	<input type = "hidden" name = "startDate" value = "${param.startDate}">
    	<input type = "hidden" name = "endDate" value = "${param.endDate}">
      </form>
      <div class="layout content">
         <h1>문화</h1>
         <table class="m_table">
            <tr>
               <td style="text-align: right;">
                  <div>
                     <input type="button" value="공감" id = "SYMPATHYBtn">
                     <input type="button" value="목록" id = "backBtn">
                     <c:if test="${!empty sMemNo}">
	                     <input type="button" value="후기 작성" id = "ReviewBtn" >
                     </c:if>
                  </div>
               </td>
            </tr>
            <tr>
               <td>
              	 <form action = "#" id = "commentForm" method = "post">
              	 <input type = "hidden" name = "cultcode" value = "${sCULTCODE}">
              	 <input type = "hidden" name = "memNo" value = "${sMemNo}" id = "memNo">
              	 <input type = "hidden" name = "CommentNo" id = "CommentNo">
              	 <input type = "hidden" name = "no" id = "ReviewB">
              	 <input type="hidden" id="no1" name="no1" />
              	 <input type = "hidden" name = "text1"id="text1" value = "${CulInfo.TITLE}">
              	 <input type = "hidden" name = "goblog"id="goblog">
              	 <input type = "hidden" name = "codename" value="1">
              	 <input type = "hidden" id="CommentName" name="CommentName"/>
				 <input type = "hidden" id="CommentNumber" name="CommentNumber"/>
				 <input type = "hidden" id="CommentCon" name="CommentCon"/>
				 <input type = "hidden" id="rno" name="rno" value="1"/>
				 <input type = "hidden" id="wtMode2" name="wtMode2" value="2"/>
                  <div>
                     <!-- 게시글 내용 -->
                     <div>
                    	 <input type = "hidden" value = "${CulInfo.CULTCODE}" name = "cultNO">
                        <table class="top_table" cellspacing="0px">
                           <tr>
                              <td rowspan="3" style="width: 200px; height: 250px;border-right: 0px"><img src="${CulInfo.MAIN_IMG}" style="width: 200px; height: 250px"></td>
                              <td style="border-right: 0px;border-bottom: 0px;">&nbsp;&nbsp;&nbsp; ${CulInfo.TITLE}</td>
                              <td style="width: 100px;border-left: 0px;border-bottom: 0px;">공감 : ${CulInfo.SYMPATHY}</td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width: 692px;border-bottom: 0px;">&nbsp;&nbsp;전화번호 : ${CulInfo.INQUIRY}</td>
                           </tr>
                           <tr>
                              <td colspan="2" style="width: 695px">&nbsp;&nbsp;장르 : ${CulInfo.CODENAME}</td>
                           </tr>
                        </table>
                        <div style="text-align: center; display: inline-block;border: 1px solid;">
                        	<img src="${CulInfo.MAIN_IMG }" height="850px" width="900px;"><br>
                        	<table style="margin: 0px auto;">
                        		<tr>
                        			<td>
                        				가격
                        			</td>
                        			<td>
                        				${CulInfo.USE_FEE}
                        			</td>
                        			<td>
                        				지역 
                        			</td>
                        			<td>
	                        			${CulInfo.GCODE}
                        			</td>
                        		</tr>
                        		<tr>
                        			<td>
                        				장소
                        			</td>
                        			<td>
                        				${CulInfo.PLACE}
                        			</td>
                        			<td>
                        				시간
                        			</td>
                        			<td>
                        				${CulInfo.TIME}
                        			</td>
                        		</tr>
                        	</table>
                           	<div style="width: 100%">
                           		<input type="button" id="move_Site" value="사이트 이동">
                           		<input type="hidden" id="SiteUrl" value="${CulInfo.ORG_LINK }">
                           </div>

                           <hr>

                           <!-- 블로그 후기 -->
                           <table class="b_list">
                              <tr>
                                 <th>블로그 후기</th>
                              </tr>
                              <tr>
                                 <td style="height: 215px" class="api"></td>
                              </tr>
                           </table>
                           <!-- 게시판 후기 -->
                           <table class="b_list">
                           	<thead>
                              <tr>
                                 <th style = "width: 100%;">게시판 후기</th>
                              </tr>
                             </thead>
                             <tbody style = "width: 100%; height: 100%" id = "ReviewBoard">
                              	<c:forEach var = "Review" items = "${Review}">
	                              <tr style = "width: 100%; height: 70px;" name = "${Review.NO}">
                              		<td> 
	                              		<div style="width: 100%">제목 : ${Review.BTITLE}</div>
	                              		<div style="width: 380px;text-align: right;font-size: 10pt;">작성자 : ${Review.NICK}</div>
                              		</td>
	                              </tr>
                              	</c:forEach>
                             </tbody>
                           </table>
                        </div>
                     </div>
                  </div> <!-- 덧글 --> <br>
                  <div>
                     <br> <br>
                     
                     <table id="commentArea">
                        <tr>
                           <td colspan="4"><hr> 댓글</td>
                        </tr>
                        <tr>
                           <td width="900px" height="50px" colspan="4">
                           <input type="text" name="comment" id="comment"
                             	  style="height: 100%; width: 780px"> 
                              <input type="button" value="등록" style="height: 100%; width: 100px" id = "sendBtn"></td>
                        </tr>
                        <!-- 입력된 덧글 구역 -->
                        <c:forEach var = "Comment" items = "${Comment}">
	                        <tr>
	                           <td colspan="4" style = "border: 0px;"><hr></td>
	                        </tr>
	                        <tr name="${Comment.COMMENT_NO}" id = "${Comment.CON}">
	                           <td>닉네임 : ${Comment.NICKNAME} 작성일 : ${Comment.WRITE_DT}</td>
	                           <td width="60px" style="text-align: right;" name = "${Comment.COMMENT_NO}" id = "${Comment.NICKNAME}">
	                           		<input type="button" value="신고" id = repot>
	                           </td>
	                           <c:if test = "${sMemNo eq Comment.NO}">
		                           <td width="60px" style="text-align: right;"><input type="button" value="수정" id = update></td>
		                           <td width="60px" style="text-align: right;"><input type="button" value="삭제" id = delete></td>
	                           </c:if>
	                        </tr>
	                        <tr>
	                           <td colspan="4" style="height: 50px;" name="com${Comment.COMMENT_NO}">${Comment.CON}</td>
	                        </tr>
                        </c:forEach>
                     </table>
                     <hr>
                  </div>
               </form>
               </td>
            </tr>
         </table> 
      </div>
                  <div class = "myarea"></div>

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