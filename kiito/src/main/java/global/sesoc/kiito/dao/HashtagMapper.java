package global.sesoc.kiito.dao;

import java.util.ArrayList;

import global.sesoc.kiito.vo.Hashtag;

public interface HashtagMapper {

	void insertH(Hashtag hash);

	ArrayList<Hashtag> getList();

}
