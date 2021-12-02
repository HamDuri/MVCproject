package kr.co.iotb.model.board.dto;

import lombok.Data;

@Data
public class PageVO {
	private int allCount;
	private int pagAllCnt;
	private int currentPage;
	private int currentBlock;

}
