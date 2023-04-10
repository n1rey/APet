package com.ap.member;

import java.util.List;

public interface MemberRepository {

	int insertMember(Member member);

	Member selectMember(String username);
	
	List<Member> selectMemberList(Criteria cri);
	
	int updateMember(ModMember modMember);
	
	int deleteMember(String username);
	
	int selectTotalCount(Criteria cri);
	
	int updatePassword(Member member);
	
	int countIdDuplicated(String username);
	
	int updateAuth(Member member);
	
}
