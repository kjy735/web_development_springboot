package me.kimjaeyeon.springbootdeveloper.controller;

import lombok.RequiredArgsConstructor;
import me.kimjaeyeon.springbootdeveloper.domain.Article;
import me.kimjaeyeon.springbootdeveloper.dto.AddArticleRequest;
import me.kimjaeyeon.springbootdeveloper.dto.ArticleResponse;
import me.kimjaeyeon.springbootdeveloper.dto.UpdateArticleRequest;
import me.kimjaeyeon.springbootdeveloper.service.BlogService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class BlogApiController {

    private final BlogService blogService;

    // HTTP 메서드가 POST 일 때 전달 받은 URL과 동일하면 지금 정의하는 메서드와 매핑
    @PostMapping("/api/articles")
    // @RequestBody로 요청 본문 값 매핑
    public ResponseEntity<Article> addArticle(@RequestBody AddArticleRequest request) {
        Article savedArticle = blogService.save(request);

        return ResponseEntity.status(HttpStatus.CREATED).body(savedArticle);
    }


    @GetMapping("/api/articles")
    public ResponseEntity<List<ArticleResponse>> findAllArticles() {
        List<ArticleResponse> articles = blogService.findAll()
                .stream()
                .map(ArticleResponse::new)
                .toList();

        return ResponseEntity.ok().body(articles);
    }

    @GetMapping("/api/articles/{id}")
    // URL 경로에서 값을 추출
    public ResponseEntity<ArticleResponse> findArticle(@PathVariable long id) { // URL에서 {id}에 해당하는 값이 id로 들어옴
        Article article = blogService.findById(id);

        return ResponseEntity.ok()
                .body(new ArticleResponse(article));
    }
    /*
        @PathVariable : URL에서 값을 가져오는 애너테이션.
            /api/articles/3 GET 요청을 받으면 id에 3이 argument로 들어오게 됩니다.
            그리고 이 값은 바로 전에 만든 서비스 클래스의 findById() 메서드로 넘어가서 3번 블로그
            글을 찾아옵니다. 그리고 그 글을 찾으면 3번 글의 정보(제목/내용)를 body 담아서
            웹브라우저 가지고 옵니다.
     */

    @DeleteMapping("/api/articles/{id}")
    public ResponseEntity<Void> deleteArticle(@PathVariable long id) {
        blogService.delete(id);

        return ResponseEntity.ok()
                .build();
    }
    /*
        @PathVariable 통해서 {id}에 해당하는 값이 들어옵니다.

        POSTMAN

        GET http://localhost:8080/api/articles

        조회했을 때 저희가 작성한 data.sql이 적용된
        제목1부터 내용3까지의 JSON 데이터가 있는지 확인하고,
        거기서 특정 아이디의 데이터를 삭제하겠습니다.

        조회 성공하셨으면
        DELETE로 HTTP 메서드를 바꿔주고,
        http://localhost:8080/api/articles/1 하고 Send 버튼 누릅니다.

        GET으로 HTTP 메서드 바꿔주고,
        http://localhost:8080/api/articles/1 -> 이건 지워졌기 때문에 조회 x


       http://localhost:8080/api/articles -> 얘로 조회해서 전체 글 목록이 줄었는지 확인

       다 확인 끝났으면 BlogApiControllerTest.java가서 테스트형태의 메서드로 삭제 확인
     */

    @PutMapping("/api/articles/{id}")
    public ResponseEntity<Article> updateArticle(@PathVariable long id, @RequestBody UpdateArticleRequest request) {
        Article updateArticle = blogService.update(id, request);

        return ResponseEntity.ok().body(updateArticle);
    }
    /*
        /api/articles/{id} PUT요청이 들어오면 Request Body 정보가 request로 넘어옵니다.
        그리고 다시 서비스 클래스의 update() 메서드와 id와 request를 넘겨줍니다.
        응답 값은 body에 담아 전송합니다.
     */

}