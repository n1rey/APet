package com.ap.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeRepository noticeRepository;

	@Override
	public void newNotice(Notice notice) {
		noticeRepository.newNotice(notice);

	}

	@Override
	public List<Notice> getAllNoticeList(Map<String, Integer> pagination) {
		return noticeRepository.getAllNoticeList(pagination);
	}

	@Override
	public Notice getNoticeById(int nid) {
		return noticeRepository.getNoticeById(nid);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeRepository.updateNotice(notice);
		
	}

	@Override
	public void deleteNotice(int nid) {
		noticeRepository.deleteNotice(nid);
		
	}

	@Override
	public int countList() {
		return noticeRepository.countList();
	}

}
