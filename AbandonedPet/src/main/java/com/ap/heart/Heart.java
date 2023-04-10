package com.ap.heart;

public class Heart {
	private String pid, username;
	
	private int heart;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public Heart(String pid, String username, int heart) {
		this.pid = pid;
		this.username = username;
		this.heart = heart;
	}

	public Heart() {
		// TODO Auto-generated constructor stub
	}

	
	
}
