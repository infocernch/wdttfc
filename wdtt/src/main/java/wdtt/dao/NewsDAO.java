package wdtt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.CommentDTO;
import wdtt.dto.WdttNewsDTO;

public class NewsDAO {

	public int count() {
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("news.count");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<WdttNewsDTO> list(int start, int end) {
		List<WdttNewsDTO> list=null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map= new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			
			list=session.selectList("news.list",map);
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}

	public void insertNews(WdttNewsDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.insert("news.insertNews",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void readcount(int num) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("news.readcount",num);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}
	public List<WdttNewsDTO> view(int num) {
		List<WdttNewsDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("news.viewNews",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void readcount(int num, HttpSession count_session) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!= null) {
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();
			if(current_time-read_time >24*60*60*1000) {
				session.update("news.readcount",num);
				session.commit();
				count_session.setAttribute("read_time_"+num, current_time);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public String getFileName(int num) {
		String result = "";
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result = session.selectOne("news.getFileName",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<WdttNewsDTO> myWrite(int start,int end,String userid) {//내가 쓴 글
		List<WdttNewsDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("news.myWrite",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<WdttNewsDTO> modify(int num, String userid) {//게시글수정
		List<WdttNewsDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("num",num);
			list = session.selectList("news.modify",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void update(WdttNewsDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("news.update",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void delete(int num) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("news.delete",num);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void reset(int num) {//복구
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("news.reset",num);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<WdttNewsDTO> searchList(String search_option, String keyword) {
		List<WdttNewsDTO> list=null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("news.searchList",map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public void editComment(CommentDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("comment.edit",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void deleteComment(int comment_num) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("comment.deleteComment",comment_num);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<WdttNewsDTO> hot() {
		List<WdttNewsDTO> list= null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("news.hot");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public WdttNewsDTO fileGet(int num) {
		WdttNewsDTO dto = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			dto=session.selectOne("news.viewNews",num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}



	




	
	
}
