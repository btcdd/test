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
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="${pageContext.servletContext.contextPath }/delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="${pageContext.servletContext.contextPath }/list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
                <tr>
                    <td>11</td>
                    <td id="title">미로탈출</td>
                    <td>22</td>
                    <td>10</td>
                    <td><input type="image" src="./delete.png" alt="delete" class="delete"></td>
                    <td><input type="image" src="./list.png" alt="list" class="list"></td>
                </tr>
            </table>
            <br>
        </div>

    </div>

</body>

</html>