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
function modify() {
	document.form2.submit();
}

</script>

</head>
<body>
<table border="1" style="width: 100%;" >
  <tr>
    <th>글번호</th>
    <th>글쓴이</th>
    <th>제목</th>
    <th>날짜</th>
    <th>&nbsp;</th>
    <th>조회수</th>
  </tr>
<c:forEach var="dto" items="${list}">
  <tr>
    <td>${dto.num}</td>
    <td>${dto.writer}</td>
    <td>${dto.title}</td>
    <td> <fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd"/> </td>
    <td>
    	<form id="form2" name="form2" method="post" action="${path}/news_servlet/modify.do">
    	<input type="hidden" name="num" id="num" value="${dto.num}">
    	<input type="button" onclick="modify()" value="수정">
    	<input type="button" onclick="delete()" value="삭제">
    	</form>
    </td>
    <td>${dto.readcount}</td>
  </tr>
</c:forEach>
</table>
</body>
</html>