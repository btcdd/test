<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
.footer{
    background-color: grey;
    font-size:2em;
    text-align: center;
}
</style>
<script>
    function join(frm){
        frm.action="//";
        frm.submit();
        return true;
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
                <form id="loginform" name="" method="post" action="#" >
                    <h1>로그인</h1>
                    <div>
                        <label for="email">이메일</label>
                        <input id="email" name="email" type="text">
                    </div>
                    <div>
                        <label for="password">패스워드</label>
                        <input id="password" name="password" type="password" value="">
                    </div>
                    
                    <div>
                        <input class="button" type="submit" value="로그인">
                        <button class="button" type="submit" value="회원가입" formaction="#">회원가입</button>
                    </div>
                    <div>
                        <a href="./find.html">비밀번호찾기</a>
                    </div>
                </form>
                
            </div>
        </div>

        
        <div class="footer">
            footer
        </div>    
    </div>
</body>
</html>