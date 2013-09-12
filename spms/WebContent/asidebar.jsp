<%@page import="net.bitacademy.java41.vo.MemberProject"%>
<%@page import="net.bitacademy.java41.vo.Member"%>
<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    



<div id="left">
<div id="member">
<img id="memberPhoto" src="${rootPath}/images/test01.png">
<div id="memberInfo">
<p id="name">${member.name }</p>
<p id="tel">${member.tel }</p>
<p id="email">${member.email }</p>

</div>
  <div class="verticalmenu">
   <ul>
   
     <li><a href="${rootPath}/member/list">멤버관리</a></li>
     <li><a href="#">프로젝트관리</a></li>
     
   </ul>
  </div>
</div>
</div>

