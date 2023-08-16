package kr.mybrary.userservice.authentication.domain.exception;

import kr.mybrary.userservice.global.exception.ApplicationException;

public class InvalidRefreshTokenException extends ApplicationException {

    private final static int STATUS = 400;
    private final static String ERROR_CODE = "A-03";
    private final static String ERROR_MESSAGE = "유효하지 않은 리프레쉬 토큰입니다.";

    public InvalidRefreshTokenException() {
        super(STATUS, ERROR_CODE, ERROR_MESSAGE);
    }
}
