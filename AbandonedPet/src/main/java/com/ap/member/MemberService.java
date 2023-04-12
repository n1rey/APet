package com.ap.member;

import java.util.List;
import java.util.Map;


public interface MemberService {

	boolean createMember(Member member);
	
	Member getMember(String username);
	
	List<Member> getMemberList(Criteria cri);
	
	boolean modifyMember(ModMember modMember);
	
	boolean removeMember(String username);

	int getTotalCount(Criteria cri);

	int getAllMemberCount();

	boolean changeTmpPw(Member member);
	
	boolean modifyPassword(Member member);
	
	boolean modifyAuth(String username, String auth);
	
}
