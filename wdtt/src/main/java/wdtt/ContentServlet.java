package wdtt;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wdtt.dao.WdttDAO;


@WebServlet("/ContentServlet/*")
public class ContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청 주소처리
				String url = request.getRequestURL().toString();
				// 컨텍스트 패스
				String contextPath = request.getContextPath();
				// dao 인스턴스 생성
				WdttDAO dao = new WdttDAO();
				String page = "";
				
				if(url.indexOf("info.do")!= -1) {
					page="/wdttfc/info/indexInfo.jsp";
					response.sendRedirect(contextPath + page);
				}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
