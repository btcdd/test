<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>compiletest</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/main-out.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.39.0/codemirror.min.css'>
<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.39.0/codemirror.min.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.39.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
   var save = false;
   $(".codeTest").submit(function(event) {
      event.preventDefault();
      var lang = $("select option:selected").val();
      console.log(lang);
      var code = $("#code").val();
      if($("#code").val() == ""){
         alert("코드가 비었당");
         document.getElementById("code").focus();
         return;
      }
      if(save == false) {
         alert("저장을 안 했당");
         return;
      }
      $.ajax({
         url: '${pageContext.request.contextPath }/compile/' + lang,
         async: true,
         type: 'post',
         dataType: 'json',
         data: {code:code},
         success: function(response){
            if(response.result != "success") {
               console.error(response.message);
               return;
            }
            if(response.data[1] != "") {
               console.log("data[1]\n" + response.data[1]);
               $("#result").val(response.data[1]);
            } else {
               console.log("data[0]\n" + response.data[0]);
               $('#result').val(response.data[0]);
            }
         
         },
         error: function(xhr, status, e) {
            console.error(status + ":" + e);
         }
      });
   });
   
   $(document).on('click', '#save', function(event) {
      event.preventDefault();
      
      var lang = $("select option:selected").val();
      var code = $("#code").val();
      if(lang == 'none'){
         alert("언어선택!!!!!!!!!!!!");
      }
      if($("#code").val() == ""){
         alert("코드가 비었당");
         document.getElementById("code").focus();
         return;
      }
      $.ajax({
         url: '${pageContext.request.contextPath }/compile/' + lang + '/save',
         async: true,
         type: 'post',
         dataType: 'json',
         data: {code:code},
         success: function(response){
            if(response.result != "success") {
               console.error(response.message);
               return;
            }
            save = true;
         },
         error: function(xhr, status, e) {
            console.error(status + ":" + e);
         }
      });
   });
   
   $(document).on('click', '#compile', function(event) {
      event.preventDefault();
      
      var lang = $("select option:selected").val();
      var code = $("#code").val();
      if(lang == 'none'){
         alert("언어선택!!!!!!!!!!!!");
      }
      if($("#code").val() == ""){
         alert("코드가 비었당");
         document.getElementById("code").focus();
         return;
      }
      $.ajax({
         url: '${pageContext.request.contextPath }/compile/' + lang + '/compile',
         async: true,
         type: 'post',
         dataType: 'json',
         data: {code:code},
         success: function(response){
            if(response.result != "success") {
               console.error(response.message);
               return;
            }
            console.log(response.data);
         },
         error: function(xhr, status, e) {
            console.error(status + ":" + e);
         }
      });
   });
});
</script>
</head>
<body>
	<div class="head-image">
		<div class="user">
			<ul>
				<li><a href="${pageContext.servletContext.contextPath }/user/login">로그인</a></li>
				<li><a href="${pageContext.servletContext.contextPath }/user/join">회원가입</a></li>
			</ul>
		</div>
		<div class="navigator">
			<nav>
				<ul>
					<li class="menu"><a href="${pageContext.servletContext.contextPath }/codetree">Code Tree</a></li>
					<li class="menu"><a href="${pageContext.servletContext.contextPath }/codingtest">Coding Test</a></li>
					<li class="title"><a>Code Forest</a></li>
					<li class="menu"><a href="${pageContext.servletContext.contextPath }/challenge">Challenge</a></li>
					<li class="menu"><a href="${pageContext.servletContext.contextPath }/training">Training</a></li>
				</ul>
			</nav>
		</div>
		<div class="intro">
			<p>온라인에서</p>
			<p>쉽고 간단하게</p>
			<p>코딩을 시작해보세요</p>
		</div>
		<button class="join-btn">Get Started</button>
	</div>
</body>
</html>