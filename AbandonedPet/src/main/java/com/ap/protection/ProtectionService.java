package com.ap.protection;

import java.util.List;
import java.util.Map;

public interface ProtectionService {
	void setNewProtection(Protection protection);
	
	List<Protection> getAllProtectionList(Map<String, Integer> pagination);
	
	int countList();
	
	int countAdminList();
	
	int countMyList(String username);
	
	List<Protection> getAdminProtectionList(Map<String, Integer> pagination);
	
	List<Protection> getMyProtectionList(Map<String, Object> pagination);
	
	Protection getProtectionById(String pid);
	
	void update(Protection protection);
	
	void deleteProtection(String pid);
	
}
