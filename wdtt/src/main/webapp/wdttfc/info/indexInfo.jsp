<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Info</title>
<%@ include file="../../include/header.jsp"%>
<link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.css" rel="stylesheet">
<link href="${path}/wdttfc/css/carousel.rtl.css" rel="stylesheet">

<script type="text/javascript">
$(function() {
   myInfo();
   myWrite();
});

function myInfo() {
   $.ajax({
      type:"post",
      url:"${path}/info_servlet/myInfo.do",
      success: function(data) {
         $("#myInfo").html(data);
      }
   });
}
function myWrite() {
	$.ajax({
		type:"post",
		url:"${path}/news_servlet/myWrite.do",
		success: function (data) {
			$("#myBoard").html(data);
		}
	});
}

</script>

</head>
<body>

<c:if test="${sessionScope.userid == null }">
   <script type="text/javascript">
      alert("로그인후 이용하세요.");
      location.href = "${path}/wdttfc/login.jsp";
   </script>
</c:if>   

<%@ include file="../header.jsp" %>

<div id="infoHead" style="width: 100%; height: 250px; background-color: green;">
      <div>
         <h3>내 정보</h3>
         <span>우당탕탕에서의 내 입지를 확인해보세요</span>
      </div>
      
      <div class="container-fluid  text-light row gx-5">
      <div class="col">
         <div class="p-3 border bg-warning"><a href="#" id="showInfo">내 정보</a></div>
      </div>
      <div class="col">
         <div class="p-3 border bg-warning"><a href="#" id="myWrite">내가 올린 글</a></div>
      </div>
      <div class="col">
         <div class="p-3 border bg-warning"><a href="${path}/wdttfc/info/edit.jsp">개인정보 수정</a></div>
      </div>
   </div>
</div>


<div id="myInfo"></div>
<div id="myBoard"></div>



<%@ include file="../footer.jsp" %>

</body>
</html>