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
<link href="${pageContext.servletContext.contextPath }/assets/css/training/statistics.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/training/header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script type="text/javascript" src="${pageContext.servletContext.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
</head>
<body>
    <c:import url="/WEB-INF/views/include/main-header.jsp" />
    <div class="sidemenu">
        <nav>
            <ul>
                <li class="menulist"><a href="" target="_self">A - 집 떠나와 열차 타고</a></li>
                <li class="menulist"><a href="" target="_self">B - 훈련소로 가는 날</a></li>
                <li class="menulist"><a href="" target="_self">C - 부모님께 큰절 하고</a></li>
                <li class="menulist"><a href="" target="_self">D - 대문 밖을 나설 때</a></li>
                <li class="menulist"><a href="" target="_self">E - 가슴 속에 무엇인가</a></li>
                <li class="menulist"><a href="" target="_self">F - 아쉬움이 남지만</a></li>
            </ul>
        </nav>
    </div>
    <div class="container">
        <div class="quizlist">
            <div class="line">
                <h4>문제 통계</h4>
            </div>
            <br />
            <table>
                <thead>
                    <tr>
                        <th></th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>E</th>
                        <th>F</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>맞았습니다</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>3</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>틀렸습니다</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>22</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>C</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>4</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>C++</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>5</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>Java</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>42</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>JavaScript</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>21</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>Python</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>12</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>맞은 사람</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>13</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>정답율</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>14</td>
                        <td>46</td>
                    </tr>
                    <tr>
                        <th>합계</th>
                        <td>4</td>
                        <td>21</td>
                        <td>14</td>
                        <td>5</td>
                        <td>2</td>
                        <td>15</td>
                        <td>46</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>