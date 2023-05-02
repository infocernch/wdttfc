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
<link href="${path}/wdttfc/css/wdtt.css" rel="stylesheet">
<link href="${path}/wdttfc/css/reset.css" rel="stylesheet">
<script type="text/javascript">
function asdf(num) {
	var form=document.getElementById("form1");
	form.action="${path}/news_servlet/view.do?num="+num;
	form.submit();
}
</script>

</head>
<body>

	<%@ include file="../header.jsp"%>
	<h2 style="margin-bottom: 1.2em;">Hot 게시판</h2>
	<form method="post" id="form1" action="${path}/news_servlet/view.do">
		<table border="1" style="width: 100%;" class="table table-hover">
			<tr>
				<th>글번호</th>
				<th>글쓴이</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>댓글</th>
			</tr>
			<c:forEach var="dto" items="${list}">

				<tr onclick="asdf('${dto.num}')" data-num="${dto.num}">
					<td>${dto.num}</td>
					<td>${dto.writer}</td>
					<td>${dto.title}</td>
					<td><fmt:formatDate value="${dto.join_date}"
							pattern="yyyy-MM-dd" /></td>

					<td>${dto.readcount}</td>
					<td>${dto.comment_count}</td>
				</tr>

			</c:forEach>
		</table>
	</form>


	<%@ include file="../footer.jsp"%>
</body>
</html>