<%@page import="net.bitacademy.java41.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업정보변경</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<jsp:include page="/sidebar.jsp"></jsp:include>

<div id="content">
<h1>작업정보변경</h1>
<form action="postupdate.do" method="post">
프로젝트번호:<input type="text" name="pno" value="${taskInfo.pno}" readonly><br>
*번호: <input type="text" name="tno" value="${taskInfo.tno}" readonly><br>
*작업명: <input type="text" name="title" value="${taskInfo.title}"><br>
*내용: <br>
<textarea name="content" rows="4" cols="50""></textarea><br>
시작일: <input type="text" name="startDate" value="${taskInfo.startDate}"><br>
종료일: <input type="text" name="endDate"value="${taskInfo.endDate}"><br>
UiProtoUrl: <input type="text" name="uiProtoUrl" value="${taskInfo.uiProtoUrl}"><br>
상태:
<c:choose>
<c:when test="${task.status == 0}">시작전</c:when>
<c:when test="${task.status == 1}">진행중</c:when>
<c:when test="${task.status == 2}">마감임박</c:when>
<c:otherwise>작업종료</c:otherwise>
</c:choose><br>

<input type="submit" value="변경">
<input type="reset" value="취소">
</form>
<p>
<a href="list.do?projectNo=${taskInfo.pno}">[목록]</a>
<a href="update.do?tno=${taskInfo.tno}">[변경]</a>
<a href="delete.do?tno=${taskInfo.tno}">[삭제]</a>
</p>
</div>

<jsp:include page="/tail.jsp"></jsp:include>

</body>
</html>









