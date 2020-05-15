<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="header">
	<div class="head">
		<div class="container-left clearfix">
			<div class="logo">
				<a href="${pageContext.servletContext.contextPath }/main-in">Code Forest</a>
			</div>
			<div class="menu clearfix">
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/codetree">Code Tree</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/challenge">Programming Challenge</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/training">Coding Training</a></div>
			</div>			
			<div class="menu-user clearfix">
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/mypage/mypage">마이페이지</a></div>
				<div class="menu-item"><a href="${pageContext.request.contextPath }/user/logout">로그아웃</a></div>
			</div>
		</div>
	</div>
</div>