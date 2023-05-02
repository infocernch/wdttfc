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
<link href="${path}/wdttfc/css/commentList.css" rel="stylesheet">
<link href="${path}/wdttfc/css/reset.css" rel="stylesheet">
<script type="text/javascript">
	function btnComment() {
		var comment = $("#comment").val();
		var news_num = $("#news_num").val();
		if (comment == "") {
			alert("댓글 내용을 입력하세요");
			return;
		}
		$.ajax({
			type : "post",
			data : {
				news_num : news_num,
				comment : comment
			},
			url : "${path}/news_servlet/comment.do",
			success : function() {
				location.reload();
			}
		});
	}

	$(function() {
		$(".btnModify").click(
				function() {
					var commentNum = $(this).data("comment-num");
					var content = $(this).data("content");
					var num = $("#news_num").val();
					var data = "?commentNum=" + commentNum + "&content="
							+ content + "&num=" + num;
					window.open('${path}/wdttfc/news/editComment.jsp' + data,
							'_blank', 'width=700, height=600');

				});
		$(".btnX").click(function() {
			var comment_num = $(this).data("comment-num");
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : "post",
					url : "${path}/news_servlet/commentDelete.do",
					data : {
						comment_num : comment_num
					},
					success : function() {
						location.reload();
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<h2>댓글목록</h2>
	<table class="table table">

		<tr>
			<th>ID</th>
			<th>이름</th>
			<th>내용</th>
			<th>날짜</th>
			<th>&nbsp;</th>
		</tr>
		<c:forEach var="dto" items="${list}">
			<tr class="edit">
				<c:choose>
					<c:when test="${dto.show=='y'}">
						<td>${dto.writer}</td>
						<td>${dto.name}</td>
						<td>${dto.content}</td>
						<td><fmt:formatDate pattern="yyyy년 MM월 dd일 a hh시 mm분"
								value="${dto.join_date}" /></td>
						<c:if test="${dto.writer == sessionScope.userid}">
							<td class="btn"><input type="button" class="btnModify"
								data-comment-num="${dto.comment_num}"
								data-content="${dto.content}" value="수정"> <input
								type="button" class="btnX" data-comment-num="${dto.comment_num}"
								value="삭제"></td>
						</c:if>
					</c:when>
					<c:otherwise>
						<td>삭제된 댓글입니다.</td>


					</c:otherwise>

				</c:choose>


			</tr>
		</c:forEach>

	</table>
	<hr>
	<div id="commentDiv">
		<div id="head"><span><strong>댓글쓰기</strong></span></div>
		<div id="writeComment">
			<table>
			<tr>
			<td><span>${sessionScope.userid}</span></td>
			</tr>
			<tr>
			<td><textarea rows="3px" cols="70%" name="comment" id="comment"
				placeholder="내용을 입력하세요" required></textarea></td>
			</tr>
			<tr>
			<td style="text-align: right;"><% int news_num = Integer.parseInt(request.getAttribute("news_num").toString()); %>
			<input type="hidden" id="news_num" name="news_num"
				value="<%= news_num %>"> <input type="button" class="btn btn-outline-success btn-sm"
				onclick="btnComment()" value="등록"></td>
			</tr>
			</table>
		</div>
		
	</div>
	<div id="btnMove">
			<a href="${'#title'}"><input type="button" class="btn btn-outline-success btn-sm" value="본문"></a> <a
				href="${path}/news_servlet/newsList.do"><input type="button" class="btn btn-outline-success btn-sm"
				value="목록"></a>
			
		</div>


</body>
</html>