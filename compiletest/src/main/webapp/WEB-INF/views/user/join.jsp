<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<link href="" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>   
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap');
body{
    font-family: 'Nanum Gothic Coding', monospace;
}
#user{
    height:900px;
    padding-top:200px;
    background-image:url(../../images/forest1.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}    
 #join-form{
    width:350px;
    margin:100px auto;
    border: 1px solid gray;
    border-radius: 10px;
    padding: 20px;
    background-color:white;
}
.button{
    width:100px;
    background-color: hsl(49, 97%, 48%);
    border:none;
    color:#fff;
    padding: 5px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;    
    
}
</style>
<script>


	var loadingWithMask = function LoadingWithMask(){
		
 		var widthWindow = window.innerWidth;
		var heightWindow = window.innerHeight;


		var mask = "<div id='mask' style='width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: none;opacity: 0.7;background-color: #fff;z-index: 99;text-align: center; '></div>";
		var loadingImg = '';
		
		loadingImg += "<div id='loadingImg'>";
		loadingImg += "<img src='${pageContext.request.contextPath}/assets/images/user/packman.gif' style='position: absolute; top: 50%; left: 50%;z-index: 100;'/>";
		loadingImg += "</div>";
		
		
		$('body').append(mask).append(loadingImg);		
	
		$('#mask').css({
			'width':widthWindow,
			'height':heightWindow,
			'opacity':'0.3'
		});
		
		$('#mask').show();
		
		
		$('#loadingImg').show();
		
	}
	
	var closeLoadingWithMask = function CloseLoadingWithMask(){
		$('#mask,#loadingImg').hide();
		$('#mask,#loadingImg').empty();
	} 
	

