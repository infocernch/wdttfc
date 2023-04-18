package wdtt;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
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
//						System.out.println("레코드 수:"+count);
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
					File uploadDir=new File(Constants.UPLOAD_PATH);
					if(!uploadDir.exists()) {
						uploadDir.mkdir();
					}
					MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
							Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
					String userid = multi.getParameter("userid");
					String title = multi.getParameter("title");
					String content = multi.getParameter("content");
				
					
					int filesize=0;
					String filename=" ";
					try {
						Enumeration files = multi.getFileNames();
						while(files.hasMoreElements()) {
							String file1=(String)files.nextElement();
							filename = multi.getFilesystemName(file1);
							File f1 = multi.getFile(file1);
							if(f1 != null) {
								filesize=(int)f1.length();
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					WdttNewsDTO dto = new WdttNewsDTO();
					dto.setWriter(userid);
					dto.setFilename(filename);
					dto.setTitle(title);
					dto.setContent(content);
					if(filename == null||filename.trim().equals("")) {
						filename="-";
					}
					dto.setFilename(filename);
					dto.setFilesize(filesize);
//					System.out.println("id:"+userid);
//					System.out.println("file:"+filename);
//					System.out.println("title:"+title);
//					System.out.println("content:"+content);
					dao.insertNews(dto);
					
					page="/news_servlet/newsList.do";
					response.sendRedirect(contextPath+page);
				}else if(url.indexOf("view.do")!= -1) {
						int num = Integer.parseInt(request.getParameter("num"));
//						System.out.println("리드카운트로 받은 넘값:"+num);
						HttpSession session = request.getSession();
						
						
						
						
						dao.readcount(num, session);//조회수
						List<WdttNewsDTO> list = dao.view(num);//본문
						request.setAttribute("list", list);
						
						
						
						
						page = "/wdttfc/news/viewNews.jsp";
						RequestDispatcher rd = request.getRequestDispatcher(page);
						rd.forward(request, response);//포워딩
					
				}else if(url.indexOf("file.do")!= -1) {
					int num = Integer.parseInt(request.getParameter("num"));
//					System.out.println("리드카운트로 받은 넘값:"+num);
					
					//upload_wdtt에 있는 사진 가져와서 화면단에 표출하기
					String filename=dao.getFileName(num);
					String path=Constants.UPLOAD_PATH+filename;
//					System.out.println("이미지 패스값:"+path);
					FileInputStream fis = new FileInputStream(path);
					OutputStream out = response.getOutputStream();
					filename = new String(filename.getBytes("utf-8"),"8859_1");//추가코드
					response.setHeader("Content-Disposition", "attachment;filename="+filename);
					byte b[] = new byte[4096];
					int numRead;
					while(true) {
						numRead = fis.read(b, 0, b.length);
						if(numRead == -1) break;
						out.write(b, 0, numRead);
					}
					out.flush();
					out.close();
					fis.close();
				}
				
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
