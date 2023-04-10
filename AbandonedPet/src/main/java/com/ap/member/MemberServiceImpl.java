package com.ap.member;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ap.mail.MailService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepository;
	private final MailService mailService;
	private final BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Override
	public boolean createMember(Member member) {
		return (memberRepository.insertMember(member) != 0) ? true : false;
	}

	@Override
	public Member getMember(String username) {
		return memberRepository.selectMember(username);
	}

	@Override
	public List<Member> getMemberList(Criteria cri) {
		return memberRepository.selectMemberList(cri);
	}

	@Override
	public boolean modifyMember(ModMember modMember) {
		return (memberRepository.updateMember(modMember) != 0) ? true : false;
	}

	@Override
	public boolean removeMember(String username) {
		return (memberRepository.deleteMember(username) != 0) ? true : false;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return memberRepository.selectTotalCount(cri);
	}

	
	
	@Override
	public boolean changeTmpPw(Member member) {
		
		String tempPw = generateTempPassword();
		
		String encodedTmpPw = bcryptPasswordEncoder.encode(tempPw);
		member.setPassword(encodedTmpPw);
		
		boolean result = (memberRepository.updatePassword(member) != 0) ? true : false;
		if (result) {
			mailService.sendMailForPw(member.getUsername(), tempPw);
		}
		return result;
		
	}
	
    // 랜덤한 임시 비밀번호 생성하는 메소드
    public static String generateTempPassword() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[10];
        random.nextBytes(bytes);
        return Base64.getEncoder().encodeToString(bytes);
    }

	@Override
	public boolean modifyPassword(Member member) {
		member.setPassword(bcryptPasswordEncoder.encode(member.getPassword()));
		
		return (memberRepository.updatePassword(member) != 0) ? true : false;
	}

	@Override
	public boolean modifyAuth(String username, String auth) {
		
		Member member = new Member();
		member.setUsername(username);
		member.setAuthority(auth);
		
		return (memberRepository.updateAuth(member) != 0) ? true : false;
	}
}
