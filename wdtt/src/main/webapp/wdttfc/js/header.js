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
	$("#btnSignOut").click(function() {
		location.href="/wdtt/wdtt_servlet/signOut.do";
	});
});

