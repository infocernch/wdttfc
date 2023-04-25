<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
     <div class="container">
    	<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between border-bottom">
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

   	 <div id="top">
   	 	<h2>우당탕탕FC</h2>
   	 </div>
   	 <c:choose>
   	 
   	 <c:when test="${sessionScope.userid==null}">
      <div class="login-btn-wrap">
        <button id="btnLogin" type="button" class="login-btn">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  				<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
  				<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
			</svg>
        </button>
        <button id="btnSignUp"  type="button" class="login-btn">
        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-gear" viewBox="0 0 16 16">
  				<path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
			</svg>
        </button>
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
    
    
    
    
    <nav class="container nav justify-content-between">
      <a class="nav-link-item link-secondary" href="${path}/ContentServlet/info.do">내 정보</a>
      <a class="nav-link-item link-secondary" href="#">게임</a>
      <a class="nav-link-item link-secondary" href="${path}/news_servlet/news.do">뉴스</a>
      <c:choose>
      <c:when test="${sessionScope.userid==null}">
      <a class="nav-link-item link-secondary" href="#" onclick="afterLog()">관리자</a>
      </c:when>
      <c:otherwise>
      <a class="nav-link-item link-secondary" href="${path}/admin_servlet/admin_check.do">관리자</a>
      </c:otherwise>
	  </c:choose>
    </nav>
    
      <script type="text/javascript">
	function afterLog() {
		alert("로그인후에 이용하세요.");
	}
	</script>