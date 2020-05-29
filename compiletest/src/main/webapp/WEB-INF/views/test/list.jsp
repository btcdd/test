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
		<c:forEach items='${list }' var='vo' step='1' varStatus='status'>
			<div class="test" data-no="${vo.no }" id="priority${vo.priority }">
				<div class="test-top">
					<div class="test-no">${fn:length(list) - status.index }</div>
					<div class="title">${vo.title }</div>
					<div class="state">
						<c:choose>
							<c:when test="${vo.priority == 1 }">
								진행중
							</c:when>
							<c:when test="${vo.priority == 2 }">
								예정
							</c:when>
							<c:when test="${vo.priority == 3 }">
								마감
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="test-mid">
					<c:if test="${vo.priority == 2 }">
						<div class="d-day" data-no="${vo.no }">D${dday[vo.no] }</div>
					</c:if>
				</div>
				<div class="test-bottom">
					<div class="writer">${vo.nickname }</div>
					<div class="date">${vo.startTime } ~ ${vo.endTime }</div>
				</div>
			</div>
		</c:forEach>

		<div class="pager">
			<ul>
				<li>◀</li>
				<li class="selected">1</li>
				<li>2</li>
				<li>3</li>
				<li>4</li>
				<li>5</li>
				<li>▶</li>
			</ul>
		</div>
	</div>
</body>
</html>