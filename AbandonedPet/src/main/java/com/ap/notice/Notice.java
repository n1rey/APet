package com.ap.notice;

import lombok.Data;

@Data
public class Notice {
	private int nid;
	private String ntitle, ncontent, nwritter, ndate;
}
