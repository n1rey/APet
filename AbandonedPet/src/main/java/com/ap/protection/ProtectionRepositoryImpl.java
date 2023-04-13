package com.ap.protection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProtectionRepositoryImpl implements ProtectionRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void setNewProtection(Protection protection) {
		this.sqlSessionTemplate.insert("protection.insert", protection);

	}

	@Override
	public List<Protection> getAllProtectionList(Map<String, Integer> pagination) {
		return this.sqlSessionTemplate.selectList("protection.select_list", pagination);
	}
	
	@Override
	public List<Protection> getAdminProtectionList(Map<String, Integer> pagination) {
		return this.sqlSessionTemplate.selectList("protection.select_admin_list", pagination);
	}

	@Override
	public List<Protection> getMyProtectionList(Map<String, Object> pagination) {
		
		return this.sqlSessionTemplate.selectList("protection.select_my_list", pagination);
	}

	@Override
	public Protection getProtectionById(String pid) {
		return this.sqlSessionTemplate.selectOne("protection.select_detail", pid);
	}

	@Override
	public void update(Protection protection) {
		String pimage = protection.getPimage();
		
		// 사진까지 변경할 경우
		if(pimage != null) {
			this.sqlSessionTemplate.update("protection.update_image", protection);
		// 사진은 변경하지 않는 경우
		} else if(pimage == null){
			this.sqlSessionTemplate.update("protection.update", protection);
		}
	}

	@Override
	public void deleteProtection(String pid) {
		this.sqlSessionTemplate.delete("protection.delete", pid);

	}

	@Override
	public int countList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("protection.count_list");
	}

	@Override
	public int countAdminList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("protection.count_admin_list");
	}

	@Override
	public int countMyList(String username) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("protection.count_my_list", username);
	}

}
