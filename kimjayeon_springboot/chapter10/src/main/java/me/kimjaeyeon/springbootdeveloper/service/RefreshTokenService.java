package me.kimjaeyeon.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.kimjaeyeon.springbootdeveloper.domain.RefreshToken;
import me.kimjaeyeon.springbootdeveloper.repository.RefreshTokenRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RefreshTokenService {
    private final RefreshTokenRepository refreshTokenRepository;

    public RefreshToken findByRefreshToken(String refreshToken) {
        return refreshTokenRepository.findByRefreshToken(refreshToken)
                .orElseThrow(() -> new IllegalArgumentException("unexpected token"));
    }
    // TokenService.java 만들어서 리프레시 토큰 유효성 검사 진행하고, 리프레시 토큰으로 유저 ID 찾을겁니다
    // 유저 ID로 해당 유저 찾은 후에 generateToken() 메서드 호출을 통해서 새로운 엑세스 토큰을 생성
}
