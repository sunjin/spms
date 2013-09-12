<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Java 41 SPMS</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="author" content="fatma.hassan@gmail.com" />
<meta name="description" content="FTM" />


<link rel="stylesheet" href="${rootPath}/maincss/touching.css" type="text/css" />
</head>
<body>
 <!-- Generated at www.csscreator.com -->
<div id="container">
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div id="outer">
 		<div id="inner">
 	
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
<a href="passwordChange.do?email=${memberInfo.email}">[암호변경]</a>
<a href="update.do?email=${memberInfo.email}">[변경]</a>
<a href="delete.do?email=${memberInfo.email}">[삭제]</a>
</p>

	</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a></a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>





