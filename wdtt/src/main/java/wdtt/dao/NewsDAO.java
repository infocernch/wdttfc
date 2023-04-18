package wdtt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
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
		}
		return list;
	}

	public void insertNews(WdttNewsDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.insert("news.insertNews",dto);
			session.commit();
		}
	}

	public void readcount(int num) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("news.readcount",num);
			session.commit();
		}	
	}
	public List<WdttNewsDTO> view(int num) {
		List<WdttNewsDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("news.viewNews",num);
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
		}	
	}

	public String getFileName(int num) {
		String result = "";
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result = session.selectOne("news.getFileName",num);
		}
		return result;
	}

	
	
}
