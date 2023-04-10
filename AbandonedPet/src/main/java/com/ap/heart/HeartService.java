package com.ap.heart;

import java.util.Map;

public interface HeartService {
	void setNewHeart(Heart heart);
	
	Heart getHeartById(String pid, String username);
	
	void deleteHeart(Map<String, Object> map);
	
	Map<String, Object> countHeart(Map<String, Object> map);
}
