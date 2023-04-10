package com.ap.adoption;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdoptionRepositoryImpl implements AdoptionRepository {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void setNewAdoption(Adoption adoption) {
		this.sqlSessionTemplate.insert("adoption.insert", adoption);

	}

	@Override
	public List<Adoption> getAllAdoptionList(String oid) {
		return this.sqlSessionTemplate.selectList("adoption.select_list", oid);
	}
	
	@Override
	public List<Adoption> getAdminAdoptionList() {
		return this.sqlSessionTemplate.selectList("adoption.select_admin_list");
	}

	@Override
	public List<Adoption> getMyAdoptionList(String nid) {
		return this.sqlSessionTemplate.selectList("adoption.select_my_list", nid);
	}

	@Override
	public Adoption getAdoptionById(String aid) {
		return this.sqlSessionTemplate.selectOne("adoption.select_detail", aid);
	}

	@Override
	public void updateCondition(Adoption adoption) {
		this.sqlSessionTemplate.update("adoption.update_condition", adoption);

	}

	@Override
	public void deleteAdoption(String aid) {
		this.sqlSessionTemplate.delete("adoption.delete", aid);

	}

}
