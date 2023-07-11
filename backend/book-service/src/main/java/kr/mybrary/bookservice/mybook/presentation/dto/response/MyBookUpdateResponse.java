package kr.mybrary.bookservice.mybook.presentation.dto.response;

import java.time.LocalDateTime;
import kr.mybrary.bookservice.mybook.persistence.ReadStatus;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MyBookUpdateResponse {

    private ReadStatus readStatus;

    private LocalDateTime startDateOfPossession;

    private boolean showable;
    private boolean exchangeable;
    private boolean shareable;
}
