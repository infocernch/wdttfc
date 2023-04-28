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
<script type="text/javascript">
function list(page) {
	 location.href="${path}/wdttfc/info/indexInfo.jsp?curPage="+page;
}
</script>
</head>
<body>
	<h2>팀원 정보</h2>
	<table border="1" class="table table-striped">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>티어</th>
			<th>전화번호</th>
			<th>관리자</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.name}</td>
				<td>${dto.userid}</td>
				<td>${dto.lv}</td>
				<td>${dto.tel}</td>
				<td>${dto.mng}</td>
			</tr>
		</c:forEach>
		<tr>

			<td colspan="9" align="center">
				<!-- onclick시 index.jsp의 자동 호출되었던 메모리에 기억하고 있는 function list(curPage)를 호출한다. -->
				<c:if test="${page.curPage > 1}">
					<a href="#" onclick="list('1')">[처음]</a>
				</c:if> <c:if test="${page.curBlock > 1}">
					<a href="#" onclick="list('${page.prevPage}')">[이전]</a>
				</c:if> <c:forEach var="num" begin="${page.blockStart}"
					end="${page.blockEnd}">
					<c:choose>
						<c:when test="${num == page.curPage}">
							<span style="color: red">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="#" onclick="list('${num}')">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${page.curBlock < page.totBlock}">
					<a href="#" onclick="list('${page.nextPage}')">[다음]</a>
				</c:if> <c:if test="${page.curPage < page.totPage}">
					<a href="#" onclick="list('${page.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
	</table>







</body>
</html>