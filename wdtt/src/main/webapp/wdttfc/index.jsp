<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>송성혜최고멋쟁이</title>
<%@ include file="../include/header.jsp"%>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">
<c:if test="${param.message == 'success' }">
		<script type="text/javascript">
			alert("회원가입에 성공하셨습니다.");
		</script>
	</c:if>
</head>
<body>
깃테스트
<%@ include file="header.jsp" %>
<%@ include file="content.jsp" %>
<%@ include file="footer.jsp" %>

</body>
</html>