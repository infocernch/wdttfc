package wdtt.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.WdttDTO;

public class WdttDAO {
	
	public int logInCheck(String userid,String passwd) {//로그인확인
		int result = 0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("passwd", passwd);
			result=session.selectOne("login_check", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void signUp(WdttDTO dto) {//회원가입
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			
			session.insert("wdtt.signUp",dto);
			session.commit();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	public int idCheck(String userid) {//중복확인
		int result = 0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("wdtt.idCheck",userid);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void signOut(String userid) {//로그아웃
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.delete("wdtt.signOut", userid);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}



	






	
}

