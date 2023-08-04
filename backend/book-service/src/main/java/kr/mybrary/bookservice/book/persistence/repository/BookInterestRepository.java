package kr.mybrary.bookservice.book.persistence.repository;

import java.util.Optional;
import kr.mybrary.bookservice.book.persistence.Book;
import kr.mybrary.bookservice.book.persistence.BookInterest;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookInterestRepository extends JpaRepository<BookInterest, Long> {

    Optional<BookInterest> findByBookAndUserId(Book book, String userId);
}
