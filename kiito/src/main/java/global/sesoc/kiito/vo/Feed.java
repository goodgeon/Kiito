package global.sesoc.kiito.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Feed {
	
	private int feed_seq;
	private int customer_seq;
	private String checkin;
	private String contents;
	private int congestion;
	private int likes;
	private String inputdate;
	private Customer customer;
	private ArrayList<ImageFile> imageFile;
	private ArrayList<VideoFile> videoFile;
	private ArrayList<Comments> comments;
}