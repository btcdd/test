<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="../../../assets/css/main.css">
<link href="${pageContext.servletContext.contextPath }/assets/css/include/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/user/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<script>
 
</script>
</head>
<body>
	<div id="container">
        <c:import url="/WEB-INF/views/include/user-header.jsp" />   
        <div id="content">
            <div id="user">
                <form id="login-form" name="" method="post" action="${pageContext.servletContext.contextPath }/user/auth" >
                    <h1>로그인</h1>
                    <div>
                        <label for="email">이메일</label>
                        <input id="email" name="email" type="text" value="${userVo.email }">
                    </div>
                    <div>
                        <label for="password">패스워드</label>
                        <input id="password" name="password" type="password" value="">
                    </div>
                    <c:if test="${not empty userVo }">
						<p>
							로그인이 실패 했습니다.
						</p>
					</c:if>
                    <div>
                        <input class="button" type="submit" value="로그인">
	                    <a href="${pageContext.servletContext.contextPath }/user/join"><input class="button" value="회원가입" /></a>
                    </div>
                    <div>
                        <a href="${pageContext.servletContext.contextPath }/user/find">비밀번호찾기</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="footer">
            footer
        </div>    
    </div>
</body>
</html>
