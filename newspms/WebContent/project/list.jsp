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
<h1>프로젝트</h1>
<table>
<tr>
	<th>번호</th>
	<th>프로젝트</th>
	<th>시작</th>
	<th>종료</th>
</tr>
<%-- Expression Language
. ServletContext, HttpSession, ServletRequest 등으로부터 데이터를 좀 더 쉽게 꺼내고,
. VO 객체의 getXXX() 메서드 호출을 좀 더 쉽게 하기 위해 등장한 문법.
. ${applicationScope.xxxx}  <== ServletContext.getAttribute("xxxx");
. ${sessionScope.xxxx}  <== HttpSession.getAttribute("xxxx");
. ${requestScope.xxxx}  <== ServletRequest.getAttribute("xxxx");
. ${pageScope.xxxx}  <== PageContext.getAttribute("xxxx");
. ${xxxx}  <== PageContext > ServletRequest > HttpSession > ServletContext 
. 
 --%>
<c:forEach var="project" items="${list}">
<tr>
	<td>${project.no}</td>
	<td><a href="view?no=${project.no}">${project.title}</a></td>
	<td>${project.startDate}</td>
	<td>${project.endDate}</td>
</tr>	
</c:forEach>
</table>

<p><a href="${rootPath}/project/add">[신규 프로젝트]</a></p>

		</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>










