<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Code Forest</title>
<link href="${pageContext.servletContext.contextPath }/assets/css/test/list.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/include/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>
(function($){
	$.fn.dDay = function(){
		var $that = $(this);
		$that.html("D-3651");
	}
})(jQuery);
</script>

<script>
$(function(){
	//$(".d-day[data-no=12]").dDay();	
});
</script>
<title>Code Forest</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/main-header.jsp" />
	<div class="content">
		<div class="search">
			<input type="text" class="searchTerm"
				placeholder="Search!">
			<button type="submit" class="searchButton">
				<i class="search-icon"></i>
			</button>
		</div>

		<div class="proceeding-box">
			<c:forEach items='${list }' var='vo' step='1' varStatus='status'>
				<c:choose>
					<c:when test="${vo.priority == 1 }">
						<div class="test" data-no="${vo.no }" id="priority${vo.priority }">
							<div class="test-top">
							<div class="test-no">${fn:length(list) - status.index }</div>						
							<div class="writer">${vo.nickname }</div>
							<div class="state">진행</div>
						</div>
					<div class="test-mid">
						<div class="title">${vo.title }</div>
					</div>
					<div class="test-bottom">
						<div class="date">시작:${vo.startTime }<br/>마감:${vo.endTime }</div>
					</div>
				</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
		<div class="expected-box">
			<c:forEach items='${list }' var='vo' step='1' varStatus='status'>
				<c:choose>
					<c:when test="${vo.priority == 2 }">
						<div class="test" data-no="${vo.no }" id="priority${vo.priority }">
							<div class="test-top">
								<div class="test-no">${fn:length(list) - status.index }</div>						
								<div class="writer">${vo.nickname }</div>
								<div class="state">예정</div>
							</div>
							<div class="test-mid">
								<div class="title">${vo.title }</div>
								<c:choose>
									<c:when test="${dday[vo.no] eq 0 }">
										<div class="d-day" data-no="${vo.no }">D-DAY</div>
									</c:when>
									<c:otherwise>
										<div class="d-day" data-no="${vo.no }">D${dday[vo.no] }</div>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="test-bottom">
								<div class="date">시작:${vo.startTime }<br/>마감:${vo.endTime }</div>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
		<div class="deadline-box">
			<c:forEach items='${list }' var='vo' step='1' varStatus='status'>
				<c:choose>
					<c:when test="${vo.priority == 3 }">
						<div class="test" data-no="${vo.no }" id="priority${vo.priority }">
							<div class="test-top">
							<div class="test-no">${fn:length(list) - status.index }</div>						
							<div class="writer">${vo.nickname }</div>
							<div class="state">마감</div>
						</div>
					<div class="test-mid">
						<div class="title">${vo.title }</div>	
					</div>
					<div class="test-bottom">
						<div class="date">시작:${vo.startTime }<br/>마감:${vo.endTime }</div>
					</div>
				</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		
	</div>
</body>
</html>