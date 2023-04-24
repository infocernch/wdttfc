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



function listNews() {
	if(confirm("저장이 안됩니다. 뒤로가시겠습니까?")){
		location.href="${path}/wdttfc/info/indexInfo.jsp";
	}
}
$(function() {
	$("#btnDelete").click(function() {
		if(confirm("정말 삭제하시겠습니까?")){
			document.form1.action="${path}/news_servlet/delete.do";
			document.form1.submit();
		}
	});
});


</script>
</head>
<body>

<c:forEach var="dto" items="${list}">
<h2>내가 올린 글 수정하기</h2>
<form name="form1" method="post" id="form1" action="${path}/news_servlet/updateNews.do" enctype="multipart/form-data">
<table border="1">
<tr>
	<td>작성자 :<input readonly value="${sessionScope.userid }" name="userid" id="userid"></td>
	<td>제목 :<input id="title" name="title" placeholder="제목을 입력하세요" style="width: 600px;" value="${dto.title}"></td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="file" id="file" name="file" accept="image/gif,image/jpeg,image/png" >
	<c:if test="${dto.filename != null}">
	<td>
	<p>첨부파일 삭제<input type="checkbox" name="fileDel">${dto.filename} </p>
	</td>
	</c:if>
	
	
	</td>
	
</tr>
<tr>
	<td colspan="2" align="center"><textarea rows="20" cols="100" id="content" name="content">${dto.content}</textarea></td>
</tr>

<tr>
	
	<td><input type="button" value="뒤로가기" onclick="listNews()"></td>
	<td align="right">
	<input type="hidden" name="num" value="${dto.num}">
	<input type="submit" value="작성하기">
	<input id="btnDelete" type="button" value="삭제하기">
	</td>
</tr>

</table>


</form>
</c:forEach>

</body>
</html>