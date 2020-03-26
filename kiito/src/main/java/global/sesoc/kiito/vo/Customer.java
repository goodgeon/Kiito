package global.sesoc.kiito.vo;

import lombok.Data;

@Data
public class Customer {
	
	private int seq;
	private String email;
	private String pw;
	private String name;
	private String nick;
	private String profileImg;
	private int customer_type;
}
