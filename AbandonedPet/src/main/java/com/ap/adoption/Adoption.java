package com.ap.adoption;

public class Adoption {

	private int aid;
	
	private String oid, nid, pid, aname, aage, agender, aphone, adistrict, ajob, acondition, pname;

	public int getAid() {
		return aid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getAage() {
		return aage;
	}

	public void setAage(String aage) {
		this.aage = aage;
	}

	public String getAgender() {
		return agender;
	}

	public void setAgender(String agender) {
		this.agender = agender;
	}

	public String getAphone() {
		return aphone;
	}

	public void setAphone(String aphone) {
		this.aphone = aphone;
	}

	public String getAdistrict() {
		return adistrict;
	}

	public void setAdistrict(String adistrict) {
		this.adistrict = adistrict;
	}

	public String getAjob() {
		return ajob;
	}

	public void setAjob(String ajob) {
		this.ajob = ajob;
	}

	public String getAcondition() {
		return acondition;
	}

	public void setAcondition(String acondition) {
		this.acondition = acondition;
	}

	public Adoption(int aid, String oid, String nid, String pid, String aname, String aage, String agender,
			String aphone, String adistrict, String ajob, String acondition, String pname) {
		this.aid = aid;
		this.oid = oid;
		this.nid = nid;
		this.pid = pid;
		this.aname = aname;
		this.aage = aage;
		this.agender = agender;
		this.aphone = aphone;
		this.adistrict = adistrict;
		this.ajob = ajob;
		this.acondition = acondition;
		this.pname = pname;
	}

	public Adoption() {
		// TODO Auto-generated constructor stub
	}
	
	
}
