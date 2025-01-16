package me.kimjaeyeon.springbootdeveloper.repository;

import me.kimjaeyeon.springbootdeveloper.domain.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BlogRepository extends JpaRepository<Article, Long> {
}
