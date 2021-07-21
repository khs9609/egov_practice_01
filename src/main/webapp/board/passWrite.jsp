<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호 입력 화면</title>
<script src="/myproject_new/script/jquery-1.12.4.js"></script>
<script src="/myproject_new/script/jquery-ui.js"></script>
</head>
<script>
$(function(){
	$("#delBtn").click(function(){
		
		var pass = $("#pass").val();
		pass = $.trim(pass);
		if(pass == ""){
			alert("암호를 입력해주세요");
			$("#pass").focus();
			return false;
		}
		
		
		var sendData = "unq=${unq}&pass="+pass; //json설정이라 한다.
		
		$.ajax({
			type : "POST",
			data : sendData, 
			url : "boardDelete.do", // 실제경로 , 저장주소
			dataType : "text", //리턴 타입
			success : function(result){ //성공했을 경우 // controller -> "ok","fail"
				if(result == "1") {
					alert("삭제완료");
					location = "boardList.do";
				} else if(result == "-1") {
					alert("암호가 일치하지 않습니다.");
				} else {
					alert("삭제실패 \n 관리자에게 문의하세요");				
				}
			},
			error : function() { // 실패했을 경우
				alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
			}
		});
		
		
	
	});
	
})
</script>
<body>

<table>
	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass"></td>
		<td><button type="submit" id="delBtn">삭제하기</button></td>
	</tr>
</table>

</body>
</html>