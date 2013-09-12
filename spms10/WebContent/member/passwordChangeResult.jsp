<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Java 41 SPMS</title>
<meta http-equiv="Refresh" content="1;url=view.do?email=${param.email}">
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
<c:choose>
<c:when test="${status == 'NEW_PASSWORD_ERROR'}">신규 암호가 일치하지 않습니다.</c:when>
<c:when test="${status == 'OLD_PASSWORD_ERROR'}">이전 암호가 맞지 않습니다.</c:when>
<c:when test="${status == 'SUCCESS'}">암호가 변경되었습니다.</c:when>
<c:otherwise>손님</c:otherwise>
</c:choose><br>



	</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a></a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>





