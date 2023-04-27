<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<link href="path/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="path/wdttfc/css/carousel.css" rel="stylesheet">
<link href="path/wdttfc/css/carousel.rtl.css" rel="stylesheet">
</head>
<body>
<% int commentNum=Integer.parseInt(request.getParameter("commentNum").toString());
   String content = request.getParameter("content");
   int num=Integer.parseInt(request.getParameter("num").toString());
%>

<h3>댓글수정</h3>
<form method="post" name="form1" id="form1">
<textarea rows="3px" cols="70%" name="content"
					id="comment" placeholder="내용을 입력하세요" ><%= content %></textarea>
<input name="commentNum" id="commentNum" value="<%= commentNum %>" type="hidden">
<input name="num" id="num" value="<%= num %>" type="hidden">
<input type="submit" id="btnEdit" value="수정">
<input type="button" id="btnReturn" value="뒤로가기">
</form>

<script type="text/javascript">
$(function() {
	$("#btnEdit").click(function() {
		var form= document.getElementById("form1");
		form.action="${path}/news_servlet/commentEdit.do";
		window.opener.location.reload();
		window.onmessage = function(event) {
			if (event.data === 'closePopup') {
				window.opener.postMessage('refreshComments', '*');
				window.close();
			}
		};
				
	});
	$("#btnReturn").click(function() {
		if(confirm("내용은 저장이 안됩니다. 뒤로 가시겠습니까?")){
			window.close();
		}
	});
});


</script>
</body>
</html>