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
 #loginform{
    width:350px;
    margin:100px auto;
    border: 1px solid gray;
    border-radius: 10px;
    padding: 20px;
    background-color:white;
}
</style>
<script>
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
                <form id="loginform" method="post" action="${pageContext.servletContext.contextPath }/user/join">
                    <h1>회원가입</h1>
                    <div>
                        <label for="nickname">닉네임</label>
                        <input id="nickname" name="nickname" type="text" />
                        <input type="button" id="btn-checkNickname" value="닉네임중복확인" />
                    </div>
                    <div>
                        <label for="email">이메일</label>
                        <input id="email" name="email" type="email" />
                        <input type="button" id="btn-checkEmail" value="이메일중복확인" />
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
                        <input type="button" value="취소" onclick="goMainPage();">
                        <input type="submit" value="가입">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>