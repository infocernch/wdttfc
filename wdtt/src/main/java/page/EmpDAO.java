package page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class EmpDAO {
	public int empCount() {
		SqlSession session=MybatisManager.getInstance().openSession();
		int count=session.selectOne("emp.empCount");
		session.close();
		return count;
	}
	
	public List<EmpDTO> empList(int start, int end){
		SqlSession session=MybatisManager.getInstance().openSession();
		Map<String,Object> map=new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		
		List<EmpDTO> items=session.selectList("emp.empList", map);
		session.close();
		return items;
	}

}
