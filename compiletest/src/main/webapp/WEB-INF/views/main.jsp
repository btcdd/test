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
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	$(".codeTest").submit(function(event) {
		event.preventDefault();
		
		var code = $("#code").val();
		$.ajax({
			url: '${pageContext.request.contextPath }/compile',
			async: true,
			type: 'post',
			cache: false,
			dataType: 'json',
			data: {code:code},
			success: function(response){
				if(response.result != "success") {
					console.error(response.message);
					return;
				}	
				$("#result").val(response.data);
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
	<div class="header">
        <div class="container">
            <div class="container-left clearfix">
                <div class="logo">
                    <img src="https://user-images.githubusercontent.com/59616862/80387335-7fb8e980-88e3-11ea-99ac-2c643a77a40c.png" alt="CodeForest">
                </div>
                <div class="menu clearfix">
                    <div class="menu-item">Code Tree</div>
                    <div class="menu-item">Coding Test</div>
                    <div class="menu-item">Coding Training</div>
                </div>
            </div>
        </div>
    </div>
    <div class="codeTest">
        <form action="${pageContext.servletContext.contextPath }/compile" method="post">
            <table class="tbl-ex">
               <tr>
                  <th colspan="2" id="head">Online Java Compiler</th>
               </tr>
               <tr>
                  <td class="label">코드 입력</td>
                  <td>결과</td>
               </tr>
               <tr>
                  <td>
                      <textarea onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}"
                          type="text" name="code" id = "code"></textarea>
                  </td>
                  <td>
                      <textarea name="" id="result" readonly></textarea>
                  </td>
               </tr>
               <tr>
               		
                   <td>
                        <span style="float: right;">
                            <input type="submit" value="Compile">
                        </span>
                   </td>
               </tr>
            </table>
         </form>
    </div>
</body>
</html>