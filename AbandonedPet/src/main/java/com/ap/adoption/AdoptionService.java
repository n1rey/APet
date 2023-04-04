package com.ap.adoption;

import java.util.List;
import java.util.Map;

public interface AdoptionService {
	void setNewAdoption(Adoption adoption);
	
	List<Adoption> getAllAdoptionList();
	
	List<Adoption> getMyAdoptionList(String aid);
	
	Adoption getAdoptionById(String aid);
	
	void updateCondition(Adoption adoption);
	
	void deleteAdoption(String aid);
}
