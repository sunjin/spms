<%@page import="net.bitacademy.java41.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로젝트정보변경</title>
<link rel="stylesheet" href="${rootPath}/css/base.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<jsp:include page="/sidebar.jsp"></jsp:include>

<div id="content">
<h1>프로젝트정보변경</h1>
<form action="postupdate.do" method="post">
*번호: <input type="text" name="no" value="${projectInfo.no}" readonly><br>
*프로젝트명: <input type="text" name="title" value="${projectInfo.title}"><br>
*내용: <br>
<textarea name="content" rows="4" cols="50"></textarea><br>
시작일: <input type="text" name="startDate" value="${projectInfo.startDate}"><br>
종료일: <input type="text" name="endDate"value="${projectInfo.endDate}"><br>
태그: <input type="text" name="tag" value="${projectInfo.tag}"><br>

<input type="submit" value="변경">
<input type="reset" value="취소">
</form>
<p>
<a href="list.do">[목록]</a>
<a href="update.do?no=${projectInfo.no}">[변경]</a>
<a href="delete.do?no=${projectInfo.no}">[삭제]</a>
</p>
</div>

<jsp:include page="/tail.jsp"></jsp:include>

</body>
</html>









