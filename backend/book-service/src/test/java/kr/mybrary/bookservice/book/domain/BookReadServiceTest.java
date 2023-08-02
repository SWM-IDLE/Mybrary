package kr.mybrary.bookservice.book.domain;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.util.Optional;
import kr.mybrary.bookservice.book.BookDtoTestData;
import kr.mybrary.bookservice.book.BookFixture;
import kr.mybrary.bookservice.book.domain.dto.request.BookDetailServiceRequest;
import kr.mybrary.bookservice.book.persistence.repository.BookRepository;
import kr.mybrary.bookservice.booksearch.BookSearchDtoTestData;
import kr.mybrary.bookservice.booksearch.domain.PlatformBookSearchApiService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.ActiveProfiles;

@ActiveProfiles("test")
@ExtendWith(MockitoExtension.class)
class BookReadServiceTest {

    @InjectMocks
    private BookReadService bookReadService;

    @Mock
    private BookRepository bookRepository;

    @Mock
    private PlatformBookSearchApiService platformBookSearchApiService;


    @Test
    @DisplayName("DB애서 ISBN을 통해서 도서 상세 정보를 가져온다.")
    void getBookByISBN() {

        // given
        BookDetailServiceRequest request = BookDtoTestData.createBookDetailServiceRequest();
        given(bookRepository.findByISBNWithAuthorAndCategoryUsingFetchJoin(anyString(), anyString()))
                .willReturn(Optional.of(BookFixture.COMMON_BOOK.getBook()));

        // when
        bookReadService.getBookDetailByISBN(request);

        // then
        assertAll(
                () -> verify(bookRepository, times(1)).findByISBNWithAuthorAndCategoryUsingFetchJoin(anyString(), anyString()),
                () -> verify(platformBookSearchApiService, never()).searchBookDetailWithISBN(any())
        );
    }

    @Test
    @DisplayName("DB애서 ISBN을 통해서 도서 상세 조회 시, 도서가 존재 하지 않으면 도서 API를 호출한다.")
    void getEmptyOptionalWhenBookNotExist() {

        // given
        BookDetailServiceRequest request = BookDtoTestData.createBookDetailServiceRequest();
        given(bookRepository.findByISBNWithAuthorAndCategoryUsingFetchJoin(anyString(), anyString()))
                .willReturn(Optional.empty());
        given(platformBookSearchApiService.searchBookDetailWithISBN(any())).willReturn(
                BookSearchDtoTestData.createBookSearchDetailResponse());

        // when
        bookReadService.getBookDetailByISBN(request);

        // then
        assertAll(
                () -> verify(bookRepository, times(1)).findByISBNWithAuthorAndCategoryUsingFetchJoin(anyString(), anyString()),
                () -> verify(platformBookSearchApiService, times(1)).searchBookDetailWithISBN(any())
        );
    }
}