package com.ap.main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@GetMapping("/")
	public String goMain() {
		return "main";
	}
	
	@GetMapping("/map")
	public String goMap() {
		return "map";
	}
	
	@GetMapping("/admin")
	public String goAdmin(Model model) {
		// 회원 수
		int memberCnt = this.sqlSessionTemplate.selectOne("AdminMapper.selectAllCount");
			model.addAttribute("memberCnt", memberCnt);
		
		
		// 보호 중인 동물 수
		int proCnt = this.sqlSessionTemplate.selectOne("protection.count_list");
			model.addAttribute("proCnt", proCnt);
		// 보호 종료된 동물 수
		int doneCnt = this.sqlSessionTemplate.selectOne("protection.count_done");
			model.addAttribute("doneCnt", doneCnt);
		// 입양 신청 대기 중인 회원 수
		int waitCnt = this.sqlSessionTemplate.selectOne("adoption.count_wait");
			model.addAttribute("waitCnt", waitCnt);
		// 입양 거절된 회원 수
		int refuseCnt = this.sqlSessionTemplate.selectOne("adoption.count_refuse");
			model.addAttribute("refuseCnt", refuseCnt);
		// 입양 허가된 회원 수
		int permitCnt = this.sqlSessionTemplate.selectOne("adoption.count_permit");
			model.addAttribute("permitCnt", permitCnt);
			
			
		// 공지 글 수
		int noticeCnt = this.sqlSessionTemplate.selectOne("notice.count_list");
			model.addAttribute("noticeCnt", noticeCnt);	
		// 자유 게시판 글 수	
		int boardCnt = this.sqlSessionTemplate.selectOne("freeboard.count_list");
			model.addAttribute("boardCnt", boardCnt);	
			
		return "/admin";
	}
	
	
	
}
