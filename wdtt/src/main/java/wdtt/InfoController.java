package wdtt;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import page.Pager;
import wdtt.dao.InfoDAO;
import wdtt.dao.WdttDAO;
import wdtt.dto.WdttDTO;


@WebServlet("/info_servlet/*")
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청 주소처리
		String url = request.getRequestURL().toString();
		// 컨텍스트 패스
		String contextPath = request.getContextPath();
		// dao 인스턴스 생성
		InfoDAO dao = new InfoDAO();
		String page = "";
		
		if(url.indexOf("myInfo.do")!= -1) {//내 정보 확인
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			List<WdttDTO> list = dao.myInfo(userid);
			request.setAttribute("list",list);
			page="/wdttfc/info/myInfo_result.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("infoEdit.do")!= -1) {//내 정보 수정할때 아이디 비밀번호 확인 세션에 로그인된 아이디와 비교
			HttpSession session = request.getSession();
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String sessionUserid=(String)session.getAttribute("userid");
			System.out.println("세션 아이디"+sessionUserid);
			System.out.println("입력한 아이디"+userid);
			if(userid.equals(sessionUserid)) {
//				System.out.println("정상아이디를 입력함");
				WdttDTO dto = new WdttDTO();
				WdttDAO dao2 = new WdttDAO();
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				dto.setUserid(userid);
				dto.setPasswd(passwd);
				int result = dao2.logInCheck(userid, passwd);
				if(result == 1) {
					session.setAttribute("userid", userid);
					session.setAttribute("passwd", passwd);
					page = "/wdttfc/signUp.jsp";
					RequestDispatcher rd = request.getRequestDispatcher(page);
					rd.forward(request, response);
				}else {
					String message = "fail";
					page = "/wdttfc/info/edit.jsp";
					response.sendRedirect(contextPath+page+"?message="+message);
				}
			}else{
//				System.out.println("다른아이디 입력함");
				String message = "fail";
				page = "/wdttfc/info/edit.jsp";
				response.sendRedirect(contextPath+page+"?message="+message);
				}
			
		}else if(url.indexOf("updateInfo.do")!= -1) {
			HttpSession session = request.getSession();
			String sessionUserid= (String)session.getAttribute("userid");
			String userid = request.getParameter("userid");
			String tel = request.getParameter("tel");
			String passwd = request.getParameter("passwd");
			System.out.println(userid+"//"+tel+"//"+passwd+"//"+sessionUserid);
			WdttDTO dto = new WdttDTO();
			dto.setUserid(userid);
			dto.setTel(tel);
			dto.setPasswd(passwd);
			dto.setSessionUserid(sessionUserid);
			dao.updateInfo(dto);
			
			session.invalidate();
			page="/wdttfc/index.jsp";
			String message="edit";
			response.sendRedirect(contextPath+page+"?message="+message);
		}else if(url.indexOf("showTeam.do")!= -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			//레코드 갯수 계산
			int count=dao.count(userid);
			//페이지 나누기
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count,curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			
			List<WdttDTO> list = dao.listTeam(userid,start,end);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			
			page="/wdttfc/info/teamList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
