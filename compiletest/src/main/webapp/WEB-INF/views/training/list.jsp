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
    <link href="${pageContext.servletContext.contextPath }/assets/css/training/list.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.servletContext.contextPath }/assets/css/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>

var checkValues = new Array();

var levelList = new Array();

var selectList = function(){
	$.ajax({
		url: '${pageContext.request.contextPath }/training/list',
		async: false,
		type: 'post',
		traditional: true,
		data: {'checkValues':checkValues},
		success: function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			levelList = response.data;
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
}

var originList = function() {
	$.ajax({
		url: '${pageContext.request.contextPath }/training/list',
		async: false,
		type: 'get',
		dataType: 'json',
		data: '',
		success: function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			levelList = response.data;
			
			fetchList();
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
}

var fetchList = function() {
	$(".list #tr").remove();
	console.log(levelList);
	var str = "";
	for(var i = 0; i < levelList.length; i++) {
		str += '<tr id="tr">' +
    				'<td><a data-no=' + levelList[i].no + '>' + levelList[i].no +'</a></td>' +
            		'<td id="title">' + levelList[i].title + '</td>' +
		            '<td>' + levelList[i].kind + '</td>' + 
		            '<td>' + levelList[i].nickname + '</td>' + 
		            '<td>' + levelList[i].hit  + '</td>' +
		            '<td>' + levelList[i].recommend + '</td>' + 
    			'</tr>';
	}
	// $(".list").append("<c:forEach items='${levelList }' var='problemvo' varStatus='status'><tr><td><a data-no='${problemvo.no }'>${problemvo.no }</a></td><td id='title'>${problemvo.title }</td><td>${problemvo.kind }</td><td>${problemvo.nickname }</td><td>${problemvo.hit }</td><td>${problemvo.recommend }</td></tr></c:forEach>");
	$(".list table").append(str);
	console.log("asdgasdgasdfasdfaf" + str);
}

$(function() {
	originList();
	
	$('input[name=level]').change(function() {
		
		var pandan = false;
		$("input[name=level]:checked").each(function(i) {
			checkValues.push($(this).val());
			pandan = true;
		})
		
		if(!pandan) {
			originList();
		}
		else {
			selectList();
			fetchList();
			checkValues = new Array();
		}
	});
	
	$('input[name=organization]').change(function() {
		var pandan = false;
		$("input[name=organization]:checked").each(function(i) {
			checkValues.push($(this).val());
			pandan = true;
		})
		
		if(!pandan) {
			originList();
		}
		else {
			selectList();
			fetchList();
			checkValues = new Array();
		}
	});
});

</script>


</head>

<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    <div class="content">
        <div class="menu-bar">
            <div class="algo">
                <table>
                    <tr id="title">
                        <th>알고리즘</th>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" id="one" name="level" value="one">level1</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" id="two" name="level" value="two">level2</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" id="three" name="level" value="three">level3</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" id="four" name="level" value="four">level4</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" id="five" name="level" value="five">level5</td>
                    </tr>
                </table>
            </div>

            <div class="category">
                <table>
                    <tr id="title">
                        <th>분류</th>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" name="organization" value="enterprise">기업</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" name="organization" value="individual">개인</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" name="organization" value="academy">학원</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" name="organization" value="school">학교</td>
                    </tr>
                    <tr id="sub">
                        <td><input type="checkbox" name="organization" value="other">기타</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="list">
            <table>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>글쓴이</th>
                    <th>조회수</th>
                    <th>추천수</th>
                </tr>
<%--                 <c:forEach items='${list }' var='problemvo' varStatus='status'> --%>
<!--                 	<tr id="tr"> -->
<%--                 		<td><a data-no="${problemvo.no }">${problemvo.no }</a></td> --%>
<%-- 	                    <td id="title">${problemvo.title }</td> --%>
<%-- 	                    <td>${problemvo.kind }</td> --%>
<%-- 	                    <td>${problemvo.nickname }</td> --%>
<%-- 	                    <td>${problemvo.hit }</td> --%>
<%-- 	                    <td>${problemvo.recommend }</td> --%>
<!--                 	</tr> -->
<%--                 </c:forEach> --%>
            </table>
            <div class="make-problem">
                <button><a href="">문제작성</a></button>
            </div>
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