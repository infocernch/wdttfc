package wdtt;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import page.Pager;
import wdtt.dao.NewsDAO;
import wdtt.dto.WdttNewsDTO;


@WebServlet("/news_servlet/*")
public class NewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트의 요청 주소처리
				String url = request.getRequestURL().toString();
				// 컨텍스트 패스
				String contextPath = request.getContextPath();
				// dao 인스턴스 생성
				NewsDAO dao = new NewsDAO();
				String page = "";

				if (url.indexOf("news.do") != -1) {
					page=contextPath+"/wdttfc/news/indexNews.jsp";
					response.sendRedirect(page);
				}
				else if(url.indexOf("newsList.do")!= -1) {//뉴스목록
						//레코드 갯수 계산
						int count=dao.count();
						System.out.println("레코드 수:"+count);
						//페이지 나누기
						int curPage=1;
						if(request.getParameter("curPage")!=null) {
							curPage=Integer.parseInt(request.getParameter("curPage"));
						}
						Pager pager=new Pager(count,curPage);
						int start=pager.getPageBegin();
						int end=pager.getPageEnd();
						//리스트
						List<WdttNewsDTO> list = dao.list(start,end);
						request.setAttribute("list", list);
						request.setAttribute("page", pager);
						page="/wdttfc/news/newsBoard.jsp";
						RequestDispatcher rd=request.getRequestDispatcher(page);
						rd.forward(request, response);
				}else if(url.indexOf("insert.do")!= -1) {
					String userid = request.getParameter("userid");
					String file = request.getParameter("file");
					String title = request.getParameter("title");
					String content = request.getParameter("content");
//					System.out.println("id:"+userid);
//					System.out.println("file:"+file);
//					System.out.println("title:"+title);
//					System.out.println("content:"+content);
					WdttNewsDTO dto = new WdttNewsDTO();
					dto.setWriter(userid);
					dto.setFilename(file);
					dto.setTitle(title);
					dto.setContent(content);
					dao.insertNews(dto);
					
					response.sendRedirect("/news_servlet/newsList.do");
				}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
