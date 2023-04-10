package com.ap.heart;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartRepositoryImpl implements HeartRepository {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void setNewHeart(Heart heart) {
		this.sqlSessionTemplate.insert("heart.insert", heart);

	}

	@Override
	public Heart getHeartById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("heart.select", map);
	}

	@Override
	public void deleteHeart(Map<String, Object> map) {
		this.sqlSessionTemplate.delete("heart.delete", map);

	}

	@Override
	public Map<String, Object> countHeart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.sqlSessionTemplate.selectOne("heart.select_count", map);
	}

}
