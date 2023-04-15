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
  </head>
  <body class="text-center">
    
    
    
    
    
    
<main class="form-signin w-100 m-auto">
  <form method="post" name="form1" id="form1" action="#">
    <a href="index.jsp"><img class="mb-4" src="${path}/wdttfc/image/wdtt.png" width="72" height="57"></a>
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
    <input id="home" type="button" class="w-100 btn btn-lg btn-danger" value="돌아가기">
    <p class="mt-5 mb-3 text-muted">&copy; 2023 wdtt</p>
  </form>
</main>


   <script src="js/login.js"></script>
  </body>
</html>
