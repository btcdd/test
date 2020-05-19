<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.servletContext.contextPath }/assets/css/test/list.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath }/assets/css/main/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
    <title>coding test</title>
</head>
<body>
	<c:import url="/WEB-INF/views/include/main-header.jsp" />
     <div class="content">
        <div class="list">
            <table>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>글쓴이</th>
                </tr>
            
            <c:forEach items='${list }' var='vo' step='1' varStatus='status'>
				<tr>
					<td>${vo.no }</td>
					<td>${vo.title }
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
					</td>
					<td>${vo.kind }</td>
					<td>${vo.nickname }</td>
					<td>${vo.regDate }</td>
				</tr>
			</c:forEach>
			</table>
            
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
    </div>
</body>
</html>