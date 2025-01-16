package me.kimjaeyeon.springbootdeveloper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestService {

    @Autowired
    MemberRepository memberRepository;  // 1. 빈 주입 / 객체 생성

    public List<Member> getAllMembers() {
        return memberRepository.findAll();  // 2. 멤버 목록 얻기  // 왜 findAll()인가에 주목해야함
    }

}
