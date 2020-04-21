package global.sesoc.kiito.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Customer {
	
	private int customer_seq;
	private String email;
	private String pw;
	private String name;
	private String nick;
	private String profileImg;
	private int customer_type;
	private ArrayList<Follow> follow;
}