$(function(){
	
	
	
	var tempKey = null;
	

	$('#btn-auth').on('click',function(){
		
		var email = $('#email').val();
		
		loadingWithMask();
		$.ajax({
			url:'${pageContext.request.contextPath}/api/user/emailAuth',
			async:true,
			type:'get',
			dataType:'json',
			data:'email='+ email,
			success:function(response){
				
				alert('인증번호가 발송되었습니다.');
				console.log(response.data);//인증키
				tempKey = response.data;
				closeLoadingWithMask();
				
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
		
		
		//여기
		
		
		
		
	});
	
	$('#auth-check-button').on('click',function(){
		
		if( $('#auth-check').val() == tempKey  ){
			$('#img-checkauth').show();
			$('#btn-auth').hide();
			$('#auth-check-button').hide();
		}else{
			
			
			
			
			$('#img-checkauth').hide();
			$('#btn-auth').show();
			$('#auth-check-button').show();
			
			
		}
	});
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
	$("#join-form").submit(function(e){
			e.preventDefault();
	
			if($("#nickname").val() ==''){
				alert('닉네임이 비어있습니다.');
				$("#nickname").focus();
				return;
			}
			if($("#img-checknickname").is(":hidden")){
				alert('닉네임 중복 체크를 하지 않았습니다.');
				return;
			}		
			if($("#email").val() ==''){
				alert('이메일이 비어있습니다.');
				$("#email").focus();
				return;
			}
			if($("#img-checkemail").is(":hidden")){
				alert('닉네임 중복 체크를 하지 않았습니다.');
				return;
			}
			if($("#password").val() ==''){
				alert('비밀번호가 비어있습니다.');
				$("#password").focus();
				return;
			}		
			if($("#passwordcheck").val() ==''){
				alert('비밀번호확인이 비어있습니다.');
				$("#passwordcheck").focus();
				return;
			}	
			if( ($("#auth-check").val() =='') || (tempKey != $("#auth-check").val()) ){
				alert('인증번호가 일치하지 않습니다.');
				$("#auth-check").focus();
				return;
			}
			
			
			
			this.submit();
		});	
	
	$('#nickname').change(function(){
		$('#btn-checknickname').show();
		$('#img-checknickname').hide();
	});

	// 닉네임 중복확인
	// 중복확인 완료시 체크표시 출력해야함
	$('#btn-checknickname').click(function() {
		var nickname = $("#nickname").val();
		if(nickname == '') {
			return;
		}
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/api/user/nickname?nickname=" + nickname,
			async: true,
			type: 'get',
			data: '',
			dataType: 'json',
			success: function(response) {
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if(response.data == true){
									
					$("#nickname")
						.val('')
						.focus();
					return;
				}
				$('#btn-checknickname').hide();
				$('#img-checknickname').show();
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	

	
	//------------------------------------------------------------------------------------------------------------------------------------

	$('#email').change(function(){
		$('#btn-checkemail').show();
		$('#img-checkemail').hide();
		$('#auth').hide();
	});	
	
	// 중복확인 완료시 체크표시 출력해야함
	$('#btn-checkemail').click(function() {
		var email = $("#email").val();
		if(email == '') {
			return;
		}
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/api/user/checkemail?email=" + email,
			async: true,
			type: 'get',
			//contentType: 'application/json'
			data: '',
			dataType: 'json',
			success: function(response) {
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				
				if(response.data == true){
					alert('존재하는 닉네임입니다.');
					$("#email")
						.val('')
						.focus();
					return;
				}
				$('#btn-checkemail').hide();
				$('#img-checkemail').show();
				$('#auth').show();
				
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	
	
	$('#passwordcheck').blur(function(){
		if( $('#password').val() != $('#passwordcheck').val() ){
			$('#password-warning').show();
			$('#password-warning').text('입력하신 비밀번호와 같지 않습니다.');
            $('#password-warning').css('color', 'red');
			console.log("다름");
		}else{
			$('#password-warning').hide();
			console.log("맞음");
		}
	});
	$('#password').change(function(){
		if( $('#password').val() != $('#passwordcheck').val() ){
			$('#password-warning').show();
			$('#password-warning').text('입력하신 비밀번호와 같지 않습니다.');
            $('#password-warning').css('color', 'red');
			console.log("다름");
		}else{
			$('#password-warning').hide();
			console.log("맞음");
		}
	});	
	
		
	
	
	
	
	


	
	
});

   
</script>
</head>
<body>
    <div id="container">
        <c:import url="/WEB-INF/views/include/user-header.jsp" />        
        <div id="content">
            <div id="user">
                <form:form 
                	id="join-form" 
                	modelAttribute="userVo" 
                	method="post" 
                	action="${pageContext.servletContext.contextPath }/user/join">
                    <h1>회원가입</h1>
                    <div>
                        <label for="nickname">닉네임</label>
                        <!-- <input id="nickname" name="nickname" type="text" /> -->
                        <form:input path="nickname"/>
                        <input type="button" id="btn-checknickname" value="닉네임중복확인" /> 
                        <img id='img-checknickname' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
                        <p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <spring:hasBindErrors name="userVo">
                        	<c:if test='${errors.hasFieldErrors("nickname") }' ><br/>
                        		<spring:message
                        			code='${errors.getFieldError("nickname").codes[0] }'
                        		/>
                        	</c:if>
                        </spring:hasBindErrors>
                        </p>
                    </div>
                    <div>
                        <label for="email">이메일</label>
                        <!-- <input id="email" name="email" type="email" /> -->
                        <form:input path="email"/>
                        <input type="button" id="btn-checkemail" value="이메일중복확인" />
                        <img id='img-checkemail' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <%-- <spring:hasBindErrors name="userVo">
                        	<c:if test='${errors.hasFieldErrors("email") }' ><br/>
                        		<spring:message
                        			code='${errors.getFieldError("email").codes[0] }'
                        		/>
                        	</c:if>
                        </spring:hasBindErrors> --%>
                        <form:errors path="email"/>
                        </p>                        
                    </div>
                    <div>
                        <label for="password">비밀번호</label>
                        <!-- <input id="password" name="password" type="password" /> -->
                        <form:input path="password" type="password"/>
                    </div>
                    <div>
                        <label for="passwordcheck">비밀번호확인</label>
                        <input id="passwordcheck" name="passwordcheck" type="password" />
                        <div id="password-warning"></div>
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
<%--                         <spring:hasBindErrors name="userVo">
                        	<c:if test='${errors.hasFieldErrors("password") }' ><br/>
                        		<spring:message
                        			code='${errors.getFieldError("password").codes[0] }'
                        		/>
                        	</c:if>
                        </spring:hasBindErrors> --%>
                        <form:errors path="password"/>
                        </p>                        
                    </div>
                    <div id="auth" style='display:none'>
                        <label for="auth-check">인증 번호 입력 : </label>
                       
                        <input id="auth-check" type="text" name="Auth" />
                        <input id="btn-auth"  type="button" value="인증번호보내기">
                        <input id="auth-check-button" type="button" value="인증번호확인">
                        <img id='img-checkauth' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
                    </div>                    
                    <div>


                    	<a href="${pageContext.servletContext.contextPath }/"><input class="button" value="취소"></input></a>
                        <input type="submit" class="button" value="회원가입" >                        

                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>