<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Join</title>
<link rel="stylesheet" href="../../../assets/css/main.css">
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

$(function(){
	
	var tempKey = null;
	
	$("#login-form").submit(function(e) {
		e.preventDefault();
		
		if($("#name").val() == '') {
			alert("이름이 비어있습니다.");
			$("#name").focus();
			return;
		}
		
		if($("#email").val() == '') {
			alert("이메일이 비어있습니다.");
			$("#email").focus();
			return;
		}
		
		if($("#password").val() == '') {
			alert("비밀번호가 비어있습니다.");
			$("#password").focus();
			return;
		}
		
		if($("passwordCheck").is(":hidden")) {
			alert("비밀번호 확인을 입력하지 않았습니다.");
			$("#email").focus();
			return;
		}
		
		if($("#auth-check").is(":checked") == false) {
			alert("악관 동의가 필요합니다");
			$("#agree-prov").focus();
			return;
		}
		
		this.submit();
	});	
	
	$('#auth').on('click',function(){
		
		var email = $('#email').val();
		
		
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
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	
	$('#auth-check-button').on('click',function(){
		
		if( $('#auth-check').val() == tempKey  ){
			alert('일치합니다');
		}else{
			//인증번호가 일치하지 않습니다.
			//가입이 안되도록 해야한다.
		}
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
					$("#nickname")
						.val('')
						.focus();
					return;
				}
				$('#btn-checknickname').hide();
				$('#img-checkemail').show();
			},
			error: function(XHR, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	
});

    function goMainPage(){
        location.reload("/");
    }
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
                <form id="login-form" method="post" action="${pageContext.servletContext.contextPath }/user/join">
                    <h1>회원가입</h1>
                    <div>
                        <label for="nickname">닉네임</label>
                        <input id="nickname" name="nickname" type="text" />
                        <input type="button" id="btn-checknickname" value="닉네임중복확인" />
                    </div>
                    <div>
                        <label for="email">이메일</label>
                        <input id="email" name="email" type="email" />
                        <input type="button" id="btn-checkemail" value="이메일중복확인" />
                    </div>
                    <div>
                        <label for="password">비밀번호</label>
                        <input id="password" name="password" type="password" />
                    </div>
                    <div>
                        <label for="passwordCheck">비밀번호확인</label>
                        <input id="passwordCheck" name="passwordCheck" type="password" />
                    </div>
                    <div>
                        <label for="auth">인증 번호 입력 : </label>
                        <input id="auth" type="button" value="인증번호보내기">
                        <input id="auth-check" type="text" name="Auth" />
                        <input id="auth-check-button" type="button" value="인증번호확인">
                    </div>                    
                    <div>
                    	<a href="${pageContext.servletContext.contextPath }/"><input class="button" value="취소"></input></a>
                        <input type="submit" class="button" value="회원가입" >                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>