package com.ap.adoption;

import java.util.List;
import java.util.Map;

public interface AdoptionRepository {
	void setNewAdoption(Adoption adoption);
	
	List<Adoption> getAllAdoptionList(String oid);
	
	List<Adoption> getAdminAdoptionList();
	
	List<Adoption> getMyAdoptionList(String nid);
	
	Adoption getAdoptionById(String aid);
	
	void updateCondition(Adoption adoption);
	
	void deleteAdoption(String aid);
}
