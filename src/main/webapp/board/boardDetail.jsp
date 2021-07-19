<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 함수를 사용하기 위한 jstl -->
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 흔치 않은 경우에 쓰임 . // JSTL은 \n을 지원하지 않기 때문에 아래처럼 해준다. -->
<% pageContext.setAttribute("newline", "\n"); %> 
<c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>') }" />




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>

<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>

</head>
<style>
body { font-size : 9pt;}
button { font-size:8pt;padding : 3px;width : 70px; background-color : black;border-radius: 5px;
border : none;color : white;}
table{ width : 600px; border-collapse: collapse; }
th, td { border: 1px solid black; padding : 5px;}
th { background-color : lightblue;}
table caption { font-size : 15pt; margin-bottom : 5px; }
.input1 { width : 98% }
</style>
<script>
/* 	$(function(){
		$("#title").val("제목입력");
		
	}); */
	
	function fn_submit() {
	
	if( $.trim($("#title").val()) == "" ) {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
 	$("#title").val( $.trim($("#title").val()) ); //공백제거
	
	if( $.trim($("#pass").val()) == "" ){
		alert("암호를 입력해주세요");
		$("#pass").focus();
		return false;
	}
	$("#pass").val( $.trim($("#pass").val()) );  // 공백제거

	var formData = $("#frm").serialize();
	// 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
	$.ajax({
		type : "POST",
		data : formData,
		url : "boardWriteSave.do", // 실제경로 , 저장주소
		dataType : "text", //리턴 타입
		success : function(data){ //성공했을 경우 // controller -> "ok","fail"
			if(data == "ok") {
				alert("저장완료");
				location : "boardList.do";
			} else {
				alert("저장실패");				
			}
		},
		error : function() { // 실패했을 경우
			alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
		}
	});
	
}
</script>

<body>
<br>
<form id="frm" name="frm">
<table>
	<caption><b>게시판 상세화면</b></caption>
	<tr>
		<th width="20%">제목</th>
		<td width="80%">${boardVO.title }</td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td>${boardVO.name }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td height="50"> <!-- aaa \n -> <br> -->
		${boardVO.content }
		</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td>${boardVO.rdate }</td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="button" onclick=" location='boardList.do' ">목록</button>
		<button type="button" onclick=" location='boardModifyWrite.do?unq=${boardVO.unq}' ">수정</button>
		<button type="button" onclick=" location='passWrite.do?unq=${boardVO.unq}' ">삭제</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>