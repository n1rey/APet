package com.ap.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void newNotice(Notice notice) {
		sqlSessionTemplate.insert("notice.insert", notice);

	}

	@Override
	public List<Notice> getAllNoticeList(Map<String, Integer> pagination) {
		return sqlSessionTemplate.selectList("notice.select_list", pagination);
	}

	@Override
	public Notice getNoticeById(int nid) {
		return sqlSessionTemplate.selectOne("notice.select_detail", nid);
	}


	@Override
	public void updateNotice(Notice notice) {
		sqlSessionTemplate.update("notice.update", notice);
		
	}

	@Override
	public void deleteNotice(int nid) {
		sqlSessionTemplate.delete("notice.delete", nid);
		
	}

	@Override
	public int countList() {
		return sqlSessionTemplate.selectOne("notice.count_list");
	}

}
