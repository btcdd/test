<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Coding Test</title>
    <link rel="stylesheet" href="./codingtest.css">
</head>


<body>
    <div class="container">
        <div class="header clearfix">
            <div class="title">2021 더존비즈온 코딩테스트</div>
            <div class="time clearfix">
                <div class="start">시작 시간 13:00</div>
                <div class="remain">남은 시간 00:53:43</div>
            </div>
        </div>
    </div>

    <div class="workbook">
        <ul>Coding Test
            <li>문제 1</li>
            <li>문제 2</li>
            <li>문제 3</li>
            <li>문제 4</li>
            <li>문제 5</li>
            <li>문제 6</li>
        </ul>
    </div>

    <div class="nemo clearfix">
        <select name="language">
            <option value="" selected="selected">언어 선택</option>
            <option value="c">c</option>
            <option value="c++">c++</option>
            <option value="java">java</option>
            <option value="javascript">javascript</option>
            <option value="python">python</option>
        </select>
        <div class="button clearfix">
            <button class="exec">실행</button>
            <button class="reset">초기화</button>
            <button class="save">저장</button>
            <button class="submit">제출</button>
        </div>

        <div class="content">
            <div class="yo" id="origin"><textarea id="content"></textarea></div>
            <div class="yo" id="answer"><textarea id="content"></textarea></div>
        </div>

        <div class="result">
            <button class="" type="button">실행 결과</button>
            <button class="" type="button">제출 결과</button>
            <button class="stop">정지</button>
        </div>

        <div class="result-text">
            <textarea id="result-text"></textarea>
        </div>
    </div>

    </div>


</body>

</html>