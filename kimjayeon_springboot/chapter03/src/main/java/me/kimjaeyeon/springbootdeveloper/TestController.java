package me.kimjaeyeon.springbootdeveloper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {

    @Autowired  // TestService Bean 주입
    TestService testService;

    @GetMapping("/test")    // 주소지 는 /test이다.
    public List<Member> getAllMembers() {
        List<Member> members = testService.getAllMembers(); // 메소드명
        return members;

    }
}
