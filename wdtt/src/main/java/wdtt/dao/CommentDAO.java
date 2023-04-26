package wdtt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;
import wdtt.dto.CommentDTO;

public class CommentDAO {
	public void insertComment(CommentDTO dto) {
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			session.insert("comment.insertComment",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
	}
	
	public List<CommentDTO> commentList(int news_num) {
		List<CommentDTO> list = null;
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			list=session.selectList("comment.commentList",news_num);
		}catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
}
