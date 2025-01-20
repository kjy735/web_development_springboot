package me.kimjaeyeon.springbootdeveloper.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import me.kimjaeyeon.springbootdeveloper.domain.Article;

@NoArgsConstructor
@AllArgsConstructor
@Getter
public class AddArticleRequest {

    private String title;
    private String content;

    public Article toEntity(String author){  // 생성자를 이용해 객체를 생성
        return Article.builder()
                .title(title)
                .content(content)
                .author(author)
                .build();
    }

}
