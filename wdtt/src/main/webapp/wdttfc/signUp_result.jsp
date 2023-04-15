<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
</head>
<body>
<c:choose>
	<c:when test="${data=='가능'}"> 
		<span id="false" style="color:blue;">사용가능한 아이디입니다.</span>
	</c:when>
	<c:otherwise>
		<span id="false" style="color:red;">이미 사용중인 아이디입니다.</span>
	</c:otherwise>

</c:choose>
</body>
</html>