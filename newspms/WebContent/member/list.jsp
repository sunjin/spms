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
<h1>멤버</h1>
<table>
<tr>
	<th>이메일</th>
	<th>이름</th>
	<th>전화</th>
	<th>블로그</th>
</tr>
<c:forEach var="member" items="${list}">
<tr>
	<td>${member.email}</td>
	<td><a href="view?email=${member.email}">${member.name}</a></td>
	<td>${member.tel}</td>
	<td>${member.blog}</td>
</tr>	
</c:forEach>
</table>

<p><a href="${rootPath}/member/add">[새멤버]</a></p>

		</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>









