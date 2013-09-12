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
 		<c:choose>
 		<c:when test="${member.level == 1  }">
 		<jsp:include page="/asidebar.jsp"></jsp:include></c:when>
 		<c:when test="${member.level == 0  }">
 		<jsp:include page="/sidebar.jsp"></jsp:include></c:when>
		</c:choose>
   		<div id="content"><h2>멤버목록</h2><br><br>
		
<table>
<tr>
	<th>이메일</th>
	<th>이름</th>
	<th>전화번호</th>
	
</tr>


<c:forEach var="member" items="${memlist}">
<tr>
	<td><a href="view?email=${member.email}">${member.email}</a></td>
	<td>${member.name}</td>
	<td>${member.tel}</td>
</tr>	
</c:forEach>
</table>
<p align="center"><a href="${rootPath}/member/add">[추가]</a></p>
 


		</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a></a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>