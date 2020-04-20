package global.sesoc.kiito.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Comments {
	
	private int comments_seq;
	private int feed_seq;
	private int customer_seq;
	private String text;
	private String inputdate;
	private Customer customer;

}
