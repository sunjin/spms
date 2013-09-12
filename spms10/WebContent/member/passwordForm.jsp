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
<h1>암호변경</h1>
<form action="passwordChange.do" method="post">
이메일: <input type="text" name="email" value="${param.email}" readonly><br>
이전 암호: <input type="password" name="password"><br>
새 암호: <input type="password" name="newPassword"><br>
새 암호 확인: <input type="password" name="newPassword2"><br>
<input type="submit" value="변경">

</form>
<p>
<a href="view.do?email=${param.email}">[이전]</a>
<a href="list.do">[목록]</a></p>



	</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a></a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>




