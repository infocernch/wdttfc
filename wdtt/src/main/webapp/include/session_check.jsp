<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.userid ==null }">
	<script type="text/javascript">
		alert("로그인 후 이용하세요.");
		location.href = "${path}/ch07/session_login.jsp";
	</script>
</c:if>