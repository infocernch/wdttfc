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
<link href="${path}/wdttfc/css/newsView.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		commentList();
	});
	function commentList() {
		var num = $("#num").val();
		$.ajax({
			type : "post",
			url : "${path}/news_servlet/commentList.do",
			data : {
				news_num : num
			},
			success : function(result) {
				$("#commntList_result").html(result);
			}
		});
	}
</script>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<c:forEach var="dto" items="${list}">
	  <div class="news">
    <div class="title">
      <h2 id="title">${dto.title}</h2>
    </div>
    <div class="readCount-container">
        <div class="readCount">
          <p>
            <fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd" /><br>
            조회수 ${dto.readcount}
          </p>
        </div>
      </div>
    <div class="content-container">
      <div class="img-wrapper">
        <c:choose>
          <c:when test="${dto.filename!=null && dto.filename!='-' }">
            <img src="${path}/news_servlet/file.do?num=${dto.num}" width="100%" height="500">
            <br>
          </c:when>
          <c:otherwise>
            <br>
          </c:otherwise>
        </c:choose>
      </div>
      
      <div class="text-wrapper">
        <pre>${dto.content}</pre>
      </div>
    </div>
  </div>
		
		<div class="button">
		<input type="hidden" id="num" value="${dto.num}">
		<a href="${'#commntList_result'}"><input type="button"
			value="댓글보기" class="btn btn-outline-success"></a>
		<a href="${'#writeComment'}"><input type="button" value="댓글쓰기" class="btn btn-outline-success"></a>
		<a href="${path}/news_servlet/newsList.do"><input type="button"
			value="처음으로" class="btn btn-outline-success"></a>
		<hr>
		</div>


	</c:forEach>
	<hr>


	<div id="commntList_result"></div>
	<hr>

	<%@ include file="../footer.jsp"%>
</body>
</html>