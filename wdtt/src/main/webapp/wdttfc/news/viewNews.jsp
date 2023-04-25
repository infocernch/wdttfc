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
</head>
<body>
<c:forEach var="dto" items="${list}">
		<div class="news" style="align-content : center;">
			<div class="title"><h3>${dto.title}</h3></div>
			<div class="content">
				<c:choose>
				<c:when test="${dto.filename!=null || '-' }">
				<img src="${path}/news_servlet/file.do?num=${dto.num}" width="70%" height="500"><br>
				</c:when>
				<c:otherwise>
				<br>
				</c:otherwise>
				</c:choose>
				<p>${dto.content}</p>
			</div>
			<div>
				 <p><fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd"/></p>
			</div>
			<div>
				<p>조회수 ${dto.readcount}</p>
			</div>
		</div>
	</c:forEach>
	<hr>
<form name="form1" action="#">
	<table>
		<tr>
			<td>댓글쓰기</td>
		</tr>
		<tr>
			<td><textarea rows="3px" cols="70%" name="comment"></textarea></td>
			<td><button>등록</button></td>
		</tr>
	</table>
</form>

<hr>
	<table border="1">
		<tr>
			<td>글쓴이</td>
			<td>&nbsp;</td>
			<td>댓글내용 엄ㅇ니ㅏ럼대</td>
		</tr>
	
	</table>
<hr>

</body>
</html>