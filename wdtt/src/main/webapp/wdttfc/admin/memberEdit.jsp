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


</head>
<body>
	<form action="${path}/admin_servlet/editMember.do" method="post" name="form1" id="form1">
		<table border="1" style="width: 80%;">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>전화번호</th>
				<th>티어</th>
				<th>매니저</th>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.name}</td>
					<td>${dto.userid}</td>
					<td>${dto.tel}</td>
					<td><select class="form-select" id="lv" name="lv">
							<option value="${dto.lv}" selected="selected">${dto.lv}티어</option>
							<option value="1">1티어</option>
							<option value="1.5">1.5티어</option>
							<option value="2">2티어</option>
							<option value="2.5">2.5티어</option>
							<option value="3">3티어</option>
					</select></td>
					<td><select class="form-select" id="mng" name="mng">
							<option value="${dto.mng}">${dto.mng}</option>
							<option value="y">Y</option>
							<option value="n">N</option>
					</select></td>
					<td>
					<input type="hidden" id="userid" name="userid" value="${dto.userid}">
					<input type="submit" value="회원수정"></td>
				</tr>
			</c:forEach>
		</table>
	</form>




</body>
</html>