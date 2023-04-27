$(function() {
	$("#btnLogin").click(function() {
		location.href="login.jsp";
	});
	$("#btnSignUp").click(function() {
		location.href="signUp.jsp";
	});
	$("#btnLogout").click(function() {
		location.href="/wdtt/wdtt_servlet/logout.do";
	});
	$("#btnInformation").click(function() {
		alert("눌림");
		location.href="/wdtt/info_servlet/infoEdit.do";
	});
});

