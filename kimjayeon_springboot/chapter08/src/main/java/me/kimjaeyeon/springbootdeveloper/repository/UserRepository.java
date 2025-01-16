package me.kimjaeyeon.springbootdeveloper.repository;

import me.kimjaeyeon.springbootdeveloper.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByEmail(String email);

}
/*
    이메일로 사용자를 식별 가능, 즉 email을 username으로 봐도 됩니다. 따라서 사용자 정보를 가져오기 위해서는
    스프링 시큐리티가 이메일로 전달받아야 합니다. 스프링 데이터 JPA는 메서드 규칙에 맞춰서 선언하면
    이름을 분석해 자동으로 쿼리(SQL문)을 생성해줍니다.

    findByEmail() 메서드는 실제 데이터베이스에 회원 정보를 요청할 때 다음 쿼리를 실행합니다.

    findByEmail() 메서드가 요청하는 쿼리의 예시

    FROM user
    WHERE email = #{email}

    자주 사용하는 쿼리 메서드의 명명 규칙
    -> 깃허브에서 빼오세요


    서비스 메서드 코드를 작성할 예정 -> service 패키지에 UserDetailService.java 파일 생성하세요

 */
