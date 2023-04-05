package com.ap.freeBoard;

import java.util.List;
import java.util.Map;

public interface FreeBoardService {
	void insert(FreeBoard freeBoard);
	List<FreeBoard> getAllList(Map<String, Integer> pagination);
	FreeBoard getById(int bid);
	void update(FreeBoard freeBoard);
	void delete(int bid);
	int countList();
	int countReply(int bid);
	List<Reply> replyList(int bid);
	void replyUpdate(Reply reply);
	void replyDelete(int rid);
	void insertReply(Reply reply);
	void updateHit(String bid);
}
