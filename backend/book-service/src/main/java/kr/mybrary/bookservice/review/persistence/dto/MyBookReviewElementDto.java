package kr.mybrary.bookservice.review.persistence.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MyBookReviewElementDto {

    private Long id;
    private String userId;
    private String content;
    private Double starRating;
    private LocalDateTime createdAt;
}