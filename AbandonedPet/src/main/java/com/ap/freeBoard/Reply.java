package com.ap.freeBoard;

import lombok.Data;

@Data
public class Reply {
	private int rid, bid;
	private String rcontent;
	private String rwritter, rdate;
}
