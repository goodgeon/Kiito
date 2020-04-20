package global.sesoc.kiito.dao;

import java.util.ArrayList;

import global.sesoc.kiito.vo.Comments;

public interface CommentsMapper {

	void insertComment(Comments comments);

	ArrayList<Comments> getCommentList(int feed_seq);

}
