package com.ap.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	void newNotice(Notice notice);
	List<Notice> getAllNoticeList(Map<String, Integer> pagination);
	Notice getNoticeById(int nid);
	void updateNotice(Notice notice);
	void deleteNotice(int nid);
	int countList();
}
