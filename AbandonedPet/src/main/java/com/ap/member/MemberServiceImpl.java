package com.ap.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository memberRepository;

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
}
