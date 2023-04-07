package com.ap.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberRepositoryImpl implements MemberRepository {

	private final SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertMember(Member member) {
		int result = this.sqlSessionTemplate.insert("members.insert", member);
		return result;
	}

	@Override
	public Member selectMember(String username) {
		return this.sqlSessionTemplate.selectOne("members.select", username);
	}

	@Override
	public List<Member> selectMemberList(Criteria cri) {
		return this.sqlSessionTemplate.selectList("AdminMapper.selectListPaging", cri);
	}

	@Override
	public int updateMember(ModMember modMember) {
		return this.sqlSessionTemplate.update("members.update", modMember);
	}

	@Override
	public int deleteMember(String username) {
		return this.sqlSessionTemplate.delete("members.delete", username);
	}

	@Override
	public int selectTotalCount(Criteria cri) {
		return this.sqlSessionTemplate.selectOne("AdminMapper.totalCount", cri);
	}
	
}
