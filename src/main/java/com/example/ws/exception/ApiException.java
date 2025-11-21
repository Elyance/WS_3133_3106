package com.example.ws.exception;

public class ApiException extends RuntimeException {
    private final int code;
    private final String message;

    public ApiException(int code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}