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
$(function() {
	commentList();
});
function commentList() {
	var num= $("#num").val();
	$.ajax({
		type:"post",
		url:"${path}/news_servlet/commentList.do",
		data: {news_num:num},
		success: function(result) {
			$("#commntList_result").html(result);
		}
	});
}



</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<c:forEach var="dto" items="${list}">
		<div class="news" style="align-content : center;">
			<div class="title"><h3 id="title">${dto.title}</h3></div>
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
		<input type="hidden" id="num" value="${dto.num}">
		<a href="${'#commntList_result'}"><input type="button" value="댓글보기"></a>
		<a href="${'#write'}"><input type="button" value="댓글쓰기"></a>
		<a href="${path}/news_servlet/newsList.do"><input type="button" value="처음으로"></a>
	<hr>
	
	

</c:forEach>
<hr>


	<div id="commntList_result"></div>
<hr>

<%@ include file="../footer.jsp" %>
</body>
</html>