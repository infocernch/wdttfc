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
	function btnModify(num) {
		$.ajax({
			type : "post",
			url : "${path}/news_servlet/modify.do",
			data : {
				num : num
			},
			success : function(result) {
				$("#modify_result").html(result);
			}
		});
	}
	function btnReset(num) {
		
	}
	
</script>

</head>
<body>
	<h2>내가 쓴 글</h2>
	<table border="1" style="width: 100%;">

		<tr>
			<th>글번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>날짜</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="dto" items="${list}">


			<tr>
				<td>${dto.num}</td>
				<td>${dto.writer}</td>
				<c:choose>
					<c:when test="${dto.show=='y'}">
						<td>${dto.title}</td>
						<td><fmt:formatDate value="${dto.join_date}"
								pattern="yyyy-MM-dd" /></td>

					</c:when>
					<c:otherwise>
						<td>삭제된 게시글.</td>
						<td><input type="button"onclick="btnReset('${dto.num}')" value="복구"></td>
					</c:otherwise>
				</c:choose>
				<td><input type="button" onclick="btnModify('${dto.num}')"
					value="수정/삭제"></td>

				<td>${dto.readcount}</td>
			</tr>



		</c:forEach>
	</table>

	<div id="modify_result"></div>
</body>
</html>