package wdtt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.WdttDTO;

public class InfoDAO {

	public List<WdttDTO> myInfo(String userid) {//내정보
		List<WdttDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("wdttInfo.info",userid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void updateInfo(WdttDTO dto) {//개인정보수정
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("wdttInfo.updateInfo",dto);
			session.commit();
		}
		
	}

	public List<WdttDTO> listTeam(String userid,int start,int end) {//팀원목록
		List<WdttDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map= new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("userid", userid);
			list=session.selectList("wdttInfo.teamList",map);
		}
		return list;
	}

	public int count(String userid) {//갯수계산
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			
			result=session.selectOne("wdttInfo.count",userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
