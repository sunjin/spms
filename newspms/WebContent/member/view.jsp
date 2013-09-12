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
<h1>멤버 정보</h1>
이메일: ${member.email}<br>
이름: ${member.name }<br>
전화: ${member.tel }<br> 
블로그: ${member.blog }<br>
상세주소: ${member.detailAddress }<br>
태그: ${member.tag }<br>
등록일: ${member.regDate }<br>
권한:
<c:choose>
<c:when test="${memberInfo.level == 0}">일반회원</c:when>
<c:when test="${memberInfo.level == 1}">관리자</c:when>
<c:when test="${memberInfo.level == 2}">PM</c:when>
<c:otherwise>손님</c:otherwise>
</c:choose><br>

<p>
<a href="list">[목록]</a>
<c:if test="${member.level==1}"><a href="passwordChange?email=${memberInfo.email}">[암호변경]</a></c:if>
<c:if test="${member.level==1}"><a href="update?no=${project.no}">[변경]</a></c:if>
<c:if test="${member.level==1}"><a href="delete?no=${project.no}">[삭제]</a></c:if>

</p>

		</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>

















