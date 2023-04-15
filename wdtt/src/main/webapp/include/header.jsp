<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
1)JSTL(Jsp Standard Tag Library, JSP표준태그 라이브러리)
2)JSTL 사용 이유: model1은 jsp페이지 중심, model2는 java코드 중심, jsp웹피이지에서 java코드를 안쓸수는 없지만
	이를 최소화하기 위해 JSTL과 EL기법을 씀, 즉 jsp 내부의 복잡한 자바코드를 대체하기 위한 태그
3)taglib uri="태그라이브러리의 식별자" prefix="태그 접두어" 
4)Core tag(핵심태그, 제일 자주 사용되는 태그들)
 -->
 <link rel="stylesheet" href="${path}/include/css/bootstrap.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<script src="${path}/include/jquery-3.6.3.min.js"> </script>
<script src="${path}/include/js/bootstrap.js"> </script>
<script src="${path}/include/js/bootstrap.bundle.js"> </script>
<script src="${path}/include/js/bootstrap.min.js"> </script>



