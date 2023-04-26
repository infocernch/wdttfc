<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<script type="text/javascript">
	function list(page) {
		location.href = "${path}/news_servlet/newsList.do?curPage=" + page;
	}
	function insert() {
		location.href = "${path}/wdttfc/news/newsInsert.jsp";
	}
	
</script>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">

</head>
<body>
	<c:if test="${sessionScope.userid == null }">
		<script type="text/javascript">
			alert("로그인후 이용하세요.");
			location.href = "${path}/wdttfc/login.jsp";
		</script>
	</c:if>
	<%@ include file="../header.jsp"%>

	<div>
		<h2>뉴스</h2>
		<input type="button" onclick="insert()" value="뉴스 올리기">
	</div>
	<table border="1" style="width: 100%;">
		<tr>
			<th>글번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>날짜</th>
			<th>&nbsp;</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="dto" items="${list}">
		<form method="post" action="${path}/news_servlet/view.do">
			<c:choose>
				<c:when test="${dto.show=='y'}">
					<tr>
						<td>${dto.num}</td>
						<td>${dto.writer}</td>
						<td>${dto.title}</td>
						<td><fmt:formatDate value="${dto.join_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>
						<input type="hidden" name="num" value="${dto.num}">
						<input type="submit" value="자세히"></td>
						<td>${dto.readcount}</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td>삭제된 게시글입니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</form>
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
	<div>
		<form action="${path}/news_servlet/search.do" name="form1"
			method="post">
			<select name="search_option">
				<option value="writer">글쓴이</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="all">글쓴이+제목+내용</option>
			</select> <input name="keyword">
			<button id="btnSearch">검색</button>
		</form>
	</div>
	<div id="viewNews" style="margin-top: 100px;"></div>
	<div><a href="${'#top'}">맨 위로</a></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>