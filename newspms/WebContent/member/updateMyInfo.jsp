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
<h1>멤버 변경2</h1>
<form action="updateMyInfo" method="post">
*이메일: <input type="text" name="email"  value="${member.email}"  readonly placeholder="${memberInfo.email}"><br>
*암호: <input type="password" name="password" ><a href="passwordChange?email=${member.email} ">[암호변경]</a><br>
<input type="hidden" name="serverpwd" value="${member.password}">
*이름: <input type="text" name="name" value="${member.name}"><br>
*전화: <input type="text" name="tel" value="${member.tel}"><br>
블로그: <input type="text" name="blog" value="${member.blog}"><br>
우편번호: <input type="text" name="postno">
		<input type="button" value="우편번호찾기"><br>
기본주소: <input type="text" name="basicAddr" ><br>
상세주소: <input type="text" name="detailAddr" value="${member.detailAddress}"><br>
태그: <input type="text" name="tag" value="${member.tag}"><br>
권한: <c:choose>
<c:when test="${memberInfo.level == 0}">일반회원</c:when>
<c:when test="${memberInfo.level == 1}">관리자</c:when>
<c:when test="${memberInfo.level == 2}">PM</c:when>
<c:when test="${memberInfo.level == 9}">손님</c:when>
</c:choose><br>

<input type="submit" value="등록">
<input type="reset" value="취소">
</form>
<p>
<a href="list">[목록]</a>
<a href="passwordChange?email=${memberInfo.email}">[암호변경]</a>
<c:if test="${memberInfo.level==1}"><a href="update?no=${project.no}">[변경]</a></c:if>
<c:if test="${memberInfo.level==1}"><a href="delete?no=${project.no}">[삭제]</a></c:if>
</p>

		</div><!-- end content -->
		</div><!-- end inner -->
	</div><!-- end outer -->
 	<div id="footer"><h1>&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.kr/" >구글형아</a></a>
 	</h1>
 	</div>
</div><!-- end container -->
</body></html>











