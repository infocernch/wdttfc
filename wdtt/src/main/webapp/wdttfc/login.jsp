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
	<%@ include file="../include/header.jsp"%>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/sign-in/">
    <link href="${path}/wdttfc/css/bootstrap.min.css" rel="stylesheet">
	<c:if test="${param.message == 'error' }">
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		</script>
	</c:if>

	
    
    <!-- Custom styles for this template -->
    <link href="${path}/wdttfc/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    
<main class="form-signin w-100 m-auto">
  <form method="post" name="form1" id="form1" action="${path}/wdtt_servlet/login.do">
    <a href="index.jsp"><img class="mb-4" src="image/wdtt.png" width="72" height="57"></a>
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input id="userid" name="userid" class="form-control" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input id="passwd" name="passwd" type="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button id="btnLogIn" class="w-100 btn btn-lg btn-primary"  style="margin-bottom: 10px;">Log In</button>
    <input id="btnSignUp" type="button" class="w-100 btn btn-lg btn-danger" value="Sign Up">
    <p class="mt-5 mb-3 text-muted">&copy; 2023 wdtt</p>
  </form>
</main>


   <script src="js/login.js"></script>
  </body>
</html>
