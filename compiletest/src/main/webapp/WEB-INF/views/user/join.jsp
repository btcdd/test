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
<title>Code Forest</title>
<link href="" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/include/user-header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/user/join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>

var loadingWithMask = function LoadingWithMask(){
		
 	var widthWindow = window.innerWidth;
	var heightWindow = window.innerHeight;

	var mask = "<div id='mask' style='width: 100%;height: 100%;top: 0px;left: 0px;position: fixed;display: none; opacity: 0.9; background-color: #fff; z-index: 99;text-align: center;'></div>";
	var loadingImg = '';
		
	loadingImg += "<div id='loadingImg'>";
	loadingImg += "<img src='${pageContext.request.contextPath}/assets/images/user/spin.svg' style='position: absolute; top: 43%; left: 45%;z-index: 100;'/>";
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

var auth_str = '<div id="auth">' +  
					'<label for="auth-check"></label>' + 
					'<input id="auth-check" type="text" name="Auth" placeholder="인증번호 입력"/>' + 
					'<input id="btn-auth"  type="button" value="인증번호 보내기">' +
					'<img id="img-checkauth" style="width:16px; display:none" src="${pageContext.request.contextPath }/assets/images/user/check.png" />' +  
                '</div>';

var auth_pandan = false;
             
var checkEmail = function CheckEmail(str) {
    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!reg_email.test(str)) {                            
    	return false;         
    } else {               
        return true;         
    }                            
} 

