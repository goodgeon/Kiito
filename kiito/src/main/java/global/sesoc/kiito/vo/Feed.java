package global.sesoc.kiito.vo;

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
	private String originalfile;
	private String savedfile;
}