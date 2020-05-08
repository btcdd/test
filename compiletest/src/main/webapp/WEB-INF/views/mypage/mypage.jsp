<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Code Forest</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/mypage/mypage.css">
</head>

<body>
	<c:import url="/WEB-INF/views/include/mypage-header.jsp" />
    <div class="container">
        <div class="">
            <div class="ranking">
                <h4>랭킹 1위</h4>
            </div>
            <div>
                <div class="correct">
                    <h3>맞은 사람</h3>
                </div>
                <div class="correct-answer">
                    <span><a href="">1019</a></span>
                    <span><a href="">669</a></span>
                </div>
            </div>
            <br>
            <div>
                <div class="wrong">
                    <h3>틀린 사람</h3>
                </div>
                <div class="wrong-answer">
                    <span><a href="">10192</a></span>
                    <span><a href="">66229</a></span>
                </div>
            </div>
        </div>
    </div>

</body>

</html>