package wdtt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
}
