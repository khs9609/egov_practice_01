<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 출력</title>
</head>
<style>
body { font-size : 9pt;}
button { font-size:9pt;padding : 3px;width : 100px; background-color : black;border-radius: 5px;
border : none;color : white;}
table{ width : 600px; border-collapse: collapse; }
th, td { border: 1px solid black; padding : 5px;}
th { background-color : lightblue;}
table caption { font-size : 15pt; margin-bottom : 5px; }
</style>
<body>

<table>
	<caption>
	<div>일반게시판 목록</div>
	<div>Total : ${total }</div>
	</caption>
	<tr>
		<th width="15%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	
	<c:set var="rownum" value="1" />
	<c:forEach var="result" items="${resultList }">
	
	<tr align="center">
		<td>${ rownum }</td>
		<td>${result.title }</td>
		<td>${result.name }</td>
		<td>${result.rdate }</td>
		<td>${result.hits }</td>
	</tr>
	
	<c:set var="rownum" value="${rownum + 1}" />
	</c:forEach>
	
</table>

	<div style="width:600px;margin-top:5px;text-align : center;">
		<c:forEach var="i" begin="1" end="${totalPage }">
		<a href="boardList.do?viewPage=${i }"> ${i }  </a>
		</c:forEach>
	
	</div>
	<div style="width:600px;margin-top:5px;text-align : right;">
		<button type="button" onclick=" location='boardWrite.do' ">글쓰기</button>
	</div>


</body>
</html>




