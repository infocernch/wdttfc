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
<table border="1">
<tr>
	<td>${dto.title}</td>
</tr>
<tr>
	<td><img src="${path}/news_servlet/file.do?num=${dto.num}" alt="실패ㅠㅠ"></td>
	<td>${dto.filename}</td>
</tr>

</table>

</c:forEach>




</body>
</html>