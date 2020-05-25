<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/problem-write.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<title>Code Forest</title>
<script>

var index = 1;

/*
var index = 1;

var addSubProblem = function() {
	var str = '<div class="sub-title">' + 
	        	'문제 제목<input type="text" name="subProblemList[' + index + '].title"/>' +
		        '</div>' +
		        '<div class="prob-content">' + 
		            '<div class="prob-content-title">내용</div>' + 
		            '<textarea id="prob-content-text" name="subProblemList[' + index + '].contents"></textarea>' + 
		        '</div>' + 
		        '<br />' + 
		
		        '<div class="ex-input">' + 
		            '<div class="ex-input-title">예제 입력</div>' + 
		            '<textarea id="ex-input-text" name="subProblemList[' + index + '].examInput"></textarea>' + 
		        '</div>' + 
		
		        '<div class="ex-output">' + 
		            '<div class="ex-input-title">예제 출력</div>' + 
		            '<textarea id="ex-output-text" name="subProblemList[' + index + '].examOutput"></textarea>' + 
		        '</div>' + 
				
		        '<div class="answer-code">' + 
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
		        '</div>';
		        
	$('.problem').append(str);
	index++;
}


$(function() {
	$('#addSubProblem').click(function() {
		addSubProblem();
	})
	
	$('.problem').tabs();
});
*/


function openCity(evt, cityName) {
	// Declare all variables
	var i, tabcontent, tablinks;

	// Get all elements with class="tabcontent" and hide them
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}

	// Get all elements with class="tablinks" and remove the class "active"
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}

	// Show the current tab, and add an "active" class to the link that opened the tab
	document.getElementById(cityName).style.display = "block";
	evt.currentTarget.className += " active";
}

function problemAdd() {
	var str = '<div id="test" class="tabcontent"><div class="sub-title">' + 
				'문제 제목<input type="text" name="subProblemList[' + index + '].title"/>' +
			    '</div>' +
			    '<div class="prob-content">' + 
			        '<div class="prob-content-title">내용</div>' + 
			        '<textarea id="prob-content-text" name="subProblemList[' + index + '].contents"></textarea>' + 
			    '</div></div>';
	
	var buttonStr = '<button class="tablinks" onclick="openCity(event, "test")>test</button>';
	
	$("#3").after(buttonStr);
	
	$("#Tokyo").after(str);
}

</script>
</head>
<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    
    <div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')">London</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Paris</button>
		<button class="tablinks333" id="3" onclick="openCity(event, 'Tokyo')">Tokyo</button>
		<button class="tablinks" onclick="problemAdd()">+</button>
	</div>
	
	<div id="London" class="tabcontent">
		<h3>London</h3>
		<div class="privateAndPassword">
            <div class="private">코딩테스트 <input type="checkbox"></div>
            <div class="password">비밀번호 <input type="password"></div>
        </div>
        <div class="date">
            <div class="start-date">시작일자 <input type="datetime-local"></div>
            <div class="end-date">마감일자 <input type="datetime-local"></div>
        </div>
	</div>
	
	<div id="Paris" class="tabcontent">
		<h3>Paris</h3>
		<p>Paris is the capital of France.</p>
	</div>
	
	<div id="Tokyo" class="tabcontent">
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div>
	
	<div id="Seoul" class="tabcontent">
		<h3>+</h3>
		<p>Add!</p>
	</div>
	
    <!--  
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
		        
		        <div class="problem">
			        <div class="sub-title">
			        	문제 제목<input type="text" name="subProblemList[0].title"/>
			        </div>
			        <div class="prob-content">
			            <div class="prob-content-title">내용</div>
			            <textarea id="prob-content-text" name="subProblemList[0].contents"></textarea>
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
		        <a href="${pageContext.servletContext.contextPath }/training">취소</a>
		        <input type="submit" value="등록">
		        
		        <a id="addSubProblem">추가</a>
				  
		        <br />
		        <br />
		        <br />
		    </div>
	    </form>
    -->
</body>
</html>