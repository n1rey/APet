package com.ap.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	// 예외처리
	
	// 데이터 검증
	
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/addNotice")
	public String requestAddNoticeForm(Notice notice) {
		return "notice/addNotice";
	}
	
	@PostMapping("/addNotice")
	public String newNotice(Notice notice) {
		noticeService.newNotice(notice);
		return "redirect:/notice/noticeList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model m, String page) {
		int pageSize = 10;
		int intPage = 1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		Map<String, Integer> pagination = new HashMap<String, Integer>();
		pagination.put("pageSize", pageSize);
		pagination.put("pageNum", intPage);
		
		List<Notice> noticeList = noticeService.getAllNoticeList(pagination);
		int cnt = noticeService.countList();
		m.addAttribute("noticeList",noticeList);
		m.addAttribute("cnt", cnt);
		m.addAttribute("page", intPage);
		return "/notice/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String requestNoticeById(String nid, Model m) {
		int nid2 = Integer.parseInt(nid);
		Notice noticeById = noticeService.getNoticeById(nid2);
		m.addAttribute("notice", noticeById);
		return "/notice/noticeDetail";
	}
	
	@PostMapping("/noticeDelete")
	public String deleteNotice(String nid) {
		int nid2 = Integer.parseInt(nid);
		noticeService.deleteNotice(nid2);
		return "/notice/noticeList";
	}
	
	@GetMapping("/noticeModify")
	public String modifyNotice(String nid, Model m, Notice notice) {
		int nid2 = Integer.parseInt(nid);
		Notice noticeById = noticeService.getNoticeById(nid2);
		m.addAttribute("notice", noticeById);
		return "/notice/noticeModify";
	}
	
	@PostMapping("/noticeModify")
	public String modifyNotice(Notice notice) {
		noticeService.updateNotice(notice);
		return "redirect:/notice/noticeList";
	}
	
	
}
