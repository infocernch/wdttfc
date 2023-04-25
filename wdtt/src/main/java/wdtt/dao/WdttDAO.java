package wdtt.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.WdttDTO;

public class WdttDAO {

	public int logInCheck(String userid,String passwd) {//로그인확인
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String, Object> map = new HashMap<>();
			map.put("userid", userid);
			map.put("passwd", passwd);
			result=session.selectOne("wdtt.login_check",map);
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

	public String adminCheck(String userid) {//관리자체크
		String result="";
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("wdtt.adminCheck",userid);
		}
		return result;

	}


	public int count() {//팀원수계산
		int result=0;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			
			result=session.selectOne("wdtt.count");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public List<WdttDTO> listTeam(int start, int end) {//팀원목록
		List<WdttDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,Object> map= new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("wdtt.teamList",map);
		}
		return list;
	}


	public List<WdttDTO> member(String userid) {
		List<WdttDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("wdtt.member",userid);
		}
		return list;
	}


	public void editMember(WdttDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.update("wdtt.edit",dto);
			session.commit();
		}
	}













}