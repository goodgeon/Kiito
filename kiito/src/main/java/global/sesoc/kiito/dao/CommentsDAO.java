package global.sesoc.kiito.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Comments;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSession session;

	public void insertComment(Comments comments) {
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		mapper.insertComment(comments);
		
	}

	public ArrayList<Comments> getCommentList(int feed_seq) {
		ArrayList<Comments> list = null;
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		
		list = mapper.getCommentList(feed_seq);
		
		return list;
	}
}
