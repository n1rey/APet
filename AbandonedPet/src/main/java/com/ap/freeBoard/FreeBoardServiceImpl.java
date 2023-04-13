package com.ap.freeBoard;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	FreeBoardRepository freeBoardRepository;
		

	@Override
	public int countList(Map<String, Object> pagination) {
		return freeBoardRepository.countList(pagination);
	}

	@Override
	public void insert(FreeBoard freeBoard) {
		freeBoardRepository.insert(freeBoard);
		
	}

	@Override
	public List<FreeBoard> getAllList(Map<String, Object> pagination) {
		return freeBoardRepository.getAllList(pagination);
	}

	@Override
	public FreeBoard getById(int bid) {
		return freeBoardRepository.getById(bid);
	}

	@Override
	public void update(FreeBoard freeBoard) {
		freeBoardRepository.update(freeBoard);
		
	}

	@Override
	public void delete(int bid) {
		freeBoardRepository.delete(bid);
		
	}


	@Override
	public List<Reply> replyList(int bid) {
		return freeBoardRepository.replyList(bid);
	}

	@Override
	public void replyUpdate(Reply reply) {
		freeBoardRepository.replyUpdate(reply);
		
	}

	@Override
	public void replyDelete(int rid) {
		freeBoardRepository.replyDelete(rid);
	}

	@Override
	public void insertReply(Reply reply) {
		freeBoardRepository.insertReply(reply);
		
	}

	@Override
	public void updateHit(String bid) {
		freeBoardRepository.updateHit(bid);
		
	}

}
