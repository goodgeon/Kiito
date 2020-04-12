package global.sesoc.kiito.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.ImageFile;

@Repository
public class ImageFileDAO {
	
	@Autowired
	private SqlSession session;
	
	public void insertImage(ImageFile imageFile) {
		ImageFileMapper mapper = session.getMapper(ImageFileMapper.class);
		mapper.insertImage(imageFile);
		
		
	}

	public ArrayList<ImageFile> getList() {
		ImageFileMapper mapper = session.getMapper(ImageFileMapper.class);
		ArrayList<ImageFile> list = mapper.getList();
		
		return list;
	}

}
