package com.ap.protection;

import java.util.List;
import java.util.Map;

public interface ProtectionService {
	void setNewProtection(Protection protection);
	
	List<Protection> getAllProtectionList();
	
	List<Protection> getMyProtectionList(String username);
	
	Protection getProtectionById(String pid);
	
	void update(Protection protection);
	
	void deleteProtection(String pid);
}
