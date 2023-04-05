package com.ap.protection;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProtectionServiceImpl implements ProtectionService {
	
	@Autowired
	ProtectionRepository protectionRepository;

	@Override
	public void setNewProtection(Protection protection) {
		protectionRepository.setNewProtection(protection);

	}

	@Override
	public List<Protection> getAllProtectionList() {
		// TODO Auto-generated method stub
		return protectionRepository.getAllProtectionList();
	}

	@Override
	public List<Protection> getMyProtectionList(String username) {
		// TODO Auto-generated method stub
		return protectionRepository.getMyProtectionList(username);
	}

	@Override
	public Protection getProtectionById(String pid) {
		// TODO Auto-generated method stub
		return protectionRepository.getProtectionById(pid);
	}

	@Override
	public void update(Protection protection) {
		protectionRepository.update(protection);

	}

	@Override
	public void deleteProtection(String pid) {
		protectionRepository.deleteProtection(pid);

	}

}
