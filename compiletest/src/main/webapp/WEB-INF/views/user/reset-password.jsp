<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset</title>
<link href="" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/include/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/user/reset-password.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>
$(function(){
	
	$("#login-form").submit(function(e){
		e.preventDefault();
		if( $('#password').val() == ''  || $('#passwordcheck').val() == ''){
			alert('비밀번호를 입력하세요');
			return;
		}
		if( $('#password').val() != $('#passwordcheck').val() ){
			alert('비밀번호가 다릅니다');
			console.log("다름");
			return;
		}
		this.submit();
	});
		
	
});

</script>
</head>
<body>
    <div id="container">
        <c:import url="/WEB-INF/views/include/user-header.jsp" />           
        <div id="content">
            <div id="user">
                <form id="login-form" method="post" action="${pageContext.servletContext.contextPath }/user/change">
                	<input type="hidden" name="email" value="${email}" />
                	<input type="hidden" name="nickname" value="${nickname}" />
                    <h1>비밀번호 재설정</h1>
                    <div>
                        <label for="password">새로운 비밀번호 입력 : </label>
                        <input id="password" name="password" type="password">
                    </div>
                    <div>
                        <label for="passwordcheck">새로운 비밀번호 확인 : </label>
                        <input id="passwordcheck" name="passwordcheck" type="password">
                    </div>
                        <p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <spring:hasBindErrors name="userVo">
                        	<c:if test='${errors.hasFieldErrors("password") }' ><br/>
                        		<spring:message
                        			code='${errors.getFieldError("password").codes[0] }'
                        		/>
                        	</c:if>
                        </spring:hasBindErrors>
                        </p>                    
                    <div>
                        <input type="submit" value="비밀번호 재설정완료" />          
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>