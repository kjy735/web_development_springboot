package me.kimjaeyeon.springbootdeveloper.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Entity
public class RefreshToken {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", updatable = false)
    private Long id;

    @Column(name = "user_id", nullable = false, unique = true)  // 중복 아이디로 가입 불가능
    private Long userId;

    @Column(name = "refresh_token", nullable = false)
    private String refreshToken;

    public RefreshToken(Long userId, String refreshToken) {
        this.userId = userId;
        this.refreshToken = refreshToken;
    }

    // 얘가 어떤 작용을 하는지는 리프레시 토큰 정의 부분 읽어주세요
    public RefreshToken update(String refreshToken) {
        this.refreshToken = refreshToken;
        return this;
    }
    /*
        repository package -> RefreshTokenRepository.java
     */
}
