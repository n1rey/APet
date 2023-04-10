package com.ap.heart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HeartServiceImpl implements HeartService {
	@Autowired
	HeartRepository HeartRepository;

	@Override
	public void setNewHeart(Heart heart) {
		// TODO Auto-generated method stub
		HeartRepository.setNewHeart(heart);
	}

	@Override
	public Heart getHeartById(String pid, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("pid", pid); 
			map.put("username", username); 
			
		return HeartRepository.getHeartById(map);
	}

	@Override
	public void deleteHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		HeartRepository.deleteHeart(map);
	}

	@Override
	public Map<String, Object> countHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return HeartRepository.countHeart(map);
	}

}
