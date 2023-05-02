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
<link href="${path}/wdttfc/css/wdtt.css" rel="stylesheet">
<script type="text/javascript">
function listNews() {
	if(confirm("저장이 안됩니다. 뒤로가시겠습니까?")){
		location.href="${path}/news_servlet/newsList.do";
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<h2 style="margin-bottom: 1.2em;">게시글 작성</h2>
<form name="form1" method="post" id="form1" action="${path}/news_servlet/insert.do" enctype="multipart/form-data">
<table border="1">
<tr>
	<td>작성자 :<input readonly value="${sessionScope.userid }" name="userid" id="userid"></td>
	<td>제목 :<input id="title" name="title" placeholder="제목을 입력하세요" style="width: 600px;"></td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="file" id="file" name="file" accept="image/gif,image/jpeg,image/png"></td>
</tr>
<tr>
	<td colspan="2" align="center"><textarea rows="20" cols="100" name="content"></textarea></td>
</tr>

<tr>
	<td align="right"><input type="button" value="뒤로가기" onclick="listNews()"></td>
	<td align="right"><input type="submit" value="작성하기"></td>
</tr>

</table>








</form>





<%@ include file="../footer.jsp" %>
</body>
</html>