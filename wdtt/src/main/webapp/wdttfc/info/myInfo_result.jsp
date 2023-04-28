<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%@ include file="/include/header.jsp"%>
</head>
<body>
<c:forEach var="row" items="${list}">
<h2>내 정보</h2>
<table border="1" class="table">
  <tr>
    <th>이름</th>
    <th>아이디</th>
    <th>티어</th>
    <th>전화번호</th>
    <th>관리자</th>
    <th>내가 올린 글</th>
  </tr>
  <tr>
    <td>${row.name}</td>
    <td>${row.userid}</td>
    <td>${row.lv}</td>
    <td>${row.tel}</td>
    <td>${row.mng}</td>
    <td>${row.count}</td>
  </tr>
</table>
</c:forEach>
</body>
</html>