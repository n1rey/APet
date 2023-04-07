package com.ap.member;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {

	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	private final MemberService memberService;

	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	@GetMapping("/loginfail")
	public String loginFail() {
		return "loginfail";
	}

	@GetMapping("/join")
	public String joinForm(Model model) {
		model.addAttribute("member", new Member());
		return "users/joinform";
	}

	@PostMapping("/join")
	public String joinMember(@Validated @ModelAttribute Member member, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			return "users/joinform";
		}

		// 회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);

		memberService.createMember(member);
		return "redirect:/login";
	}

	@GetMapping("/member/myPage")
	public String myPage(Model model) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication auth = securityContext.getAuthentication();
		String username = auth.getName();

		model.addAttribute("member", memberService.getMember(username));
		return "member/myPage";
	}

	@GetMapping("/member/mod")
	public String modForm(@RequestParam String username, Model model) {
		model.addAttribute("member", memberService.getMember(username));
		model.addAttribute("modMember", new ModMember());
		return "member/modMember";
	}

	@PostMapping("/member/mod")
	public String modMyinfo(@Validated @ModelAttribute ModMember modMember, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "member/modMember";
		}

		memberService.modifyMember(modMember);

		return "redirect:/member/myPage";
	}

//	@GetMapping(value = "/logout")
//	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		if (auth != null) {
//			new SecurityContextLogoutHandler().logout(request, response, auth);
//		}
//		return "redirect:/login?logout";
//	}

	@PostMapping(value = "/member/quit")
	public String quitMember(@RequestParam String username, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			memberService.removeMember(username);
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?quit";
	}

}
