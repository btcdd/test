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
    <link rel="stylesheet" href="./problem-write.css">
    <link href="${pageContext.servletContext.contextPath }/assets/css/training/problem-write.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath }/assets/css/training/header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
    <title>Code Forest</title>
<script>

var index = ${listSize };

var array = new Array();
var top = 0;

var addSubProblem = function() {
	var str = 	'<div class="subproblem' + index + '" id= "'+ index + '">' +
				'<input type="hidden" id="no" name="subProblemList[' + index + '].no" value="${vo.no }">' + 
				'<div class="sub-title">' + 
	        	'문제 제목<input type="text" name="subProblemList[' + index + '].title"/>' +
	        	'<div class="delete"><a>삭제</a></div>' + 
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
		        '</div>' +
		       '</div>';
	
	$('.a').append(str);
	
	console.log(index);
	
	index++;
	
}

$(function() {
	$('#addSubProblem').click(function() {
		addSubProblem();
	});
	
	array = new Array();
	
	var no;
	
	$('.delete').click(function() {
		no = $(this).parent().parent().attr("id");
		index--;
		
		var deleteNo = $(this).parent().parent().attr("value");
		array.push(deleteNo);
		
		$(".subproblem" + no).remove();
	});
	
	$('.submit').click(function() {
		$('.privateAndPassword').append('<input type="hidden" name="array" value="' + array + '">');
	});
});

</script>
</head>
<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    
    <form method="post" action="${pageContext.servletContext.contextPath }/training/modify/${problemVo.no }">
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
	        	문제집 제목<input type="text" name="title" value="${problemVo.title }" />
	        </div>
	        <br />
		        <div class="a">
	        <c:forEach items='${list }' var='vo' step='1' varStatus='status'>
	        	<div class="subproblem${status.index }" id="${status.index }" value="${vo.no }">
	        		<input type="hidden" id="no" name="subProblemList[${status.index }].no" value="${vo.no }">
			        <div class="sub-title">
			        	문제 제목<input type="text" name="subProblemList[${status.index }].title" value="${vo.title }" />
			        	<div class="delete"><a>삭제</a></div>
			        </div>
			        <div class="prob-content">
			            <div class="prob-content-title">내용</div>
			            <textarea id="prob-content-text" name="subProblemList[${status.index }].contents">${vo.contents }</textarea>
			        </div>
			        <br />
			
			        <div class="ex-input">
			            <div class="ex-input-title">예제 입력</div>
			            <textarea id="ex-input-text" name="subProblemList[${status.index }].examInput">${vo.examInput }</textarea>
			        </div>
			
			        <div class="ex-output">
			            <div class="ex-input-title">예제 출력</div>
			            <textarea id="ex-output-text" name="subProblemList[${status.index }].examOutput">${vo.examOutput }</textarea>
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
			            <textarea id="answer-code-text" name="subProblemList[${status.index }].correctCode">${vo.correctCode }</textarea>
			        </div>
			     </div>
				
			</c:forEach>
			</div>
			
	        <a href="${pageContext.servletContext.contextPath }/training">취소</a>
	        <input type="submit" value="등록" class="submit">
	        
	        <a id="addSubProblem">추가</a>
			  
	        <br />
	        <br />
	        <br />
	    </div>
    </form>
</body>
</html>