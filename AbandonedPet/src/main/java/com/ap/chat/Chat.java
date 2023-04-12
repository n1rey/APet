package com.ap.chat;

public class Chat {
	private int cid, pid;
	
	private String username, content, date;


	
	public Chat(int cid, int pid, String username, String content, String date) {
		super();
		this.cid = cid;
		this.pid = pid;
		this.username = username;
		this.content = content;
		this.date = date;
	}



	public int getCid() {
		return cid;
	}



	public void setCid(int cid) {
		this.cid = cid;
	}



	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	public Chat() {
		// TODO Auto-generated constructor stub
	}
	
	
}
