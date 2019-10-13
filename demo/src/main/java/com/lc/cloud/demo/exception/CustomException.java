package com.lc.cloud.demo.exception;

import lombok.Getter;
import lombok.Setter;

public class CustomException extends RuntimeException {

    @Getter
    @Setter
    private String code;

    public CustomException(String code, String message) {
        super(message);
        this.code = code;
    }

    public CustomException(String code, Throwable cause) {
        super(cause);
        this.code = code;
    }

    public CustomException(String code, String message, Throwable cause) {
        super(message, cause);
        this.code = code;
    }
}
