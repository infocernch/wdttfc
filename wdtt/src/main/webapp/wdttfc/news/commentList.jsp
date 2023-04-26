<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">
<script type="text/javascript">
	function btnComment() {
		var comment = $("#comment").val();
		if (comment == "") {
			alert("댓글 내용을 입력하세요");
			return;
		}
		var form = document.getElementById("form1");
		form.submit();
	}
</script>
</head>
<body>
	<h2>댓글목록</h2>
	<c:forEach var="dto" items="${list}">
		<table>
			<tr>
				<td>${dto.writer}</td>
				<td>${dto.content}</td>

			</tr>
		</table>
	</c:forEach>
	<hr>
	<form id="form1" name="form1" method="post"
		action="${path}/news_servlet/comment.do">
		<table>
			<tr>
				<td>댓글쓰기</td>
			</tr>

			<tr>
				<td><textarea rows="3px" cols="70%" name="comment" id="comment"
						placeholder="내용을 입력하세요" required></textarea></td>
				<td>
				<% int news_num = Integer.parseInt(request.getAttribute("news_num").toString()); %>
						<input type="hidden" name="news_num" value="<%= news_num %>">
					<input type="button" onclick="btnComment()" value="등록"></td>

			</tr>
		</table>
	</form>

</body>
</html>