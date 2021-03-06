<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 화면</title>

<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>

</head>
<style>
body { font-size : 9pt;}
button { font-size:9pt;padding : 3px;width : 100px; background-color : black;border-radius: 5px;
border : none;color : white;}
table{ width : 600px; border-collapse: collapse; }
th, td { border: 1px solid black; padding : 5px;}
th { background-color : lightblue;}
table caption { font-size : 15pt; margin-bottom : 5px; }
.input1 { width : 98% }
.textarea { width : 98%; height : 70px;}
</style>
<script>
/* 	$(function(){
		$("#title").val("제목입력");
		
	}); */
	
	function fn_submit() {
	
	// if(document.frm.title.value == "")
	// $("#title").val() == "";
	
	// $.trim("  aabbcc  ") -->  $.trim($("#title").val()) == ""
	
 	$("#title").val( $.trim($("#title").val()) ); //공백제거
 	
	if( $.trim($("#title").val()) == "" ) {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	
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
		url : "boardModifySave.do", // 실제경로 , 저장주소
		dataType : "text", //리턴 타입
		
		success : function(result){ //성공했을 경우 // controller -> "ok","fail"
			if(result == "1") {
				alert("저장완료");
				location= "boardList.do";
			} else if( result == "-1") {
				alert("패스워드가 일치하지 않습니다.");
			} else {
				alert("관리자에게 연락주세요. \n 저장실패");				
			}
		},
		error : function() { // 실패했을 경우
			alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
		}
	});
	
	/* 	if(document.frm.title.value == ""){
	alert("제목을 입력해주세요");
	document.frm.title.focus();
	return false;
}
if(document.frm.pass.value == ""){
	alert("암호을 입력해주세요");
	document.frm.pass.focus();
	return false;
} */
/* f.submit(); --- 동기전송방식 */

//전에는 이렇게 썻지만 이번에는j-query를 이용해보려한다.
//trim() -> 앞 뒤 공백제거

}
</script>
<body>
<br>
<form id="frm" name="frm">

	<input type="hidden" name="unq" value="${boardVO.unq }">

<table>
	<caption><b>게시판 수정화면</b></caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1" value="${boardVO.title }"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="name" id="name" value="${boardVO.name }"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content" class="textarea" >${boardVO.content }</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit" onclick="fn_submit();return false;">저장</button>
		<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>