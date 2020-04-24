package global.sesoc.kiito.dao;

import java.util.ArrayList;

import global.sesoc.kiito.vo.ImageFile;

public interface ImageFileMapper {

	void insertImage(ImageFile imageFile);

	ArrayList<ImageFile> getList();

	ArrayList<ImageFile> getBp();

}
