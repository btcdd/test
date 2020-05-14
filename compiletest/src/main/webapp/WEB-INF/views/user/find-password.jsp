<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Find</title>
<link href="" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<style>
body{
    font-family: serif;
}
#user{
    height:900px;
    padding-top:200px;
    background-image:url(../../images/forest1.jpg);
    background-repeat: no-repeat;
    background-size: cover;
}    
 #login-form{
    width:350px;
    margin:100px auto;
    border: 1px solid gray;
    border-radius: 10px;
    padding: 20px;
    background-color:white;
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
		if(email == ''){
			alert('이메일을 입력하세요.');
			$("#email").focus();
			return;
		}
		
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
		if( ($('#auth-check').val() == tempKey) && ($('#auth-check').val() != "") ){			
			console.log("인증번호 맞았음");
			$('#login-form').submit();
		}else{
			alert('인증번호 다시 확인해주세요.');
		}
	});	
	
});
</script>
</head>
<body>
    <div id="container">
        <div class="header">
            <div class="head">
                <div class="container-left clearfix">
                    <div class="logo">
                        <img src="https://user-images.githubusercontent.com/59616862/80387335-7fb8e980-88e3-11ea-99ac-2c643a77a40c.png" alt="CodeForest">
                    </div>
                    <div class="menu clearfix">
                        <div class="menu-item">Code Tree</div>
                        <div class="menu-item">Coding Test</div>
                        <div class="menu-item">Coding Training</div> 
                    </div>
                </div>
            </div>
        </div>        
        <div id="content">
            <div id="user">
                <form id="login-form" method="post" action="${pageContext.servletContext.contextPath }/user/reset">
                    <h1>비밀번호 찾기</h1>
                    <div>
                        <label for="email">이메일 입력 : </label>
                        <input id="email" name="email" type="email" />
                    </div>
                    <div id="auth" >
                    	<label for="auth-check">인증 번호 입력</label>
                    	<input id="auth-check" type="text" name="Auth"/>
                    	<input id="btn-auth" type="button" value="인증번호 전송" />
                        <input id="auth-check-button" type="button" value="인증번호확인">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>

