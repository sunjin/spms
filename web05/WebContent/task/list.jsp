<%@page import="net.bitacademy.java41.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업 목록</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<jsp:include page="/sidebar.jsp"></jsp:include>

<div id="content">
<h1>태스크  목록</h1>
<table>
<tr>
	<th>번호</th>
	<th>태스크</th>
	<th>시작</th>
	<th>종료</th>
</tr>
<c:forEach var="task" items="${lists}">
<tr>
	<td>${task.tno}</td>
	<td><a href="view.do?tno=${task.tno}">${task.title}</a></td>
	<td>${task.startDate}</td>
	<td>${task.endDate}</td>
</tr>	
</c:forEach>
</table>

<p><a href="${rootPath}/task/addForm.do?pno=${param.projectNo}">[신규 작업]</a></p>

</div>

<jsp:include page="/tail.jsp"></jsp:include>

</body>
</html>









