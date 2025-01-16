package me.kimjaeyeon.springbootdeveloper.service;

import lombok.RequiredArgsConstructor;
import me.kimjaeyeon.springbootdeveloper.config.jwt.TokenProvider;
import me.kimjaeyeon.springbootdeveloper.domain.User;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
@RequiredArgsConstructor
public class TokenService {

    private final TokenProvider tokenProvider;
    private final RefreshTokenService refreshTokenService;
    private final UserService userService;

    public String createdNewAccessToken(String refreshToken) {
        // 토큰 유효성 검사에 실패하면 예외 발생
        if(!tokenProvider.validToken(refreshToken)) {
            throw new IllegalArgumentException("unexpected token");
        }

        Long userId = refreshTokenService.findByRefreshToken(refreshToken).getuserId();
        User user = userService.findById(userId);

        return tokenProvider.generateToken(user, Duration.ofHours(2));
    }
    /*
        이상에서 토큰 생성 및 유효성 검증 로직 작성 -> 실제로 토큰을 발급받는 API를 생성

        토큰 생성 요청 및 응답을 담당할 DTO
        CreateAccessTokenRequest.java
        CreateAccessTokenResponse.java
     */
}
