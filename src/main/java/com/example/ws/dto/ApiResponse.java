package com.example.ws.dto;

public class ApiResponse<T> {
    private String status;
    private T data;
    private String error;
    private Integer code;

    public ApiResponse(String status, T data, String error, Integer code) {
        this.status = status;
        this.data = data;
        this.error = error;
        this.code = code;
    }

    public ApiResponse(String status, T data, String error) {
        this(status, data, error, null);
    }

    // Getters and Setters
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}