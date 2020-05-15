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
<link href="header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/view.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/main/main.css" rel="stylesheet" type="text/css">    
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".pro").on("click", function() {
			$(".open").toggle("slow");
		});
	});
</script>
</head>

<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    <div class="container">
        <div class="top">
            <p class="division">111</p>
            <p>2020 더존비즈온 1차</p>
            <button><a href="">코드 트리로 가져오기</a></button>
            <button><a href="">통계</a></button>
        </div>
        
        <div class="problem-list">
            <div class="problem">
                <div class="pro">
                    <p class="division">문제1</p>
                    <p id="click">미로찾기</p>
                    <button>맞은 사람</button>
                    <div class="open">
	                    <div class="explain">
	                        <p>
	                            안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestestestest
	                        </p>
	                    </div>
	                    <div class="example">
	                        <div class="input">
	                            <fieldset>
	                                <legend class="example-division">예제 입력</legend>
	                                <div class="input-content">5</div>
	                            </fieldset>
	                        </div>
	                        <div class="result">
	                            <fieldset>
	                                <legend class="example-division">예제 출력</legend>
	                                <div class="result-content">*****</div>
	                            </fieldset>
	                        </div>
	                    </div>
                    </div>
                </div>
            </div>

            <div class="problem">
                <div class="pro">
                    <p>문제2</p>
                    <p>미로찾기</p>
                    <button>맞은 사람</button>
                </div>
            </div>
            <div class="problem">
                <div class="pro">
                    <p>문제3</p>
                    <p>미로찾기</p>
                    <button>맞은 사람</button>
                </div>
            </div>
            <div class="problem">
                <div class="pro">
                    <p>문제4</p>
                    <p>미로찾기</p>
                    <button>맞은 사람</button>
                </div>
            </div>
        </div>
        <button id="modify">수정하기</button>
    </div>
</body>

</html>