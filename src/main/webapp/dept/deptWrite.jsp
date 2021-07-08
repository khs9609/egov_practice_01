<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- JSTL 수업 : 변수 생성과 사용 -->
<c:set var="a" value="test" />
a : ${a} <br>

<c:set var="kor" value="90" />
<c:set var="eng" value="80" />
<c:set var="hap" value="${kor + eng }" />

국어점수 : ${kor } <br>
영어점수 : ${eng } <br>
합계 : ${kor + eng} <br>
곱하기 : ${kor * eng } <br>
합계2 : ${hap } <br>

<!-- 문자열 관련 함수 -->
<c:set var="str" value="javascript" />
문자열 길이 : ${fn:length(str) } <br>
치환 테스트 : ${fn:replace(str,"java","oracle") } <br>
범위 설정 : ${ fn:substring(str,0,4) } <br>

<!-- JSTL은 수학관련함수가 존재하지 않아서 만들어서 사용 -->
<br>--- 수학관련 함수 -- <br>
<!-- floor : 내림함수, -->
<c:set var="foo" value="3.3" />
foo 변수값 : <c:out value="${foo }" /> <br>
floor함수적용(3.3) :  ${foo-(foo%1) } <br>
ceil함수(3.3) : ${foo+(1-(foo%1) ) } <br>
round함수적용(3.3) : ${ foo + 0.5 - ((foo+0.5)%1  ) } <br>
round함수적용2(3.7) : ${ (foo+0.4) + 0.5 - (( (foo+0.4)+0.5)%1)  } <br>

<!-- 제어문 -->
<br> -- if(제어문) -- <br>
<c:set var="kor" value="85" />
<c:if var="result" test="${kor >= 90}" >
	A학점 : ${result} <br>
</c:if>
<c:if var="result" test="${kor < 90 && kor >= 80}" >
	B학점 : ${result} <br>
</c:if>
<c:if var="result" test="${kor < 80 && kor >= 70}" >
	C학점  : ${result} <br>
</c:if>
<c:if var="result" test="${kor < 70 && kor >= 60}" >
	D학점 <br>
</c:if>
<c:if var="result" test="${kor < 60}" >
	F학점 <br>
</c:if>

<c:set var="title" value="java" />
<c:if test="${title == 'java' }" >
	title은 java와 같다 <br>
</c:if>
<c:if test="${title != 'java' }" >
	title은 java같지 않다. <br>
</c:if>

<!-- 반복문 for -->
<br> -- 반복문 (for) -- <br>
<c:forEach var="i" begin="1" end="10">
${i }
</c:forEach> 
<br>
2씩 증가 : 
<c:forEach var="i" begin="0" end="10" step="2">
${i }
</c:forEach> 






<br>
<br>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DEPT Write</title>
</head>
<style>
table{ width : 400px; border-collapse: collapse; }
th, td { border: 1px solid #cccccc; padding : 5px; }
</style>

<body>

<form name="frm" method="post" action="deptWriteSave.do">
<table>
	<tr>
		<th>부서번호</th> 
		<td><input type="text" name="deptno"></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc"></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit">저장</button>
		</th>
	</tr>
</table>
</form>

</body>
</html>