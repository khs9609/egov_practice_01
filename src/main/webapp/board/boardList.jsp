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
.wrap { margin : 0 auto; width : 800px; height : 1200px;}
body { font-size : 9pt;}
a { text-decoration: none; color : black; }
button { font-size:9pt;padding : 3px;width : 100px; background-color : black;border-radius: 5px;
		border : none;color : white;}
table{ width : 600px; border-collapse: collapse; }
th, td { border: 1px solid black; padding : 5px;}
th { background-color : lightblue;}
table caption { font-size : 15pt; margin-bottom : 5px; }
.div1 {width : 600px;text-align : center;font-size : 15pt; }
.div2 { width:600px;text-align : left; font-size : 8pt;  }
</style>
<body>
<%@ include file="../include/topmenu.jsp" %>
<br>
<table>
<div class="div1">일반게시판 목록</div>
<div class="div2">Total : ${total }개</div>
<div class="div2" style="margin-bottom : 5px;">
	<form name="searchFrm" method : "post" action ="boardList.do">
		<select name="searchGubun" id="searchGubun">
			<option value="title">제목</option>
			<option value="name">글쓴이</option>
			<option value="content">내용</option>
		</select>
		<input type="text" id="searchText" name="searchText">
		<button type="submit" style="width : 50px;">검색</button>
	</form>
</div>
	<tr>
		<th width="15%">번호</th>
		<th width="40%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	
	<c:set var="cnt" value="${rowNumber }" />
	
	<c:forEach var="result" items="${resultList }">
	
	<tr align="center">
		<td>${ cnt }</td>
		<td align="left">
		<a href="boardDetail.do?unq=${result.unq }"> ${result.title } </a>
		</td>
		<td>${result.name }</td>
		<td>${result.rdate }</td>
		<td>${result.hits }</td>
	</tr>
	
	<c:set var="cnt" value="${cnt - 1}" />
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




