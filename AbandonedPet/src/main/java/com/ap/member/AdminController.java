package com.ap.member;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final MemberService memberService;
	
    @GetMapping("/member")
    public String memberAdmin() {
        return "admin/member";
    }

//    @PostMapping("/member")
//    @ResponseBody
//    public List<Member> getMemberList() {
//    	List<Member> members = memberService.getMemberList();
//    	return members;
//    }
    
    @PostMapping("/member/total")
    @ResponseBody
    public String getTotalNum(@ModelAttribute Criteria cri) {

    	Integer totalNum = (Integer)memberService.getTotalCount(cri);
  
    	return totalNum.toString();
    }
    
    @PostMapping("/member/all")
    @ResponseBody
    public List<Member> getMemberPaging(@ModelAttribute Criteria cri) {
    	
    	List<Member> members = memberService.getMemberList(cri);
  
    	return members;
    }
    
    
}
