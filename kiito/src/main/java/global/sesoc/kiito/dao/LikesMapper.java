package global.sesoc.kiito.dao;

import java.util.HashMap;

import global.sesoc.kiito.vo.Likes;

public interface LikesMapper {

	Likes getLikes(HashMap<String, Integer> map);

	void insertL(HashMap<String, Integer> map);

	void deleteL(HashMap<String, Integer> map);

}
