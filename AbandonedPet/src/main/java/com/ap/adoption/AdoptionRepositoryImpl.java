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
	public List<Adoption> getAllAdoptionList() {
		return this.sqlSessionTemplate.selectList("adoption.select_list");
	}

	@Override
	public List<Adoption> getMyAdoptionList(String aid) {
		return this.sqlSessionTemplate.selectList("adoption.select_mylist", aid);
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
