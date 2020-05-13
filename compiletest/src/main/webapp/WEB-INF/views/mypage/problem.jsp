<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Code Forest</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/mypage/problem.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>    
<script>

$(function() {
	var dialogDelete = $("#dialog-delete").dialog({
		autoOpen: false,
		resizable: false,
		height: "auto",
		width: 400,
		modal: true,
		buttons: {
			"삭제": function() {
				var no = $("#hidden-no").val();
				$.ajax({
					url: '${pageContext.servletContext.contextPath }/mypage/problem/delete' + no,
					async: true,
					type: 'delete',
					dataType: 'json',
					data: '',
					success: function(response) {
						dialogDelete.dialog('close');
					},
					error: function(xhr, status, e) {
						console.error(status + ":" + e);
					}
				});
			},
			"취소": function() {
				$(this).dialog('close');
			}
		},
		close: function() {
			$("#hidden-no").val('');
			$("#dialog-delete-form p.validateTips.error").hide();
		}
	});
	
	$(document).on('click', '.delete', function(event) {
		event.preventDefault();
		
		var no = $(this).data('no');
		$('#hidden-no').val(no);
		dialogDelete.dialog('open');
	});
	
	// 문제 푼 사람 리스트 출력
	var dialogList = $("#problem-list").dialog({
		autoOpen: false,
		resizable: false,
		height: "auto",
		width: 1200,
		modal: true,
		buttons: {
			"내보내기": function() {
				
			},
			"취소": function() {
				$(this).dialog('close');
			}
		},
		close: function() {
			$("#hidden-no").val('');
		}
	});
	
	$(document).on('click', '.list', function(event) {
		event.preventDefault();
		
		var no = $(this).data('no');		
		console.log(no);
		$.ajax({
			url: '${pageContext.servletContext.contextPath }/mypage/problem/list/' + no,
			async: true,
			type: 'post',
			dataType: 'json',
			data: '',
			success: function(response) {
				console.log(response.data);
				$("")
				dialogList.dialog('open');
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
    <c:import url="/WEB-INF/views/include/mypage-header.jsp" />
    <div class="container">
        <div class="quizlist">
            <div class="line">
                <h4>작성한 퀴즈</h4>
            </div>
            <br>
            <table class="quiz-table">
                <tr>
                    <th width="10%">번호</th>
                    <th width="53%" id="title">제목</th>
                    <th width="11%">조회수</th>
                    <th width="11%">추천수</th>
                    <th width="11%">삭제</th>
                    <th width="11%">목록</th>
                </tr>
              	<c:forEach items='${list }' var='problemvo' varStatus='status'>
                	<tr>
                		<td><a data-no="${problemvo.no }">${problemvo.no }</a></td>
	                    <td id="title">${problemvo.title }</td>
	                    <td>${problemvo.hit }</td>
	                    <td>${problemvo.recommend }</td>
	                    <td><input type="image" src="${pageContext.servletContext.contextPath }/assets/images/mypage/delete.png" alt="delete" class="delete"></td>
	                    <td><input data-no="${problemvo.no }" type="image" src="${pageContext.servletContext.contextPath }/assets/images/mypage/list.png" alt="list" class="list"></td>
                	</tr>
                </c:forEach>
            </table>
            <br>
        </div>

    </div>
    
    <div id="dialog-delete" title="문제 모음 삭제" style="display: none">
    	<p>
    		<span class="ui-icon ui-icon-alert" style="float: left; margin: 12px 12px 20px 0;">	
    		</span>
    		해당 문제 모음을 삭제하시겠습니까?
    	</p>
    	<form>
    		<input type="hidden" id="hidden-no" value="">
    		<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
    	</form>
    </div>
    
    <div id="problem-list" title="문제 푼 사람 리스트" style="display: none">
    	<table class="problem-list-table">
    		<tr>
            	<th>이름</th>
                <th>이메일</th>
                <th>닉네임</th>
                <th>시도 횟수</th>
                <th>언어</th>
                <th>해결 시간</th>
            </tr>
	        <c:forEach items='' var='submitVo' varStatus='status'>
	           	<tr>
	           		<td>${submitVo.name }</td>
	                <td>${submitVo.email }</td>
	                <td>${submitVo.nickname }</td>
	                <td>${submitVo.tryCount }</td>
	                <td>${submitVo.lang }</td>
	                <td>${submitVo.solveTime }</td>
	           	</tr>
	        </c:forEach>
    	</table>

    </div>
    
</body>

</html>