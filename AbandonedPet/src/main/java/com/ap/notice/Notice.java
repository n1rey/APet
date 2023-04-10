package com.ap.notice;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Notice {
	private int nid;
	@NotBlank(message="제목을 입력해주세요.")
	private String ntitle;
	@NotBlank(message="내용을 입력해주세요.")
	private String ncontent;
	private String nwriter, ndate;
	private String nwriterName;
}
