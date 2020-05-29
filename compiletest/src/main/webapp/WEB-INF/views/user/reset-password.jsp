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
<title>Code Forest</title>
<link href="" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/include/user-header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/user/reset-password.css" rel="stylesheet" type="text/css">
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
                    <div>
                        <label for="password"></label>
                        <input id="password" name="password" type="password" placeholder="새로운 비밀번호를 입력해주세요.">
                    </div>
                    <div>
                        <label for="passwordcheck"></label>
                        <input id="passwordcheck" name="passwordcheck" type="password" placeholder="새로운 비밀번호를 다시 입력해주세요.">
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
                        <input id="complete" type="submit" value="설정 완료" />          
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>