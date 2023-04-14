package com.ap.member;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

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

	@GetMapping("/join")
	public String joinForm(Model model) {
		model.addAttribute("member", new Member());
		return "users/joinform";
	}

	@PostMapping("/join")
	public String joinMember(@Validated @ModelAttribute Member member, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {

		if (!member.getPassword().equals(member.getPasswordConfirm())) {
			bindingResult.reject("pwConfirm", "비밀번호가 일치하지 않습니다.");
		}
		
		if (bindingResult.hasErrors()) {
			return "users/joinform";
		}

		// 회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);

		memberService.createMember(member);
		
		//로그아웃 처리
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/login?join";
	}

	@PostMapping("/kakaoForm")
	public String joinkakaoForm(@ModelAttribute Member member) {
		return "users/joinKakao";
	}
	
	@PostMapping("/joinKakao")
	public String joinkakao(@Validated @ModelAttribute Member member, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {
		
		if (!member.getPassword().equals(member.getPasswordConfirm())) {
			bindingResult.reject("pwConfirm", "비밀번호가 일치하지 않습니다.");
		}
		
		if (bindingResult.hasErrors()) {
			return "users/joinKakao";
		}

		// 회원 정보 디비 등록시 비번을 암호화 스프링 시큐리티 필수 사항
		String encodedPassword = bcryptPasswordEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);

		memberService.createMember(member);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/login?join";
	}
	
	@GetMapping("/member/myPage")
	public String myPage(Model model) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication auth = securityContext.getAuthentication();
		
		String username = null;
		
		if(auth.getPrincipal() instanceof Member) {
			Member principal = (Member) auth.getPrincipal();
			username = principal.getUsername();
		} else {
			username = auth.getName();
		}
		model.addAttribute("member", memberService.getMember(username));

		return "member/myPage";
	}

	@GetMapping("/member/mod")
	public String modForm(Model model) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication auth = securityContext.getAuthentication();
		String username = null;
		

		if(auth.getPrincipal() instanceof Member) {
			Member principal = (Member) auth.getPrincipal();
			username = principal.getUsername();
		} else {
			username = auth.getName();
		}
		
		Member member = memberService.getMember(username);
		
		ModMember modMember = new ModMember();
		modMember.setUsername(username);
		modMember.setMname(member.getMname());
		modMember.setMnickname(member.getMnickname());
		modMember.setMphone(member.getMphone());
		
		model.addAttribute("modMember", modMember);
		return "member/modMember";
	}

	@PostMapping("/member/mod")
	public String modMyinfo(@Validated @ModelAttribute ModMember modMember, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "member/modMember";
		}

		memberService.modifyMember(modMember);

		return "redirect:/member/myPage?mod";
	}

	@GetMapping(value = "/logout")
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	@PostMapping(value = "/member/quit")
	public String quitMember(@RequestParam String username, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			memberService.removeMember(username);
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/login?quit";
	}
	
	@GetMapping("/pwfind")
	public String findPassword() {
		return "users/pwfind";
	}

	@PostMapping("/pwfind")
	@ResponseBody
	public String sendMail(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Member member) throws IOException {
		if (memberService.changeTmpPw(member)) {
			return "success";
		} 
		return "fail";
	}
	
	@GetMapping("/member/modPw")
	public String modMyPwForm(Model model) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication auth = securityContext.getAuthentication();
		String username = null;
		
		if(auth.getPrincipal() instanceof Member) {
			Member principal = (Member) auth.getPrincipal();
			username = principal.getUsername();
		} else {
			username = auth.getName();
		}
		
		ModPwMember modPwMember = new ModPwMember();
		modPwMember.setUsername(username);
		
		model.addAttribute("modPwMember", modPwMember);
		return "member/pwModForm";
	}
	
	@PostMapping("/member/modPw")
	public String modMyPw(@Validated @ModelAttribute ModPwMember modPwMember, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) {
		
		
		if (!modPwMember.getPassword().equals(modPwMember.getPasswordConfirm())) {
			bindingResult.reject("pwConfirm", "비밀번호가 일치하지 않습니다.");
		}
		
		if (bindingResult.hasErrors()) {
			return "member/pwModForm";
		}
		
		Member member = new Member();
		member.setUsername(modPwMember.getUsername());
		member.setPassword(modPwMember.getPassword());
		
		memberService.modifyPassword(member);

		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if (auth != null) {
	            new SecurityContextLogoutHandler().logout(request, response, auth);
	        }
		
		return "redirect:/login?modPw";
	}
	
	@PostMapping("/kakao")
	@ResponseBody
	public String loginCheckKakao(HttpServletRequest request, HttpServletResponse response, @RequestParam String username) {
		Member member = memberService.getMember(username);

		if (member != null) {
			//디비에 있는 사용자이므로 로그인 세션처리
			//독자적인 처리가 아니라 스프링 시큐리티 규격에 맞게 세션처리
			List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
			list.add(new SimpleGrantedAuthority(member.getAuthority()));

			SecurityContext sc = SecurityContextHolder.getContext();
			sc.setAuthentication(new UsernamePasswordAuthenticationToken(member, null, list));
//			// user이름으로 해야됨!!!!, null 패스워드 , list 권한 설정

			HttpSession session = request.getSession(true);

			session.setAttribute(
					HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
			
			return "success";
		} else {
			System.out.println("디비에 회원정보 없음");
			return "fail";
		}
		      
	}
	
	
}
