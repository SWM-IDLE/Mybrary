package kr.mybrary.userservice.interest.persistence.repository;

import kr.mybrary.userservice.interest.persistence.Interest;
import kr.mybrary.userservice.interest.persistence.InterestCategory;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.ActiveProfiles;

import java.util.ArrayList;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertAll;

@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@ActiveProfiles("test")
@DataJpaTest
class InterestCategoryRepositoryTest {

    @Autowired
    private InterestCategoryRepository interestCategoryRepository;
    @Autowired
    private InterestRepository interestRepository;
    @Autowired
    private TestEntityManager entityManager;

    @Test
    @DisplayName("페치 조인을 사용하여 관심사 카테고리와 관심사를 가져온다.")
    void findAllWithInterestUsingFetchJoin() {
        InterestCategory interestCategory = InterestCategory.builder()
                .id(1L)
                .name("interestCategory1")
                .description("interestCategory1Description")
                .interests(new ArrayList<>())
                .build();

        interestCategoryRepository.save(interestCategory);

        Interest interest1 = Interest.builder()
                .id(1L)
                .name("interest1")
                .category(interestCategory)
                .build();
        interest1.updateCategory(interestCategory);

        interestRepository.save(interest1);

        entityManager.flush();
        entityManager.clear();

        // when
        List<InterestCategory> foundInterestCategories = interestCategoryRepository.findAllWithInterestUsingFetchJoin();

        // then
        assertAll(
                () -> assertThat(foundInterestCategories).isNotNull(),
                () -> assertThat(foundInterestCategories.get(0).getId()).isEqualTo(interestCategory.getId()),
                () -> assertThat(foundInterestCategories.get(0).getName()).isEqualTo(interestCategory.getName()),
                () -> assertThat(foundInterestCategories.get(0).getDescription()).isEqualTo(interestCategory.getDescription()),
                () -> assertThat(foundInterestCategories.get(0).getInterests().size()).isEqualTo(interestCategory.getInterests().size()),
                () -> assertThat(foundInterestCategories.get(0).getInterests().get(0).getId()).isEqualTo(interestCategory.getInterests().get(0).getId()),
                () -> assertThat(foundInterestCategories.get(0).getInterests().get(0).getName()).isEqualTo(interestCategory.getInterests().get(0).getName())
        );
    }
}