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

var checkEmail = function CheckEmail(str) {
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;         
     } else {                       
         return true;         
     }                            
}   

var auth_str = '<div id="auth">' +  
					'<label for="auth-check"></label>' + 
					'<input id="auth-check" type="text" name="Auth" placeholder="인증번호를 입력해주세요."/>' + 
					'<input id="btn-auth"  type="button" value="인증번호보내기">' + 
					'<input id="auth-check-button" type="button" value="인증번호확인">' + 
					'<img id="img-checkauth" style="width:16px; display:none" src="${pageContext.request.contextPath }/assets/images/user/check.png" />' +  
                '</div>';

var auth_pandan = false;
                
$(function(){

	var tempKey = null;

	$('#btn-auth').on('click',function(){
		
		var email = $('#email').val();
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
	
	$('#auth-check-button').on('click',function(){
		
		if( $('#auth-check').val() == tempKey) {
			$('#img-checkauth').show();
			$('#btn-auth').hide();
			$('#auth-check-button').hide();
		} else {
			$('#img-checkauth').hide();
			$('#btn-auth').show();
			$('#auth-check-button').show();	
		}
	});
	
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
		$('#img-checknickname').hide();
	});
	
	$('#nickname').on("propertychange change keyup paste input", function() {
		var nickname = $("#nickname").val();
		if(nickname == '') {
			$('#img-checknickname').hide();
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
					$('#img-checknickname').hide();
					return;
				}
				$('#img-checknickname').show();
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
	});

	$('#email').change(function(){
		$('#img-checkemail').hide();
		$('#auth').remove();
		auth_pandan = false;
	});	
	
	$('#email').change(function() {
		var email = $("#email").val();
		if(!checkEmail(email)) {
			alert('이메일 형식이 잘못되었습니다');		
			$("#email").focus();
			return;
		} else {
			$('#img-checkemail').hide();
			$('#auth').remove();
			auth_pandan = false;
		
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
					if(response.data == true){
						alert('존재하는 이메일입니다.');
						$("#email")
							.val('')
							.focus();
						return;
					}
					$('#btn-checkemail').hide();
					$('#img-checkemail').show();
				},
				error: function(XHR, status, e) {
					console.error(status + ":" + e);
				}
			});
		}
	});
	
	$('#email').on("propertychange change keyup paste input", function() {
		$('#auth').remove();
		auth_pandan = false;
	});
	
	$('#passwordcheck').on("propertychange change keyup paste input", function(){
		
		if( $('#password').val() != $('#passwordcheck').val() ){
			$('#password-warning').show();
			$('#password-warning').text('입력하신 비밀번호와 같지 않습니다.');
            $('#password-warning').css('color', 'red');
            
            $('#join-form').css('height', '270px');
            
			$('#auth').remove();
			auth_pandan = false;			
            
			console.log(" passwordcheck 다름");
		} else {
			$('#password-warning').hide();
			if(auth_pandan == false) {
				$('.auth-before').after(auth_str);
				auth_pandan = true;
			}
			$('#join-form').css('height', '350px');
		}
	});
	
	$('#password').on("propertychange change keyup paste input", function(){
		if($('#passwordcheck').val() != '') {
			if( $('#password').val() == $('#passwordcheck').val() ){
				$('#password-warning').hide();
				if(auth_pandan == false) {
					$('.auth-before').after(auth_str);
					auth_pandan = true;
				}
				$('#join-form').css('height', '350px');
			} else {
				$('#auth').remove();
				auth_pandan = false;

				$('#password-warning').show();
				$('#password-warning').text('입력하신 비밀번호와 같지 않습니다.');
	            $('#password-warning').css('color', 'red');
	            
	            $('#join-form').css('height', '270px');
			}
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
                    <div>
                        <label for="nickname"></label>
                        <form:input id="nickname" path="nickname" placeholder=" 닉네임"/>
                        <img id='img-checknickname' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
                        <p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="nickname"/>
                        </p>
                    </div>
                    <div>
                        <label for="email"></label>
                        <form:input id="email" path="email" placeholder=" 이메일"/>
                        <img id='img-checkemail' style='width:16px; display:none' src='${pageContext.request.contextPath }/assets/images/user/check.png' />
						<p style="font-weight:bold; color:#f00;  text-align:left; padding-left:0">
                        <form:errors path="email" />
                        </p>
                    </div>
                    <div>
                        <label for="password"></label>
                        <form:input id="password" path="password" type="password" placeholder=" 비밀번호"/>
                    </div>
                    <div class="auth-before">
                        <label for="passwordcheck"></label>
                        <input id="passwordcheck" name="passwordcheck" type="password" placeholder=" 비밀번호 확인"/>
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
                        <a href="${pageContext.request.contextPath }/user/login"><input class="login-button" value="로그인"></a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>