var checkPasswordPattern = function CheckPasswordPattern(str) {
	var pw = str;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		 
	if(pw.length < 8 || pw.length > 20){
		console.log("8자리 ~ 20자리 이내로 입력해주세요.");
// 		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		return false;
	}
	 
	if(pw.search(/₩s/) != -1){
		console.log("비밀번호는 공백업이 입력해주세요.");
// 		alert("비밀번호는 공백업이 입력해주세요.");
		return false;
	}
	 
	if(num < 0 || eng < 0 || spe < 0 ){
		console.log("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
// 		alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		return false;
	}
	console.log('true:' + str);
	return true;
}

$(function(){

	var tempKey = null;
	
	$('#email').focusout(function() {
		$('.error-email-pattern').hide();
	});
	
	$(document).on("click", "#btn-auth", function() {
		var email = $('#email').val();
		console.log("id : " + $(this).attr('id'));
		$(this).attr('id','btn-auth-check');
		$(this).val('인증번호 확인');
		loadingWithMask();
		
		$.ajax({
			url:'${pageContext.request.contextPath}/api/user/emailAuth',
			async:true,
			type:'post',
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
	
	$(document).on("click", "#btn-auth-check", function() {
		if( $('#auth-check').val() == tempKey) {
			$("#auth-check").attr("disabled", true);
		} else {
			$("#auth-check").attr("disabled", false);
		}
	});
	
	$("#join-form").submit(function(e){
			e.preventDefault();

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
		$('#img-checknickname').hide();
	});
	
	$('#nickname').on("propertychange change keyup paste input", function() {
		var nickname = $("#nickname").val();
		if(nickname == '') {
			$('#nickname').css('background-image', 'none');
			return;
		}
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/api/user/nickname?nickname=" + nickname,
			async: true,
			type: 'post',
			data: '',
			dataType: 'json',
			success: function(response) {
				if(response.result == "fail") {
					console.error(response.message);
					return;
				}	
				if(response.data == true){					
					$('#nickname').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/cross.png")');
					$('#nickname').css('background-position', '275px');
					$('#nickname').css('background-repeat', 'no-repeat');
				} else {
					$('#nickname').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/check.png")');
					$('#nickname').css('background-position', '275px');
					$('#nickname').css('background-repeat', 'no-repeat');
				}
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	
	$('#email').on("propertychange change keyup paste input", function() {
		var email = $("#email").val();
		$('#auth').remove();
		auth_pandan = false;
		
		if(!checkEmail($("#email").val())){
			$('.error-email-pattern').show();
			$('#email').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/cross.png")');
			$('#email').css('background-position', '275px');
			$('#email').css('background-repeat', 'no-repeat');
			$("#email").focus();
		} else {
			$('.error-email-pattern').hide();
		}
		if(email == '') {
			$('.error-email-pattern').hide();
			$('#email').css('background-image', 'none');
			$("#email").focus();
		}
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/api/user/checkemail?email=" + email,
			async: true,
			type: 'post',
			data: '',
			dataType: 'json',
			success: function(response) {
				if(response.result == "fail"){
					console.error(response.message);
					return;
				}
				if(checkEmail($("#email").val())){
					if(response.data == true){
						$('#email').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/cross.png")');
						$('#email').css('background-position', '275px');
						$('#email').css('background-repeat', 'no-repeat');
						$("#email").focus();
					}  else {
						$('#email').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/check.png")');
						$('#email').css('background-position', '275px');
						$('#email').css('background-repeat', 'no-repeat');
					}
				}
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
		
	});
	
	$('#password').on("propertychange change keyup paste input", function(){
		var password = $('#password').val();
		
		if($('#password').val().length == 0) {
			console.log('들어오낭');
			$('.error-password-pattern').hide();
			$('#password').css('background-image', 'none');
			$('#password-warning').hide();
		} else {
			if(checkPasswordPattern(password) == false) {
				$('.error-password-pattern').show();
				$('#password').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/cross.png")');
				$('#password').css('background-position', '275px');
				$('#password').css('background-repeat', 'no-repeat');
			}
			
			if(checkPasswordPattern(password) == true) {
				$('.error-password-pattern').hide();
				$('#password').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/check.png")');
				$('#password').css('background-position', '275px');
				$('#password').css('background-repeat', 'no-repeat');
			}
			if( $('#password').val() == $('#passwordcheck').val() ){
				$('#password-warning').hide();
				if(auth_pandan == false) {
					$('.auth-before').after(auth_str);
					console.log($('#btn-auth') + "dddd");
					auth_pandan = true;
				}
				$('#join-form').css('height', '385px');
			} else {
				$('#auth').remove();
				auth_pandan = false;

				$('#password-warning').show();
				$('#password-warning').text('비밀번호가 일치하지 않습니다.');
	            $('#password-warning').css('color', '#BF0000');
	            
	            $('#join-form').css('height', '335px');
			}
		}
	});
	
	$('#passwordcheck').on("propertychange change keyup paste input", function(){
		if($('#passwordcheck').val() == '') {
			$('#password-warning').hide();
			$('#passwordcheck').css('background-image', 'none');
			$("#passwordcheck").focus();
		}
		
		if( $('#password').val() != $('#passwordcheck').val() ){
			$('#passwordcheck').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/cross.png")');
			$('#passwordcheck').css('background-position', '275px');
			$('#passwordcheck').css('background-repeat', 'no-repeat');
			$("#passwordcheck").focus();
			
			$('#password-warning').show();
			$('#password-warning').text('비밀번호가 일치하지 않습니다.');
            $('#password-warning').css('color', '#BF0000');
            
            $('#join-form').css('height', '335px');
            
			$('#auth').remove();
			auth_pandan = false;
		} else {
			$('#passwordcheck').css('background-image', 'url("${pageContext.request.contextPath }/assets/images/user/check.png")');
			$('#passwordcheck').css('background-position', '275px');
			$('#passwordcheck').css('background-repeat', 'no-repeat');
			$('#password-warning').hide();
			if(auth_pandan == false) {
				$('.auth-before').after(auth_str);
				console.log($('#btn-auth') + "dddd");
				auth_pandan = true;
			}
			$('#join-form').css('height', '385px');
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
                    <div class="nickname">
                        <label for="nickname"></label>
                        <form:input id="nickname" path="nickname" placeholder="닉네임"/>
                        <p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="nickname"/>
                        </p>
                    </div>
                   	<div class="error-email-pattern" style="display:none">
                   		이메일 형식에 맞지 않습니다
                   	</div>
                    <div class="email">
                        <label for="email"></label>
                        <form:input id="email" path="email" placeholder="이메일" />
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="email" />
                        </p>
                    </div>
                    <div class="error-password-pattern" style="display:none">
                   		8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.
                   	</div>
                    <div>
                        <label for="password"></label>
                        <form:input id="password" path="password" type="password" placeholder="비밀번호"/>
                    </div>
                    <div class="auth-before">
                        <label for="passwordcheck"></label>
                        <input id="passwordcheck" name="passwordcheck" type="password" placeholder="비밀번호 확인"/>
                        <div id="password-warning"></div>
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="password"/>
                        </p>                        
                    </div>
                    <div>
                    	<a href="${pageContext.servletContext.contextPath }/"><input class="cancel-button" value="취소"></input></a>
                        <input type="submit" class="join-button" value="가입" >
                    </div>
                    <hr />
                    <div>
                        <a href="${pageContext.request.contextPath }/user/login"><input class="login-button" value="로그인" readonly></a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>