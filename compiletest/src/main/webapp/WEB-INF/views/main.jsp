<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>compiletest</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/assets/css/main.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	var save = false;
	$(".codeTest").submit(function(event) {
		event.preventDefault();
		var lang = $("select option:selected").val();
		console.log(lang);
		var code = $("#code").val();
		if($("#code").val() == ""){
			alert("코드가 비었당");
			document.getElementById("code").focus();
			return;
		}
		if(save == false) {
			alert("저장을 안 했당");
			return;
		}
		$.ajax({
			url: '${pageContext.request.contextPath }/compile/' + lang,
			async: true,
			type: 'post',
			dataType: 'json',
			data: {code:code},
			success: function(response){
				if(response.result != "success") {
					console.error(response.message);
					return;
				}
				if(response.data[1] != "") {
					console.log("data[1]\n" + response.data[1]);
					$("#result").val(response.data[1]);
				} else {
					console.log("data[0]\n" + response.data[0]);
					$('#result').val(response.data[0]);
				}
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
	
	$(document).on('click', '#save', function(event) {
		event.preventDefault();
		
		var lang = $("select option:selected").val();
		var code = $("#code").val();
		if(lang == 'none'){
			alert("언어선택!!!!!!!!!!!!");
		}
		if($("#code").val() == ""){
			alert("코드가 비었당");
			document.getElementById("code").focus();
			return;
		}
		$.ajax({
			url: '${pageContext.request.contextPath }/compile/' + lang + '/save',
			async: true,
			type: 'post',
			dataType: 'json',
			data: {code:code},
			success: function(response){
				if(response.result != "success") {
					console.error(response.message);
					return;
				}
				save = true;
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			}
		});
	});
});
</script>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
    <div class="codeTest">
        <form action="" method="post">
            <table class="tbl-ex">
               <tr>
                  <th colspan="3" id="head">Online Compiler</th>
               </tr>
               <tr>
                  <td>
                        <select name="lang">
                            <option value="none" selected="selected">언어선택</option>
                            <option value="c">C</option>
                            <option value="cpp">C++</option>
                            <option value="cs">C#</option>
                            <option value="java">JAVA</option>
                            <option value="js">JavaScript</option>
                            <option value="py">Python</option>
                        </select>
                  </td>
                  <td>
                    <span style="float: right;">
                        <button id='save' type="button" class="btn-save">저장</button>
                    </span>
                </td>
                <td>
                    <span style="float: left;">
                        <input type="submit" class="btn-compile" value="실행">
                    </span>
                </td>
               </tr>
               <tr>
                  <td colspan="3">
                      <textarea onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}"
                          type="text" name="code" id = "code"></textarea>
                  </td>
               </tr>
               <tr>
                    <td colspan="3">
                       <textarea name="" id="result" readonly></textarea>
                    </td>
               </tr>
            </table>
         </form>
    </div>
</body>
</html>