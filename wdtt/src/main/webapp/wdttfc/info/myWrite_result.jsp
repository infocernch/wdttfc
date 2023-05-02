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
<link href="${path}/wdttfc/css/reset.css" rel="stylesheet">
<script type="text/javascript">
	function btnModify(e,num) {
		e.stopPropagation();
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
		location.href="${path}/news_servlet/reset.do?num="+num;
	}
	function myWrite(num) {
		location.href="${path}/news_servlet/view.do?num="+num;
	}
	
	
</script>

</head>
<body>
	<h2 style="margin-bottom: 1.2em;">내가 쓴 글</h2>
	<table border="1" style="width: 100%;" class="table table-hover">

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


			<tr onclick="myWrite('${dto.num}')">
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
				<td colspan="2"><input type="button" onclick="btnModify(event,'${dto.num}')"
					value="수정/삭제"></td>

				<td>${dto.readcount}</td>
			</tr>
			
			


		</c:forEach>
		
	</table>

	<div id="modify_result"></div>
</body>
</html>