<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>주옥같죠?</title>
<%@ include file="../include/header.jsp"%>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">
<link href="${path}/wdttfc/css/wdtt.css" rel="stylesheet">
<link href="${path}/wdttfc/css/reset.css" rel="stylesheet">
<c:if test="${param.message == 'success' }">
		<script type="text/javascript">
			alert("회원가입에 성공하셨습니다.");
		</script>
	</c:if>
<c:if test="${param.message == 'edit' }">
		<script type="text/javascript">
			alert("회원정보가 수정되었습니다. 다시 로그인해주세요.");
		</script>
	</c:if>
</head>
<body>
<%@ include file="content.jsp" %>

</body>
</html>