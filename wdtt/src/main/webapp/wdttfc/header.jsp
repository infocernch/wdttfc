<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="${path}/wdttfc/index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      <img src="${path}/wdttfc/image/wdtt.png" width="50" height="50">
      </a>
      <script type="text/javascript">
      $(function() {
    		$("#btnLogin").click(function() {
    			location.href="login.jsp";
    		});
    		$("#btnSignUp").click(function() {
    			location.href="signUp.jsp";
    		});
    		$("#btnLogout").click(function() {
    			if(confirm("로그아웃하시겠습니까?")){
    			location.href="/wdtt/wdtt_servlet/logout.do";
    			}
    		});
    		
    		$("#btnSignOut").click(function() {
    			if(confirm("정말 우리와의 으리를 저버리고 탈퇴하시겠습니까?")){
    			location.href="/wdtt/wdtt_servlet/signOut.do";
    			}
    		});
    		
    	});
      </script>

   	 <div>
   	 	<h2>우당탕탕FC</h2>
   	 </div>
   	 <c:choose>
   	 
   	 <c:when test="${sessionScope.userid==null}">
      <div class="col-md-3 text-end">
        <button id="btnLogin" type="button" class="btn btn-outline-primary me-2">Login</button>
        <button id="btnSignUp"  type="button" class="btn btn-primary">Sign-up</button>
      </div>
     </c:when>
     
 	 <c:otherwise>
 	 <div class="col-md-3 text-end">
 	 
        <button id="btnLogout" type="button" class="btn btn-outline-primary me-2">로그아웃</button>
        <button id="btnSignOut"  type="button" class="btn btn-primary">회원탈퇴</button>
     
      </div>
	</c:otherwise>

     
     </c:choose>
    </header>
  </div>
    
    
    
    
   <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a class="p-2 link-secondary" href="${path}/ContentServlet/info.do">내 정보</a>
      <a class="p-2 link-secondary" href="#">커뮤니티</a>
      <a class="p-2 link-secondary" href="#">게임</a>
      <a class="p-2 link-secondary" href="${path}/news_servlet/news.do">뉴스</a>

    </nav>
  </div>