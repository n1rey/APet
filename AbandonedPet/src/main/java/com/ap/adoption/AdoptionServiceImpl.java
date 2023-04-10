package com.ap.adoption;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdoptionServiceImpl implements AdoptionService {
	@Autowired
	AdoptionRepository adoptionRepository;

	@Override
	public void setNewAdoption(Adoption adoption) {
		adoptionRepository.setNewAdoption(adoption);

	}

	@Override
	public List<Adoption> getAllAdoptionList(String oid) {
		// TODO Auto-generated method stub
		return adoptionRepository.getAllAdoptionList(oid);
	}
	
	@Override
	public List<Adoption> getAdminAdoptionList() {
		// TODO Auto-generated method stub
		return adoptionRepository.getAdminAdoptionList();
	}

	@Override
	public List<Adoption> getMyAdoptionList(String nid) {
		// TODO Auto-generated method stub
		return adoptionRepository.getMyAdoptionList(nid);
	}

	@Override
	public Adoption getAdoptionById(String aid) {
		// TODO Auto-generated method stub
		return adoptionRepository.getAdoptionById(aid);
	}

	@Override
	public void updateCondition(Adoption adoption) {
		// TODO Auto-generated method stub
		adoptionRepository.updateCondition(adoption);
	}

	@Override
	public void deleteAdoption(String aid) {
		// TODO Auto-generated method stub
		adoptionRepository.deleteAdoption(aid);
	}

}
