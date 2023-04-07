package com.ap.freeBoard;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardRepositoryImpl implements FreeBoardRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
		

	@Override
	public int countList() {
		return sqlSessionTemplate.selectOne("notice.count_list");
	}

	@Override
	public void insert(FreeBoard freeBoard) {
		sqlSessionTemplate.insert("freeboard.insert", freeBoard);
		
	}

	@Override
	public List<FreeBoard> getAllList(Map<String, Integer> pagination) {
		return sqlSessionTemplate.selectList("freeboard.select_list", pagination);
	}

	@Override
	public FreeBoard getById(int bid) {
		return sqlSessionTemplate.selectOne("freeboard.select_detail", bid);
	}

	@Override
	public void update(FreeBoard freeBoard) {
		sqlSessionTemplate.update("freeboard.update", freeBoard);
		
	}

	@Override
	public void delete(int bid) {
		sqlSessionTemplate.delete("freeboard.delete", bid);
		
	}


	@Override
	public List<Reply> replyList(int bid) {
		return sqlSessionTemplate.selectList("freeboard.reply_list", bid);
	}

	@Override
	public void replyUpdate(Reply reply) {
		sqlSessionTemplate.update("freeboard.reply_update", reply);
		
	}

	@Override
	public void replyDelete(int rid) {
		sqlSessionTemplate.update("freeboard.reply_delete", rid);
		
	}

	@Override
	public void insertReply(Reply reply) {
		sqlSessionTemplate.insert("freeboard.insert_reply", reply);
		
	}

	@Override
	public void updateHit(String bid) {
		sqlSessionTemplate.insert("freeboard.update_hit", bid);
		
	}

}
