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
	public List<Protection> getAllProtectionList(Map<String, Integer> pagination) {
		// TODO Auto-generated method stub
		return protectionRepository.getAllProtectionList(pagination);
	}
	
	@Override
	public List<Protection> getAdminProtectionList(Map<String, Integer> pagination) {
		// TODO Auto-generated method stub
		return protectionRepository.getAdminProtectionList(pagination);
	}

	@Override
	public List<Protection> getMyProtectionList(Map<String, Object> pagination) {
		// TODO Auto-generated method stub
		return protectionRepository.getMyProtectionList(pagination);
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

	@Override
	public int countList() {
		// TODO Auto-generated method stub
		return protectionRepository.countList();
	}

	@Override
	public int countAdminList() {
		// TODO Auto-generated method stub
		return protectionRepository.countAdminList();
	}

	@Override
	public int countMyList(String username) {
		// TODO Auto-generated method stub
		return protectionRepository.countMyList(username);
	}

}
