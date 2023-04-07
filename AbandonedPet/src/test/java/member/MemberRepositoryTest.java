package member;

import com.ap.member.MemberRepository;
import com.ap.member.MemberRepositoryImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class MemberRepositoryTest {

    @Autowired
    public SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    MemberRepository memberRepository = new MemberRepositoryImpl(sqlSessionTemplate);

    @Test
    public void deleteTest() {

        System.out.println("result = " + memberRepository.deleteMember("test"));

    }




}
