package com.ap.heart;

import java.util.List;
import java.util.Map;


public interface HeartRepository {
	void setNewHeart(Heart heart);
	
	Heart getHeartById(Map<String, Object> map);
	
	void deleteHeart(Map<String, Object> map);
	
	Map<String, Object> countHeart(Map<String, Object> map);
}
