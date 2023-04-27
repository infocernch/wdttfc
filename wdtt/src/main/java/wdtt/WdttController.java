package wdtt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wdtt.dao.WdttDAO;
import wdtt.dto.WdttDTO;

@WebServlet("/wdtt_servlet/*")
public class WdttController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 클라이언트의 요청 주소처리
		String url = request.getRequestURL().toString();
		// 컨텍스트 패스
		String contextPath = request.getContextPath();
		// dao 인스턴스 생성
		WdttDAO dao = new WdttDAO();
		String message = "";

		if (url.indexOf("login.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			WdttDTO dto = new WdttDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			int result = dao.logInCheck(userid, passwd);
			String page = "";
			if (result == 1) {// 성공
				// 세션객체에 저장
				HttpSession session = request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("passwd", passwd);
				page = "/wdttfc/index.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			} else {// 실패
				message = "error";
				page = "/wdttfc/login.jsp";
				response.sendRedirect(contextPath + page + "?message=" + message);
			}

		}else if(url.indexOf("idCheck.do")!= -1) {//아이디 중복확인
			String userid = request.getParameter("userid");
			int result = dao.idCheck(userid);
			String data="";
			if(result == 0) { data="가능";
			}else data="불가능";
			request.setAttribute("data", data);
//			System.out.println("data:"+data);
//			System.out.println("result:"+result);
//			System.out.println("넘어온 userid:"+userid);
			String page="/wdttfc/signUp_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}

		else if (url.indexOf("signUp.do") != -1) {// 회원가입
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String tel = request.getParameter("tel");
			String lv = request.getParameter("lv");
			String mng = request.getParameter("mng");
//			System.out.println("userid="+userid+"passwd="+passwd+"name="+name+"tel="+tel+"lv="+lv+"mng="+mng);
			WdttDTO dto = new WdttDTO();
			// 자료저장
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setTel(tel);
			dto.setLv(lv);
			dto.setMng(mng);
			dao.signUp(dto);

			String page = "/wdttfc/index.jsp";
			message = "success";
			response.sendRedirect(contextPath + page + "?message=" + message);

		}else if(url.indexOf("logout.do")!= -1) {//로그아웃
			HttpSession session = request.getSession();
			System.out.println(session);
			session.invalidate();
			response.sendRedirect(contextPath+"/wdttfc/index.jsp");
		}else if(url.indexOf("signOut.do")!= -1) {//회원탈퇴
			HttpSession session = request.getSession();
			String userid=(String)session.getAttribute("userid");
			if(userid != null) {
			System.out.println("userid:"+userid);
			dao.delete(userid);
			dao.signOut(userid);
			session.invalidate();
			response.sendRedirect(contextPath+"/wdttfc/index.jsp");
			}else {
			System.out.println("아이디 없음");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}