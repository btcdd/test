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
    <link href="${pageContext.servletContext.contextPath }/assets/css/main/main.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script>

var checkValues = new Array();
var page = '1';
var category = '';
var kwd = '';

var originList = function(page, kwd, category) {
	
	$.ajax({
		url: '${pageContext.request.contextPath }/api/training/list',
		async: false,
		type: 'post',
		dataType: 'json',
		traditional: true,
		data: {
			'page': page,
			'kwd': kwd,
			'category': category,
			'checkValues': checkValues
		},
		success: function(response){
			if(response.result != "success"){
				console.error(response.message);
				return;
			}
			map = response.data;
						
			fetchList();
		},
		error: function(xhr, status, e){
			console.error(status + ":" + e);
		}
	});
}

var fetchList = function() {
	$(".list #tr").remove();
	$(".list .page").remove();
	var str = "";
	for(var i = 0; i < map.list.length;i++){
		str += '<tr id="tr">' +
		'<td><a data-no=' + map.list[i].no + '>' + map.list[i].no +'</a></td>' +
		'<td id="title"><a href="${pageContext.servletContext.contextPath }/training/view/' + map.list[i].no + '">' + map.list[i].title + '</a></td>' +
        '<td>' + map.list[i].kind + '</td>' + 
        '<td>' + map.list[i].nickname + '</td>' + 
        '<td>' + map.list[i].hit  + '</td>' +
        '<td>' + map.list[i].recommend + '</td>' + 
	'</tr>';		
	}
	$(".list table").append(str);
	
	var str2 = "<div class='pager'>";
	
		if(map.prev){
		str2 += '<span>[이전]</span>';
		
	}	
	for(var i = map.startPageNum; i < map.endPageNum; i++){
		str2 += '<span class="page" id="' + i + '">';
		if(map.select != i ){
			str2 += i;
		}
		if(map.select == i){
			str2 += '<b>'+i+'</b>';
		}
		str2 += '</span>';
	}
	if(map.next){
		str2 += '<span>[다음]</span>';
	}	 
	str2 += "</div>"; 
		
	$(".list table").after(str2);
}

var levelChecked = function(page, kwd) {
	
	$("input[name=level]:checked").each(function(i) {
		checkValues.push($(this).val());
		category = 'level';
	})
	$("input[name=organization]:checked").each(function(i) {
		checkValues.push($(this).val());
		category = 'organization';
	})
	
	originList(page, kwd, category);
	checkValues = new Array();
}

var disabled = function(add, remove) {
	if(category === add) {
		$("input[name=" + remove + "]").attr("disabled", true);
	} else if(category === '') {
		$("input[name=" + add + "]").removeAttr("disabled");
		$("input[name=" + remove + "]").removeAttr("disabled");
	} else {
		$("input[name=" + remove + "]").removeAttr("disabled");
	}
	category = '';
}

$(function() {
	originList('1', '', '');
	
	$(document).on("click", ".page", function() {
		page = $(this).attr('id');
		levelChecked(page, kwd);
	});

	$('input[name=level]').change(function() {
		
		if($("input[name=level]").is(":checked")) {
			page = $('span b').parent().attr('id');
		} else {
			page = '1';
			category = '';
		}
		
		levelChecked(page, kwd);
		
		disabled('level','organization');
	});
	
	$('input[name=organization]').change(function() {
		if($("input[name=organization]").is(":checked")) {
			page = $('span b').parent().attr('id');
		} else {
			page = '1';
			category = '';
		}
		
		levelChecked(page, kwd);
		
		disabled('organization','level');
	});
	
	$('#search').on('click', function() {
		kwd = $('#kwd').val();
		levelChecked(page, kwd);
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
        	<div>
	        	<input type="text" id="kwd" name="kwd" value="">
	        	<input type="button" id="search" value="찾기">
        	</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>분류</th>
                    <th>글쓴이</th>
                    <th>조회수</th>
                    <th>추천수</th>
                </tr>
<%-- 				<c:forEach items="${map.list }" var="vo" varStatus="status">
					<tr>
						<td>${vo.no }</td>
						<td>${vo.title }</td>
						<td>${vo.kind }</td>
						<td>${vo.nickname }</td>
						<td>${vo.hit }</td>
						<td>${vo.recommend }</td>
					</tr>
				</c:forEach>  --%>               
            </table>
		
			<!-- pager 추가 -->
<%-- 			<div class ="pager">
 				<c:if test="${map.prev }">
					<span>[ <a href="${pageContext.request.contextPath }/training?p=${map.startPageNum -1}&kwd=${map.keyword}">이전</a> ]</span>
				</c:if>				
				
				<c:forEach begin="${map.startPageNum }" end="${map.endPageNum }" var="page">
					<span>
						<c:if test="${map.select != page }">
							<a href="${pageContext.request.contextPath }/training?p=${page}&kwd=${map.keyword}">${page}</a>
						</c:if>
						
						<c:if test="${map.select == page }">
							<b>${page }</b>
						</c:if>
					</span>
				</c:forEach>
					
				<c:if test="${map.next }">
					<span>[ <a href="${pageContext.request.contextPath }/training?p=${map.endPageNum +1}&kwd=${map.keyword}">다음</a> ]</span>
				</c:if> 											
			</div> --%>
			<!-- pager 추가 -->            
            
            
            <div class="make-problem">
                <a href="${pageContext.servletContext.contextPath }/training/write"><button>문제작성</button></a>
            </div>
		</div>		
 
        
    </div>

</body>

</html>