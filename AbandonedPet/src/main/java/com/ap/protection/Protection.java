package com.ap.protection;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

public class Protection {
	private int pid;
	
	private String username;
	
	private String pname;
	
	private String page;
	
	private String pgender;
	
	private String petc;
	
	private String pimage;
	
	private String pcondition;
	
	private String pdate;
	
	private String hcnt;
	
	@NotNull(message="사진을 첨부해 주세요")
	private MultipartFile image;
	
	public String getHcnt() {
		return hcnt;
	}

	public void setHcnt(String hcnt) {
		this.hcnt = hcnt;
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
			String pcondition, String pdate, MultipartFile image, String hcnt) {
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
		this.hcnt = hcnt;
	}

	public Protection() {
		// TODO Auto-generated constructor stub
	}

	
	
}
