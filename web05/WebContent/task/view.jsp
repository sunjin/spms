<%@page import="net.bitacademy.java41.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업 정보</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<jsp:include page="/sidebar.jsp"></jsp:include>

<div id="content">
<h1>작업 정보</h1>
번호: ${task.tno}<br>
작업명: ${task.title }<br>
내용:<br> 
${task.content }<br>
시작일: ${task.startDate }<br>
종료일: ${task.endDate }<br>
작업UiProtoURL: ${task.uiProtoUrl}<br>
상태:
<c:choose>
<c:when test="${task.status == 0}">시작전</c:when>
<c:when test="${task.status == 1}">진행중</c:when>
<c:when test="${task.status == 2}">마감임박</c:when>
<c:otherwise>작업종료</c:otherwise>
</c:choose><br>

<p>
<a href="list.do?projectNo=${task.pno}">[목록]</a>
<a href="update.do?tno=${task.tno}&projectNo=${task.pno}">[변경]</a>
<a href="delete.do?tno=${task.tno}&projectNo=${task.pno}">[삭제]</a>
</p>
</div>

<jsp:include page="/tail.jsp"></jsp:include>

</body>
</html>









