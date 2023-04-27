<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Sign in</title>
	<%@ include file="../../include/header.jsp"%>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
    <link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/wdttfc/css/signin.css" rel="stylesheet">
    
    <script type="text/javascript">
   	function goIndex() {
		location.href="${path}/wdttfc/index.jsp";
	}
    function check() {
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		if(userid == ""){
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false;
		}
		if(passwd == ""){
			alert("비밀번호를 입력하세요");
			$("#passwd").focus();
			return false;
		}
		return true;
	}
    $(function() {
		$("#drop").click(function() {
			var form=document.getElementById("form1");
			var userid = $("#userid").val();
			var passwd = $("#passwd").val();
			if(userid == ""){
				alert("아이디를 입력하세요");
				$("#userid").focus();
				return;
			}
			if(passwd == ""){
				alert("비밀번호를 입력하세요");
				$("#passwd").focus();
				return;
			}
			
			form.action="${path}/wdtt_servlet/signOut.do";
			form.submit();
		});
	});
    </script>
    <c:if test="${param.message == 'fail'}">
    	<script type="text/javascript">
    		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
    	</script>
    </c:if>
  </head>
  <body class="text-center">
    
    
    
    
    
    
<main class="form-signin w-100 m-auto">
  <form method="post" name="form1" id="form1" action="${path}/info_servlet/infoEdit.do" onsubmit="return check()">
    <a href="${path}/wdttfc/index.jsp"><img class="mb-4" src="${path}/wdttfc/image/wdtt.png" width="72" height="57"></a>
    <h1 class="h3 mb-3 fw-normal">회원 정보 수정</h1>

    <div class="form-floating">
      <input id="userid" name="userid" class="form-control" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input id="passwd" name="passwd" type="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

   
    <button id="edit" class="w-100 btn btn-lg btn-primary"  style="margin-bottom: 10px;">회원 정보 수정</button>
    <input id="home" type="button" class="w-100 btn btn-lg btn-danger" style="margin-bottom: 10px;" onclick="goIndex()"  value="돌아가기">
    <input id="drop" type="button" class="w-100 btn btn-lg btn-danger"  value="회원탈퇴">
    <p class="mt-5 mb-3 text-muted">&copy; 2023 wdtt</p>
  </form>
</main>


   <script src="js/login.js"></script>
  </body>
</html>
