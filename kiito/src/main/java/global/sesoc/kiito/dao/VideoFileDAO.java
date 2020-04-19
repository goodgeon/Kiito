package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.VideoFile;

@Repository
public class VideoFileDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insertVideo(VideoFile videoFile) {
		VideoFileMapper mapper = session.getMapper(VideoFileMapper.class);
		mapper.insertVideo(videoFile);
		
		
	}

}
