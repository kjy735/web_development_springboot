package me.kimjaeyeon.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.kimjaeyeon.springbootdeveloper.domain.User;
import me.kimjaeyeon.springbootdeveloper.dto.AddUserRequest;
import me.kimjaeyeon.springbootdeveloper.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepository;
        // 비밀번호를 접근하기 어렵게 암호화 시켜주는 객체
    public Long save(AddUserRequest dto) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        return userRepository.save(User.builder()
                .email(dto.getEmail())
                // 1. 패스워드 암호화
                .password(encoder.encode(dto.getPassword()))
                        .build()).getId();

    }

    public User findById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("unexpected user"));
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("unexpected user"));
    }

}
