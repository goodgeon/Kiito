package global.sesoc.kiito.vo;

import lombok.Data;

@Data
public class Chat {
	private int chat_seq;
	private int customer1_seq;
	private int customer2_seq;
	private String inputdate;
}
