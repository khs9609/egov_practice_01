<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
<script>
	$(function() {
		$("#btn_submit").click(function(){
			var userid = $.trim($("#userid").val());
			var pass = $.trim($("#pass").val());
			
			if(userid == ""){
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;
			}
			if(pass == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}
			
		  	$.ajax({
				type : "POST",
				data : "userid="+userid+"&pass="+pass, // json전송타입
				url : "loginWriteSub.do",
				dataType : "text", 
				success : function(result){ 
					if(result == "ok") {
						alert(userid+"님 로그인되었습니다.")
						location= "boardList.do";
					} else {
						alert("아이디와 패스워드를 다시 확인해주세요.");				
					}
				},
				error : function() { 
					alert("오류발생!"); 
				}
			});
		});
	});
</script>
</head>

<style>
body { font-size : 9pt;}
a { text-decoration: none; color : black; }
button { font-size:9pt;padding : 3px;width : 100px; background-color : black;border-radius: 5px;
border : none;color : white;}
table{ width : 600px; border-collapse: collapse; }
th, td { border: 1px solid black; padding : 5px; line-height:2.0;}
th { background-color : lightblue;}
table caption { font-size : 15pt; margin : 5px; }
</style>
<body>
<%@ include file="../include/topmenu.jsp" %>
<form>
<table name="frm">
	<caption>로그인</caption>
	<tr>
		<th><label for="id">아이디</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="아이디입력">
		</td>
	</tr>
	<tr>
		<th><label for="pass">패스워드</label></th>
		<td><input type="password" name="pass" id="pass" placeholder="패스워드압력"></td>
	</tr>
</table>
<br>
<div class="div_button">
	<button type="button" id="btn_submit">로그인</button>
</div>

</form>
</body>
</html>