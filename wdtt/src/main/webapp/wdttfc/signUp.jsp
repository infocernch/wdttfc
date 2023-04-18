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
    <link href="${path}/wdttfc/css/signin.css" rel="stylesheet">
    
    <script type="text/javascript">
    function idCheck(){
		var userid = document.getElementById("userid");
		var checkId = /^[A-Za-z0-9]{4,12}/;
		if(userid.value == ""){
		alert("아이디는 필수 입력입니다.");
		userid.focus();
		return;
		}else if(!checkId.test(userid.value)){
		alert("아이디는 영문자, 숫자를 포함한 5~13자리로 입력하세요.");
		userid.focus();
		return;
		}else{
			var userid=$("#userid").val();
			var param="userid="+userid;
			$.ajax({
				type:"post",
				url:"${path}/wdtt_servlet/idCheck.do",
				data:param,
				success: function(data) {
					console.log("데이터값:"+data);
					$("#user").html(data);
				}
			});
		}
			
		}
    function reCheck() {
		$("#user").html("<span id='false' style='color:red;'>중복확인을 다시해주세요.</span>");
	}

    function check(){
    	var userid = document.getElementById("userid");
    	var checkId = /^[A-Za-z0-9]{4,12}/;

    	var passwd1 = document.getElementById("passwd1");
    	var checkPw =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}/;
    	var passwd2 = document.getElementById("passwd2");
    	
    	var name = document.getElementById("name");
    	var checkName = /^[가-힣]{2,}/;
    	
    	var tel = document.getElementById("tel");
    	var checkTel = /^\d{2,3}-?\d{3,4}-?\d{4}$/;
    	if(userid.value == ""){
    		alert("아이디는 필수 입력입니다.");
    		userid.focus();
    		return false;
    	}
    	if(!checkId.test(userid.value)){
    		alert("아이디는 영문자, 숫자를 포함한 5~13자리로 입력하세요.");
    		userid.focus();
    		return false;
    	}
    	/* if($("#false").css("color","red")){
    		alert("아이디 중복확인을 해주세요");
    		userid.focus();
    		return false;
    	} */
    	if(passwd1.value == ""){
    		alert("비밀번호는 필수 입력입니다.");
    		passwd1.focus();
    		return false;
    	}
    	if(!checkPw.test(passwd1.value)){
    		alert("비밀번호는 영소문자와 숫자, 특수문자(@$!%*#?&)를 포함하여 8글자 이상으로 입력하세요.");
    		passwd1.focus();
    		return false;
    	}
    	if(passwd2.value == ""){
    		alert("비밀번호 확인을 하지 않았습니다.");
    		passwd2.focus();
    		return false;
    	}
    	if(passwd1.value != passwd2.value){
    		alert("비밀번호가 일치하지 않습니다.");
    		passwd2.focus();
    		return false;
    	}
    	if(name.value == ""){
    		alert("이름은 필수 입력입니다.");
    		name.focus();
    		return false;
    	}
    	if(!checkName.test(name.value)){
    		alert("이름은 한글만 입력해주세요.");
    		name.focus();
    		return false;
    	}
    	if(tel.value == ""){
    		alert("전화번호를 입력해주세요.");
    		tel.focus();
    		return false;
    	}
    	if(!checkTel.match(tel.value)){
    		alert("전화번호의 형식이 틀립니다. ex)010-1234-1234");
    		tel.focus();
    		return false;
    	}
    	

    }

    $(function() {
    			$("#btnLogin").click(function() {
    				location.href="login.jsp";
    			});
    		});


    </script>
    
  </head>
  
  <body class="text-center">
    
<main class="form-signin w-100 m-auto">


  <form name="form1" method="post"  
  <c:choose>
  <c:when test="${sessionScope.userid==null}">
   action="${path}/wdtt_servlet/signUp.do" 
   </c:when>
   <c:otherwise>
   action="${path}/info_servlet/updateInfo.do"
   </c:otherwise>
   </c:choose>	
    onsubmit="return check()">
    <a href="${path}/wdttfc/index.jsp"><img class="mb-4" src="${path}/wdttfc/image/wdtt.png" width="72" height="57"></a>
	<c:choose>
	<c:when test="${sessionScope.userid==null}">    
    <h1 class="h3 mb-3 fw-normal">회원가입</h1>
    </c:when>
    <c:otherwise>
    <h1 class="h3 mb-3 fw-normal">회원정보수정</h1>
    </c:otherwise>
	</c:choose>	
    <div class="form-floating">
      		<input id="userid" name="userid" type="text" class="form-control" onkeydown="reCheck()">
      		<input id="btnCheck" type="button" class="btn btn-primary btn-sm" value="중복확인" onclick="idCheck()">
      		<input id="userCheck" name="userid" value="idUnCheck" type="hidden">
     		 <label for="floatingInput">ID</label>
    </div>
    <div id="user" class="idBox"style="margin-bottom: 20px;"></div>
    <div class="form-floating">
      <input id="passwd1" name="passwd" type="password" class="form-control" >
      <label for="floatingPassword">Password</label>
    </div>
    <div id="pwd" class="pwd1Box" style="margin-bottom: 20px;"></div>
    <div class="form-floating">
      <input id="passwd2" name="passwd" type="password" class="form-control">
      <label for="floatingPassword">Password Check</label>
    </div>
    <div id="pwdch" class="pwdchBox" style="margin-bottom: 20px;"><span class="pwdch"></span></div>
    
    <div class="form-floating">
      <input id="name" name="name" class="form-control" >
      <label for="floatingPassword">Name</label>
    </div>
    <div id="na" style="margin-bottom: 20px;"><span class="na"></span></div>
    
     <div class="form-floating">
      <input id="tel" name="tel" class="form-control">
      <label for="floatingPassword">Tel</label>
    </div>
    <div id="t" style="margin-bottom: 20px;"><span class="tel"></span></div >
    <div class="form-floating">
      
     <c:choose>
	<c:when test="${sessionScope.userid==null}">
    <select class="form-select" id="lv" name="lv">
      <option selected="selected" value="1">1티어</option>
      <option value="1.5">1.5티어</option>
      <option value="2">2티어</option>
      <option value="2.5">2.5티어</option>
      <option value="3">3티어</option>
    </select>
    <label for="floatingPassword">level</label>
    </c:when>
    </c:choose>
    </div>
	
	<div class="form-floating">
	<c:choose>
	<c:when test="${sessionScope.userid==null}">
      <select class="form-select" id="mng" name="mng">
      <option value="y">Y</option>
      <option selected="selected" value="n">N</option>
    </select>
    <label for="floatingPassword">Manager</label>
    </c:when>
    </c:choose>
    </div>
   <c:choose>
	<c:when test="${sessionScope.userid==null}">
    <input id="btnSignUp" class="w-100 btn btn-lg btn-primary" value="Sign Up" type="submit"  style="margin-bottom: 10px; margin-top: 10px;" >
    <input id="btnLogin" type="button" class="w-100 btn btn-lg btn-danger" value="Log In">
    </c:when>
    <c:otherwise>
    <input id="editInfo" class="w-100 btn btn-lg btn-primary" value="회원정보 수정하기" type="submit"  style="margin-bottom: 10px; margin-top: 10px;" >
    <input id="back" type="button" class="w-100 btn btn-lg btn-danger" value="돌아가기">
    </c:otherwise>
    </c:choose>
    <p class="mt-5 mb-3 text-muted">&copy; 2023 wdtt</p>
  </form>
</main>

  </body>
</html>
