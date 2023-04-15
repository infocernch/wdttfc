
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
	}if($("#user span").css("color") == "red"){
		alert("아이디 중복확인을 해주세요");
		return false;
	}
	
	return true;

}

$(function() {
			$("#btnLogin").click(function() {
				location.href="login.jsp";
			});
		});





