package kr.co.iotb.model.board.dto;

import lombok.Data;

@Data
public class BoardVO {
	private int allCount;
	private int newNum;
	private String writer;
	private String subject;
	private String content;
	private String reg_date;
	private String ip;
	private String passwd;
	private String email;
	private int readcount;
	private int no;
	private int num;
	private int lev;
	private int step;
	private int ref;	
	private int startRow;
	private int endRow;
}
