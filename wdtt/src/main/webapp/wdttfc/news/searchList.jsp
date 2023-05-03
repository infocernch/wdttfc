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

	function insert() {
		location.href = "${path}/wdttfc/news/newsInsert.jsp";
	}
	function asdf(num) {
		var form=document.getElementById("form1");
		form.action="${path}/news_servlet/view.do?num="+num;
		form.submit();
	}
	
</script>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">
<link href="${path}/wdttfc/css/newsBoard.css" rel="stylesheet" >
<link href="${path}/wdttfc/css/wdtt.css" rel="stylesheet">
<link href="${path}/wdttfc/css/reset.css" rel="stylesheet">
</head>
<body>
	<c:if test="${sessionScope.userid == null }">
		<script type="text/javascript">
			alert("로그인후 이용하세요.");
			location.href = "${path}/wdttfc/login.jsp";
		</script>
	</c:if>
	<%@ include file="../header.jsp"%>

		<h2>Welcome WDTTFC</h2>
	<div>
		<input class="btn text-white btn-sm" style="float:right; background-color: #999966;" type="button" onclick="insert()" value="글쓰기">
	</div>
	<table border="1" style="width: 100%;" class="table table-hover">
		<tr>
			<th>글번호</th>
			<th>글쓴이</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="dto" items="${list}">
		<form method="post" id="form1" action="${path}/news_servlet/view.do">
			<c:choose>
				<c:when test="${dto.show=='y'}">
					<tr onclick="asdf('${dto.num}')" data-num="${dto.num}">
						<td>${dto.num}</td>
						<td>${dto.writer}</td>
						<td>${dto.title}</td>
						<td><fmt:formatDate value="${dto.join_date}"
								pattern="yyyy-MM-dd" /></td>
						
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
		


	</table>
	<div style="float: right;">
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
	<div style="text-align: center;"><a href="${'#top'}"><input type="button" value="상단으로" class="btn btn-success"></a></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>