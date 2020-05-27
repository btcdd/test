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
<title>Code Forest</title>
<link href="${pageContext.servletContext.contextPath }/assets/css/training/view.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>



$(function() {
	
	var no;
	
	$(".problem").click(function() {
		no = $(this).children().attr("id");
		
		$(".open" + no).toggle("slow");
	});

});
</script>
</head>

<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    <div class="container">
        <div class="top">
            <p class="division">${problemVo.no }</p>
            <p>${problemVo.title }</p>
            <a href=""><button>코드 트리로 가져오기</button></a>
            <a href="${pageContext.servletContext.contextPath }/training/statistics/${problemVo.no }"><button>통계</button></a>
        </div>
        
        <div class="problem-list">
        	<c:forEach items='${list }' var='vo' step='1' varStatus='status'>
				<div class="problem">
					<div class="pro pro${status.index + 1}" id="${status.index + 1}">
						<p class="division">문제 ${status.index + 1}</p>
						<p id="click">${vo.title }</p>
						<button>맞은 사람</button>
						
						<div class="open${status.index + 1}">
							<div class="explain">
								<p>${vo.contents }</p>
							</div>
							<div class="example">
								<div class="input">
									<fieldset>
										<legend class="example-division">예제 입력</legend>
										<div class="input-content">${vo.examInput }</div>
									</fieldset>
								</div>
								<div class="result">
									<fieldset>
										<legend class="example-division">예제 출력</legend>
										<div class="result-content">${vo.examOutput }</div>
									</fieldset>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</c:forEach>
        </div>
        <a href="${pageContext.servletContext.contextPath }/training/modify/${problemVo.no }">수정하기</a>
    </div>
</body>

</html>