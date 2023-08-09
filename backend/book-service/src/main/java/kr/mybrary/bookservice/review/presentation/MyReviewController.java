package kr.mybrary.bookservice.review.presentation;

import kr.mybrary.bookservice.global.dto.response.SuccessResponse;
import kr.mybrary.bookservice.review.domain.MyReviewReadService;
import kr.mybrary.bookservice.review.domain.MyReviewWriteService;
import kr.mybrary.bookservice.review.domain.dto.request.MyReviewOfMyBookGetServiceRequest;
import kr.mybrary.bookservice.review.domain.dto.request.MyReviewsOfBookGetServiceRequest;
import kr.mybrary.bookservice.review.presentation.dto.request.MyReviewCreateRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
@RequiredArgsConstructor
public class MyReviewController {

    private final MyReviewWriteService myReviewWriteService;
    private final MyReviewReadService myReviewReadService;

    @PostMapping("/mybooks/{myBookId}/reviews")
    public ResponseEntity create(@RequestHeader("USER-ID") String loginId,
            @PathVariable Long myBookId,
            @RequestBody MyReviewCreateRequest request) {

        myReviewWriteService.create(request.toServiceRequest(loginId, myBookId));

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(SuccessResponse.of(HttpStatus.CREATED.toString(), "마이 리뷰를 작성했습니다.", null));
    }

    @GetMapping("/books/{isbn13}/reviews")
    public ResponseEntity getReviewsFromBook(@PathVariable String isbn13) {

        MyReviewsOfBookGetServiceRequest request = MyReviewsOfBookGetServiceRequest.of(isbn13);

        return ResponseEntity.status(HttpStatus.OK)
                .body(SuccessResponse.of(HttpStatus.OK.toString(), "도서의 리뷰 목록입니다.",
                        myReviewReadService.getReviewsFromBook(request)));
    }

    @GetMapping("/mybooks/{myBookId}/review")
    public ResponseEntity getReviewFromMyBook(@PathVariable Long myBookId) {

        MyReviewOfMyBookGetServiceRequest request = MyReviewOfMyBookGetServiceRequest.of(myBookId);

        return ResponseEntity.status(HttpStatus.OK)
                .body(SuccessResponse.of(HttpStatus.OK.toString(), "마이북에 대한 리뷰입니다.",
                        myReviewReadService.getReviewFromMyBook(request)));
    }
}