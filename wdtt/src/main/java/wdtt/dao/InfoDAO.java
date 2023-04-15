package wdtt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.WdttDTO;

public class InfoDAO {

	public List<WdttDTO> myInfo(String userid) {
		List<WdttDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("wdttInfo.info",userid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}


}
