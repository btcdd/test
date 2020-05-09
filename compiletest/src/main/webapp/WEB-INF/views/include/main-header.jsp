<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="header">
	<div class="head">
		<div class="container-left clearfix">
			<div class="logo clearfix">
				<img
					src="https://user-images.githubusercontent.com/59616862/80387335-7fb8e980-88e3-11ea-99ac-2c643a77a40c.png"
					alt="CodeForest">
			</div>
			<div class="menu clearfix">
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/codetree">Code Tree</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/codingtest">Coding Test</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/training">Training</a></div>
			</div>
			<div class="menu-user clearfix">
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/user/login">로그인</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/user/join">회원가입</a></div>
				<div class="menu-item"><a href="${pageContext.servletContext.contextPath }/mypage/mypage">마이페이지</a></div>
			</div>
		</div>
	</div>
</div>