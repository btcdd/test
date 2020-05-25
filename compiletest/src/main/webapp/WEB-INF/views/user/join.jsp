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
<link href="${pageContext.servletContext.contextPath }/assets/css/include/user-header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/user/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>
var loadingWithMask = function LoadingWithMask(){
		
 	var widthWindow = window.innerWidth;
	var heightWindow = window.innerHeight;

	var mask = "<div id='mask' style='width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: none; opacity: 0.7;background-color: #fff;z-index: 99;text-align: center;'></div>";
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
	
	$("#login-form").submit(function(e){
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
				alert('이메일 중복 체크를 하지 않았습니다.');
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
			if( ($("#auth-check").val() =='') || (tempKey != $("#auth-check").val())) {
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
				if(response.result == "fail") {
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

	$('#email').change(function(){
		$('#btn-checkemail').show();
		$('#img-checkemail').hide();
		$('#auth').hide();
	});	
	
	$('#btn-checkemail').click(function() {
		var email = $("#email").val();
		if(email == '') {
			return;
		}
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/api/user/checkemail?email=" + email,
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
					alert('존재하는 닉네임입니다.');
					$("#email")
						.val('')
						.focus();
					return;
				}
				$('#btn-checkemail').hide();
				$('#img-checkemail').show();
				
				// 관우 코드
				
				$('#login-form').css('height', '330px');
				
				
				////////////
				
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
            
            // 관우 코드
            $('#login-form').css('height', '400px');
            /////////////////
            
			console.log("다름");
		} else{
			$('#password-warning').hide();
			// 관우 코드
			$('#login-form').css('height', '330px');
			///////////////////
			console.log("맞음");
		}
	});
	
	$('#password').change(function(){
		if( $('#password').val() != $('#passwordcheck').val() ){
			$('#password-warning').show();
			$('#password-warning').text('입력하신 비밀번호와 같지 않습니다.');
            $('#password-warning').css('color', 'red');
			console.log("다름");
		} else{
			
			$('#password-warning').hide();
			// 관우 코드
			$('#login-form').css('height', '330px');
			///////////////////
			
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
                	id="login-form" 
                	modelAttribute="userVo"
                	method="post"
                	action="${pageContext.servletContext.contextPath }/user/join">
                    <div>
                        <label for="nickname"></label>
                        <form:input id="nickname" path="nickname" placeholder="닉네임을 입력해주세요"/>
                        <input type="button" id="btn-checknickname" value="닉네임중복확인" /> 
                        <img id='img-checknickname' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
                        <p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="nickname"/>
                        </p>
                    </div>
                    <div>
                        <label for="email"></label>
                        <form:input id="email" path="email" placeholder="이메일을 입력해주세요"/>
                        <input type="button" id="btn-checkemail" value="이메일중복확인" />
                        <img id='img-checkemail' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="email" />
                        </p>
                    </div>
                    <div>
                        <label for="password"></label>
                        <form:input id="password" path="password" type="password" placeholder="비밀번호를 입력해주세요"/>
                    </div>
                    <div>
                        <label for="passwordcheck"></label>
                        <input id="passwordcheck" name="passwordcheck" type="password" placeholder="비밀번호를 다시 입력해주세요"/>
                        <div id="password-warning"></div>
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="password"/>
                        </p>                        
                    </div>
                    <div id="auth" style='display:none'>
                        <label for="auth-check"></label>
                        <input id="auth-check" type="text" name="Auth" placeholder="인증번호를 입력해주세요."/>
                        <input id="btn-auth"  type="button" value="인증번호보내기">
                        <input id="auth-check-button" type="button" value="인증번호확인">
                        <img id='img-checkauth' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
                    </div>                    
                    <div>
                    	<a href="${pageContext.servletContext.contextPath }/"><input class="cancel-button" value="취소"></input></a>
                        <input type="submit" class="join-button" value="가입" >                        
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>