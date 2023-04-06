package com.ap.freeBoard;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class FreeBoard {
	private int bid, bhit;
	@NotBlank(message="제목을 입력해주세요.")
	private String btitle;
	
	@NotBlank(message="내용을 입력해주세요.")
	private String bcontent;
	private String bwriter, bdate;
}
