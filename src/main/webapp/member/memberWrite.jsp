<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script>
  $( function() {
    $( "#birth" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
    
    $("#btn_zipcode").click(function(){
    	var w = 500;
    	var h = 200;
    	var url = "post1.do";
    	
    	window.open(url,"zipcode",'width='+w+",height="+h);
    	
    	
    });
    
    
    $("#btn_idcheck").click( function() {
    	
    	var userid = $.trim( $("#userid").val() ); // 현재 창에 입력된 창
    	
    	if(userid == ""){
    		alert("아이디를 입력해주세요");
			$("#userid").focus();	    		
    		return false;
    	}
    	
    	//idcheck.do로 이동
    	$.ajax({
    		type : "POST",
    		data : "userid="+userid, // 이렇게 작성되는 것을 json 타입이라 한다.
    		url : "idcheck.do", 
    		dataType : "text", 
    		
    		success : function(result){
    			if(result == "ok") {
    				alert("사용가능한 아이디입니다.");
    			} else {
    				alert("이미 사용중인 아이디입니다.");				
    			}
    		},
    		error : function() { 
    			alert("오류발생"); 
    		}
    	});
    	
    });
    
    $("#btn_submit").click(function() {
  	  var userid = $("#userid").val();
  	  var pass = $("#pass").val();
  	  var name = $("#name").val();
  	  userid = $.trim(userid);
  	  pass = $.trim(pass);
  	  name = $.trim(name);
  	  if(userid == "") {
  	  	alert("아이디를 입력해주세요");
  	  	$("#userid").focus();
  	  	return false;
  	  }
  	  if(pass == "") {
  	  	alert("패스워드를 입력해주세요");
  	  	$("#pass").focus();
  	  	return false;
  	  }
  	  if(name == "") {
  	  	alert("이름를 입력해주세요");
  	  	$("#name").focus();
  	  	return false;
  	  }
  	  $("#userid").val(userid);
  	  $("#pass").val(pass);
  	  $("#name").val(name);
/* ------------------------------------------ */
	var formData = $("#frm").serialize();
  	$.ajax({
		type : "POST",
		data : formData,
		url : "memberWriteSave.do", // 실제경로 , 저장주소
		dataType : "text", //리턴 타입
		
		success : function(result){ //성공했을 경우 // controller -> "ok","fail"
			if(result == "ok") {
				alert("가입완료");
				location= "loginWrite.do";
			} else {
				alert("가입실패 \n 관리자에게 문의해주세요");				
			}
		},
		error : function() { // 실패했을 경우
			alert("오류발생"); //여기서의 오류가 뜬다면 거의 시스템 오류일 것이다.(장애발생)
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
.input1 { width : 98% }
.textarea { width : 98%; height : 70px;}
.div_button { width:600px;text-align:center; }
.btn1 { background-color: #cccccc;color: black;border: 1px solid black;}
</style>

<body>
<%@ include file="../include/topmenu.jsp" %>

<form id="frm" name="frm">
<table>
	<caption>회원가입 폼</caption>
	<tr>
		<th><label for="id">아이디</label></th>
		<td>
		<input type="text" name="userid" id="userid" placeholder="아이디입력">
		<button type="button" class="btn1" id="btn_idcheck" >아이디 중복체크</button>
		</td>
	</tr>
	<tr>
		<th><label for="pass">패스워드</label></th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M">남
		<input type="radio" name="gender" id="gender" value="F">여
		</td>
	</tr>
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td><input type="text" name="birth" id="birth"></td>
	</tr>
	<tr>
		<th><label for="phone">연락처</label></th>
		<td><input type="text" name="phone" id="phone"> (예)010-1234-1234</td>
	</tr>
	<tr>
		<th><label for="addr">우편번호</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode">
		<button type="button" class="btn1" id="btn_zipcode">우편번호 검색</button>
		<br>
		<input type="text" name="address" id="address">
		</td>
	</tr>
</table>
<br>
<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>
</form>

</body>
</html>