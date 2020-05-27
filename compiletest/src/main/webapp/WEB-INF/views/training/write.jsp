<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/problem-write.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/sample.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<title>Code Forest</title>
<script>

var index = 1;

var str;

var buttonStr;

var problemAdd = function() {
	
	str = '<div class="prob' + index + '" class="tabcontent"><div class="sub-title">' + 
				'<h3>문제 ' + (index+1) + '</h3>' + 
				'문제 제목<input type="text" name="subProblemList[' + index + '].title"/>' +
			    '</div>' +
			    '<div class="prob-content">' + 
			        '<div class="prob-content-title">내용</div>' + 
			        '<textarea id="prob-content-text" name="subProblemList[' + index + '].contents"></textarea>' + 
			    '</div>' + 
			'<div class="ex-input">' + 
	            '<div class="ex-input-title">예제 입력</div>' + 
	            '<textarea id="ex-input-text" name="subProblemList[' + index + '].examInput"></textarea>' + 
	        '</div>' + 
	        '<div class="ex-output">' + 
	            '<div class="ex-input-title">예제 출력</div>' + 
	            '<textarea id="ex-output-text" name="subProblemList[' + index + '].examOutput"></textarea>' + 
	        '</div>' + 
	        '<div class="answer-code' + index + '">' + 
	            '<div class="ex-input-title">정답 코드</div>' + 
				'<div>' + 
					'<select name="lang">' + 
						'<option value="none" selected="selected">언어선택</option>' + 
						'<option value="c">C</option>' + 
						'<option value="cpp">C++</option>' + 
						'<option value="cs">C#</option>' + 
						'<option value="java">JAVA</option>' + 
						'<option value="js">JavaScript</option>' + 
						'<option value="py">Python</option>' + 
		             '</select>' + 
	             '</div>' + 
	            '<textarea id="answer-code-text" name="subProblemList[' + index + '].correctCode"></textarea>' + 
	        '</div></div>';
	
	// var buttonStr = '<button class="tablinks" id="' + index + '" onclick="openCity(event, ' + "'prob" + index + "')" + '">문제 ' + index + '</button>';
	buttonStr = '<li id="' + index + '" class="tablinks"><span class="a">문제 ' + (index + 1) + '</span></li>';
}

$(function() {
	$('#addSubProblem').click(function() {
		event.preventDefault();
		
		problemAdd();
		
		$("#" + (index-1)).after(buttonStr);
		$(".prob" + (index-1)).after(str);
		$('.prob' + (index-1)).hide();
		
		index++;
	});
	
	$(document).on("click", ".tablinks", function() {
		event.preventDefault();
		
		$('.tabcontent').children().hide();
		
		problemAdd();
		
		var ind = $(this).attr('id');
		
		$('.prob' + (ind)).show();
	});
	
});


</script>
</head>
<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
	    <form method="post" action="${pageContext.servletContext.contextPath }/training/write">
		    <div class="regist">
		        <div class="privateAndPassword">
		            <div class="private">코딩테스트 <input type="checkbox"></div>
		            <div class="password">비밀번호 <input type="password"></div>
		        </div>
		        <div class="date">
		            <div class="start-date">시작일자 <input type="datetime-local"></div>
		            <div class="end-date">마감일자 <input type="datetime-local"></div>
		        </div>
		
		        <div class="divisionAndLanguage">
		            <div class="division">분류 
		                <select name="kindNo">
		                    <option value="1" selected="selected">기타</option>
		                    <option value="2">기업</option>
		                    <option value="3">개인</option>
		                    <option value="4">학원</option>
		                    <option value="5">학교</option>
		                </select>
		            </div>
		        </div>
		        <br />
		        <div class="title">
		        	문제집 제목<input type="text" name="title" />
		        </div>
		        <br />
		        
		<div class="tab">
			<ul>
				<li id="0" class="tablinks"><span class="a">문제 1</span></li>
				<li><a id="addSubProblem"><span class="addProblem">+</span></a></li>
			</ul>
<!-- 		<button class="tablinks" id="1" onclick="openCity(event, 'prob1')">문제 1</button> -->
<!-- 		<a id="addSubProblem" class="tablinks" onclick=><button class="tablinks" onclick="problemAdd()">+</button></a> -->
	</div>
	
	<div id="problem" class="tabcontent">
		<div class="prob0">
			<h3>문제 1</h3>
	        <div class="sub-title">
	        	문제 제목<input type="text" name="subProblemList[0].title"/>
	        </div>
	        <div class="prob-content">
	            <div class="prob-content-title">내용</div>
	            <textarea class="ckeditor" id="prob-content-text" name="subProblemList[0].contents"></textarea>
	            <textarea class="ckeditor" id="editor" name="subProblemList[0].contents"></textarea>
<!-- 				<textarea id="editor1" name="editor1">&lt;p&gt;Initial value.&lt;/p&gt;</textarea> -->
<!-- 				<script type="text/javascript"> -->
<!-- 				</script> -->
	        </div>
	        <br />
	
	        <div class="ex-input">
	            <div class="ex-input-title">예제 입력</div>
	            <textarea id="ex-input-text" name="subProblemList[0].examInput"></textarea>
	        </div>
	
	        <div class="ex-output">
	            <div class="ex-input-title">예제 출력</div>
	            <textarea id="ex-output-text" name="subProblemList[0].examOutput"></textarea>
	        </div>
	
			
	        <div class="answer-code0">
	            <div class="ex-input-title">정답 코드</div>
				<div>
					<select name="lang">
						<option value="none" selected="selected">언어선택</option>
						<option value="c">C</option>
						<option value="cpp">C++</option>
						<option value="cs">C#</option>
						<option value="java">JAVA</option>
						<option value="js">JavaScript</option>
						<option value="py">Python</option>
		             </select>
	             </div>
	            <textarea id="answer-code-text" name="subProblemList[0].correctCode"></textarea>
	        </div>
		</div>
	</div>
		
		        <a href="${pageContext.servletContext.contextPath }/training">취소</a>
		        <input type="submit" value="등록">
		        
		        <!-- 
		        <a id="addSubProblem">추가</a>
				  -->
		        <br />
		        <br />
		        <br />
		    </div>
	    </form>
</body>
</html>