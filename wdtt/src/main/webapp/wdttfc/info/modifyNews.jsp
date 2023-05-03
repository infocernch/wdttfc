<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<style type="text/css">
	
	</style>
	<script type="text/javascript">
		function listNews() {
			if(confirm("저장이 안됩니다. 뒤로가시겠습니까?")){
				location.reload();
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
    <h2 style="margin-bottom: 1.2em;">내가 올린 글 수정하기</h2>
    <form name="form1" method="post" id="form1" action="${path}/news_servlet/updateNews.do" enctype="multipart/form-data">
      <table border="1" style="width: 100%;">
        <tr>
          <td align="center">제목:<input id="title" name="title" placeholder="제목을 입력하세요" style="width:70%;" value="${dto.title}"></td>
          <td align="left">작성자 :<input readonly value="${sessionScope.userid }" name="userid" id="userid"></td>
       
        </tr>
		<tr>
			<td><input type="file" id="file" name="file" accept="image/gif,image/jpeg,image/png"></td>
				<c:if test="${dto.filename != null}">
					<td><input type="checkbox" name="fileDel">첨부파일 삭제
							(${dto.filename})</td>
				</c:if>
		</tr>

				<tr>
					<td colspan="2"
						style="text-align: center; display: flex; justify-content: center;">
						<textarea rows="20" cols="100" id="content" name="content">${dto.content}</textarea>
					</td>
				</tr>

				<tr>
          <td align="left"><input type="button" value="뒤로가기" onclick="listNews()"></td>
          <td align="right">
            <input type="hidden" name="num" value="${dto.num}">
            <input type="submit" value="작성하기" style="margin-right: 10px;">
            <input id="btnDelete" type="button" value="삭제하기" style="margin-right: 10px;">
          </td>
        </tr>
      </table>
    </form>
  </c:forEach>
</body>
</html>
