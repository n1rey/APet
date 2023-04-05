package com.ap.freeBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/freeBoard")
public class FreeBoardController {
	
	// 예외처리
	
	// 데이터 검증
	
	@Autowired
	FreeBoardService freeBoardService;
	
	@GetMapping("/addFreeBoard")
	public String requestAddNoticeForm(FreeBoard freeBoard) {
		return "/freeBoard/addFreeBoard";
	}
	
	@PostMapping("/addFreeBoard")
	public String newPost(FreeBoard freeBoard) {
		freeBoardService.insert(freeBoard);
		return "redirect:/freeBoard/freeBoardList";
	}
	
	@GetMapping("/freeBoardList")
	public String freeBoardList(Model m, String page) {
		int pageSize = 10;
		int intPage = 1;
		if(page != null) {
			intPage = Integer.parseInt(page);
		}
		Map<String, Integer> pagination = new HashMap<String, Integer>();
		pagination.put("pageSize", pageSize);
		pagination.put("pageNum", intPage);
		
		List<FreeBoard> freeBoardList = freeBoardService.getAllList(pagination);
		int cnt = freeBoardService.countList();
		m.addAttribute("freeBoardList",freeBoardList);
		m.addAttribute("cnt", cnt);
		m.addAttribute("page", intPage);
		return "/freeBoard/freeBoardList";
	}
	
	@GetMapping("/freeBoardDetail")
	public String requestById(String bid, Model m, HttpServletRequest request, HttpServletResponse response) {
		// 조회수 증가
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    String sessionId = "NOT_SESSIONID";
	    // postView쿠키를 찾아서 oldCookie에 넣는다.
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	            if (cookie.getName().equals("JSESSIONID")) {
	            	sessionId = cookie.getValue();
	            }
	        }
	    }
	    
//	    // oldCookie에서 해당 세션ID의 값이 있는지 조회한다.
	    if(oldCookie == null) {
	    	// 조회수1 증가
	    	freeBoardService.updateHit(bid);
	    	Cookie newCookie = new Cookie("postView", sessionId);
	    	newCookie.setPath("/");
	    	newCookie.setMaxAge(60 * 60 * 24);
	        response.addCookie(newCookie);
	    } else {
	    	if(!oldCookie.getValue().equals(sessionId)) {
	    		//조회수 1증가
	    		freeBoardService.updateHit(bid);
	    		oldCookie.setValue(sessionId);
	    		oldCookie.setPath("/");
	    		oldCookie.setMaxAge(60*60*24);
	    		response.addCookie(oldCookie);
	    	}
	    }
		
		
		int bid2 = Integer.parseInt(bid);
		FreeBoard freeBoardById = freeBoardService.getById(bid2);
		int replyCnt = freeBoardService.countReply(bid2);
		m.addAttribute("freeBoard", freeBoardById);
		m.addAttribute("replyCnt", replyCnt);
		return "/freeBoard/freeBoardDetail";
	}
	
	@PostMapping("/freeBoardDelete")
	public String delete(String bid) {
		int bid2 = Integer.parseInt(bid);
		freeBoardService.delete(bid2);
		return "/freeBoard/freeBoardList";
	}
	
	@GetMapping("/freeBoardModify")
	public String modify(String bid, Model m, FreeBoard freeBoard) {
		int bid2 = Integer.parseInt(bid);
		FreeBoard boardById = freeBoardService.getById(bid2);
		m.addAttribute("freeBoard", boardById);
		return "/freeBoard/freeBoardModify";
	}
	
	@PostMapping("/freeBoardModify")
	public String modifyNotice(FreeBoard freeBoard) {
		freeBoardService.update(freeBoard);
		return "redirect:/freeBoard/freeBoardList";
	}
	
	@ResponseBody
	@PostMapping("/addReply")
	public String addReply(Reply reply) {
		freeBoardService.insertReply(reply);
		return "/freeBoard/freeBoardList";
	}
	
	@ResponseBody
	@PostMapping("/replyList")
	public List<Reply> replyList(String bid){
		int bid2 = Integer.parseInt(bid);
		return freeBoardService.replyList(bid2);
	}
	
	@ResponseBody
	@PostMapping("/modifyReply")
	public void modifyReply(Reply reply) {
		freeBoardService.replyUpdate(reply);
	}
	
	@ResponseBody
	@PostMapping("/deleteReply")
	public void deleteReply(String rid) {
		int rid2 = Integer.parseInt(rid);
		freeBoardService.replyDelete(rid2);
	}
	
	
}
