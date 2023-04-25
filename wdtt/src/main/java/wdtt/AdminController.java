package wdtt;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import page.Pager;
import wdtt.dao.WdttDAO;
import wdtt.dto.WdttDTO;


@WebServlet("/admin_servlet/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		// 컨텍스트 패스
		String contextPath = request.getContextPath();
		// dao 인스턴스 생성
		WdttDAO dao = new WdttDAO();
		String page = "";
		if(url.indexOf("admin_check.do")!= -1) {
			HttpSession session= request.getSession();
			String userid=(String)session.getAttribute("userid");
//			System.out.println(userid);
			String result=dao.adminCheck(userid);
//			System.out.println(result);
			request.setAttribute("result", result);
			
			page="/wdttfc/admin/adminIndex.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("admin.do")!= -1) {
			//레코드 갯수 계산
			int count=dao.count();
			//페이지 나누기
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count,curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			//팀원목록
			List<WdttDTO> list = dao.listTeam(start,end);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			
			page="/wdttfc/admin/adminTeam.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("wdttMember.do")!= -1) {
			String userid=request.getParameter("userid");
			List<WdttDTO> list = dao.member(userid);
			request.setAttribute("userid", userid);
			request.setAttribute("list", list);
//			System.out.println(list);
			page="/wdttfc/admin/memberEdit.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("editMember.do")!= -1) {
			String userid = request.getParameter("userid");
			String lv = request.getParameter("lv");
			String mng = request.getParameter("mng");
//			System.out.println(userid+"//"+lv+"//"+mng);
			WdttDTO dto = new WdttDTO();
			dto.setMng(mng);
			dto.setLv(lv);
			dto.setUserid(userid);
			dao.editMember(dto);
			page="/admin_servlet/admin.do";
			response.sendRedirect(contextPath+page);
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
