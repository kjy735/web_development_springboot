package me.kimjaeyeon.springbootdeveloper;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController // 우리는 매우 자주 사용할 예정입니다.
public class QuizController {
    @GetMapping("/quiz")        // (1)
    public ResponseEntity<String> quiz(@RequestParam("code") int code) {
                                    // 요청 파라미터의 키가 "code"이면 int code와 매핑
        switch (code) {
            case 1:
                return ResponseEntity.created(null).body("Created!");
            case 2:
                return ResponseEntity.badRequest().body("Bad Resquest!");
            default:
                return ResponseEntity.ok().body("OK!");
        }
    }

    @PostMapping("/quiz")   // (2)
    public ResponseEntity<String> quiz2(@RequestBody Code code) {
                                    // 요청값을 Code라는 객체로 매핑 . value값에 따라 다른 응답을 보냄
        switch (code.value()) {
            case 1:
                return ResponseEntity.status(403).body("Forbidden!");
                                // 응답코드: 403 . 응답본문: "Forbidden!"
            default:
                return ResponseEntity.ok().body("OK!");
        }                       // 응답코드: 200 . 응답본문: "OK!"
    }
}


record Code(int value) {} //(3)
    // (2)를 매핑할 객체로 사용하기 위한 선언한 레코드
    // 데이터 전달을 목적으로 하는 객체를 더 빠르고 간편하게 만들기 위한 기능
    // 필드, 생성자, 게터, equals(), hashCode(), toString() 메서드 등을 자동 생성
/*
    QuizControllerTest.java 파일을 만들어보세요
 */