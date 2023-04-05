package com.ap.protection;

import org.springframework.web.multipart.MultipartFile;

public class Protection {
	private int pid;
	
	private String username, pname, page, pgender, petc, pimage, pcondition, pdate;
	
	private MultipartFile image;

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

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPgender() {
		return pgender;
	}

	public void setPgender(String pgender) {
		this.pgender = pgender;
	}

	public String getPetc() {
		return petc;
	}

	public void setPetc(String petc) {
		this.petc = petc;
	}

	public String getPimage() {
		return pimage;
	}

	public void setPimage(String pimage) {
		this.pimage = pimage;
	}

	public String getPcondition() {
		return pcondition;
	}

	public void setPcondition(String pcondition) {
		this.pcondition = pcondition;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public Protection(int pid, String username, String pname, String page, String pgender, String petc, String pimage,
			String pcondition, String pdate, MultipartFile image) {
		this.pid = pid;
		this.username = username;
		this.pname = pname;
		this.page = page;
		this.pgender = pgender;
		this.petc = petc;
		this.pimage = pimage;
		this.pcondition = pcondition;
		this.pdate = pdate;
		this.image = image;
	}

	public Protection() {
		// TODO Auto-generated constructor stub
	}

	
	
}
