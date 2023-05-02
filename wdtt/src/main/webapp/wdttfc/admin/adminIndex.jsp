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
</head>
<body>

	<c:choose>
		<c:when test="${request.result == 'n'}">
			<script type="text/javascript">
				var id = "${sessionScope.userid}";
				alert(id + "님은 관리자가 아닙니다.");
				location.href = "${path}/wdttfc/index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<c:redirect url="/admin_servlet/admin.do"></c:redirect>
		</c:otherwise>
	</c:choose>





</body>
</html>