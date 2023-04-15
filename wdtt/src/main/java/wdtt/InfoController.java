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

import wdtt.dao.InfoDAO;
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
			page="/wdttfc/info/myInfoList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("infoEdit.do")!= -1) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
